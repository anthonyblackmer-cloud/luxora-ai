// Luxora concierge — OpenAI proxy (keeps API key server-side).
// Deploy: supabase secrets set OPENAI_API_KEY=sk-...
//         supabase functions deploy concierge-chat

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
};

function buildSystemPrompt(ctx: TripContext): string {
  const lines = [
    "You are Luxora — an emotionally intelligent luxury travel concierge.",
    "You plan trips around how the traveler wants to FEEL, not checklist tourism.",
    "Be warm, specific, and concise (2–4 short paragraphs max unless they ask for detail).",
    "Recommend only from the curated place list when suggesting venues; cite place titles naturally.",
    "Never invent theme park ticket prices — suggest Ticket Savings in the app for deals.",
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
