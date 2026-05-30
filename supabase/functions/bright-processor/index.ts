// Luxora concierge — OpenAI proxy (keeps API key server-side).
// Deploy: npx supabase secrets set OPENAI_API_KEY=sk-...
//         npx supabase functions deploy bright-processor --no-verify-jwt

import OpenAI from "npm:openai@4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

type ChatMessage = { role: "user" | "assistant"; content: string };

type PlaceHint = {
  id: string;
  title: string;
  category: string;
  location: string;
  moodTags?: string[];
};

type TripContext = {
  cityId: string;
  cityName: string;
  region: string;
  locale: string;
  tripFeel?: string;
  moods?: string[];
  stylePrefs?: string[];
  budgetUsd?: number;
  adults?: number;
  kids?: number;
  occasion?: string;
  places?: PlaceHint[];
  ticketDeals?: TicketDealHint[];
  savedTrips?: SavedTripHint[];
};

type SavedTripHint = {
  title: string;
  dateRange: string;
  status: string;
};

type TicketDealHint = {
  id: string;
  title: string;
  discountPriceUsd: number;
  savingsUsd: number;
  sourceName: string;
  placeId?: string;
};

function buildSystemPrompt(ctx: TripContext): string {
  const lines = [
    "You are Luxora — an emotionally intelligent luxury travel concierge.",
    "You plan trips around how the traveler wants to FEEL, not checklist tourism.",
    "Be warm, specific, and concise (2–4 short paragraphs max unless they ask for detail).",
    "When the traveler describes what they want, suggest a sequenced day using curated places — the app automatically builds their Map day flow and Timeline from your recommendations.",
    "Do not paste a full hour-by-hour schedule, numbered stop list, or timeline in chat unless they explicitly ask to see the full agenda or schedule written out here.",
    "Default to how the day should feel plus 2–3 highlight stops; point them to Map and Timeline for the full plan.",
    "Recommend only from the curated place list when suggesting venues; cite place titles naturally.",
    "When the traveler asks to save their trip, confirm it is saved to the Trips tab — the app handles persistence automatically.",
    "When they ask about saved trips, summarize from savedTrips in context and point them to the Trips tab.",
    "When the traveler asks about tickets, deals, or best prices, recommend specific offers from the ticketDeals list — the app attaches authorized reseller links to matching Timeline stops automatically.",
    "Never invent ticket prices or reseller URLs — use only ticketDeals figures and sourceName values from context.",
    "If theme parks come up and they may not have the add-on, mention Gems and non-park magic too.",
    "",
    `Active destination: ${ctx.cityName}, ${ctx.region} (pack: ${ctx.cityId}).`,
    `Respond in locale: ${ctx.locale}.`,
  ];

  if (ctx.tripFeel?.trim()) {
    lines.push(`Trip feel they want: "${ctx.tripFeel.trim()}".`);
  }
  if (ctx.moods?.length) {
    lines.push(`Moods: ${ctx.moods.join(", ")}.`);
  }
  if (ctx.stylePrefs?.length) {
    lines.push(`Style memory: ${ctx.stylePrefs.join(" · ")}.`);
  }
  if (ctx.budgetUsd) {
    lines.push(
      `Party: ${ctx.adults ?? 2} adults${ctx.kids ? `, ${ctx.kids} kids` : ""}; budget ~$${ctx.budgetUsd}.`,
    );
  }
  if (ctx.occasion) {
    lines.push(`Occasion: ${ctx.occasion}.`);
  }
  if (ctx.places?.length) {
    lines.push("", "Curated places you may reference:");
    for (const p of ctx.places.slice(0, 18)) {
      const tags = p.moodTags?.length ? ` [${p.moodTags.join(", ")}]` : "";
      lines.push(`- ${p.title} (${p.category}, ${p.location})${tags}`);
    }
  }
  if (ctx.ticketDeals?.length) {
    lines.push("", "Authorized ticket deals (app adds links to Timeline):");
    for (const d of ctx.ticketDeals.slice(0, 10)) {
      lines.push(
        `- ${d.title}: $${d.discountPriceUsd} via ${d.sourceName} (save ~$${d.savingsUsd})`,
      );
    }
  }
  if (ctx.savedTrips?.length) {
    lines.push("", "Traveler's saved trips (Trips tab):");
    for (const t of ctx.savedTrips.slice(0, 6)) {
      lines.push(`- ${t.title} (${t.dateRange}) — ${t.status}`);
    }
  }

  return lines.join("\n");
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const apiKey = Deno.env.get("OPENAI_API_KEY");
    if (!apiKey) {
      return new Response(
        JSON.stringify({ error: "OPENAI_API_KEY not configured on server" }),
        { status: 503, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const body = await req.json();
    const messages = body.messages as ChatMessage[] | undefined;
    const context = body.context as TripContext | undefined;

    if (!messages?.length || !context) {
      return new Response(
        JSON.stringify({ error: "messages and context required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    const openai = new OpenAI({ apiKey });
    const completion = await openai.chat.completions.create({
      model: Deno.env.get("OPENAI_MODEL") ?? "gpt-4o-mini",
      messages: [
        { role: "system", content: buildSystemPrompt(context) },
        ...messages.map((m) => ({ role: m.role, content: m.content })),
      ],
      max_tokens: 900,
      temperature: 0.72,
    });

    const reply = completion.choices[0]?.message?.content?.trim();
    if (!reply) {
      return new Response(
        JSON.stringify({ error: "Empty model response" }),
        { status: 502, headers: { ...corsHeaders, "Content-Type": "application/json" } },
      );
    }

    return new Response(JSON.stringify({ reply }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (e) {
    const message = e instanceof Error ? e.message : "Unknown error";
    return new Response(JSON.stringify({ error: message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
