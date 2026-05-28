# Luxora — Product refinements

## Gems vs Feed (implemented)

| Tab | Role | Content |
|-----|------|---------|
| **Gems** | Curated secret discoveries | Why special, best time, crowd level, insider tips, local-only notes |
| **Feed** | Dynamic social discovery | Trending, new openings, creator picks, seasonal, viral aesthetics, live updates |

Different visual language: gold / diamond (Gems) vs ocean / trending (Feed).

## Concierge quick prompts (implemented)

Horizontal chips: Romantic getaway, Wellness reset, Family magic, Hidden luxury, Foodie adventure, Soft luxury escape, Adventure mode, Disney after-dark.

## Map AI roadmap (UI scaffolded)

- Mood-based routes  
- Drive-time optimization  
- Weather-aware + rainy backup  
- Best sunset right now  
- Crowd prediction  
- Nearby hidden gems on route  
- Personalized routing from trip profile  

## Monetization / affiliates (placeholders)

Natural embed points on Gem and Feed cards:

- Hotels & staycations  
- Experiences & tours  
- Restaurant reservations  
- Theme park tickets  
- ResortPass / day passes  
- Car rentals  
- Wellness bookings  

Implement via partner APIs (Booking, OpenTable, Viator, etc.) without breaking emotional tone — “Reserve this moment” not banner ads.

## Naming options (test matrix)

| Name | Pros | Cons |
|------|------|------|
| **Luxora** | Short, App Store friendly, icon-friendly | Less descriptive alone |
| Luxora AI | Clear AI positioning | Longer subtitle |
| Luxora Escape | Emotional, vacation-first | Narrower than full product |
| Luxora Travel | Obvious category | More generic OTA feel |
| Luxora Concierge | Premium, differentiated | Long for icon label |

**Current in-app:** header “Luxora” + screen “Concierge”. App title: `Luxora`. TestFlight can A/B subtitle: “AI Travel Companion” vs “Your Florida Escape”.

## Session style memory (implemented — local)

Concierge remembers preferences for the active trip session:

- Less crowded · Luxury but not flashy · Nature + wellness only · Walkable when possible
- Auto-captured from natural language (“less crowded”, “walkable”, etc.)
- Surfaced in AI replies: “I’m honoring your style: …”
- Cloud sync across devices — Phase 2 (Supabase)

## Trips dashboard (implemented — sample data)

Saved trips show living metadata:

`8 experiences · Route optimized · Romantic · Sunset-ready · Clear evenings Thu–Sat`

## Visual coding (implemented)

- **Gems:** muted stone/champagne gradients, soft badges — quiet insider intelligence
- **Feed:** cyan/coral/live green, bolt icon, live card glow — discovery energy

## Concierge copy (latest)

- Welcome: “Choose a prompt below, or describe the feeling you want **your** trip to create.”
- Input: “Describe the feeling you want your trip to create…”

## Style memory — product differentiator

Multi-select personality layers (10 chips): Less crowded, Hidden luxury, Slow mornings, No tourist traps, Nature heavy, Aesthetic dining, Family-easy logistics, etc.

**Future:** persist as trip profile in Supabase; shape Gems, Feed, map routing, and timeline generation.

## Trips — expandable preview (implemented)

Tap saved trip → live snapshot: weather, next experience, sunset window, timeline, link to full itinerary.

## Map flagship roadmap

Current powers + **AI navigation layer:** crowd heat, parking friction, drive friction score, spontaneous reroute, “worth it right now?”

## Overall direction

Emotion-first AI travel companion — premium, cinematic, not a logistics dashboard. Florida MVP validates product; architecture supports national expansion.
