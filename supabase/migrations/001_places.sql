-- Luxora Phase 1 — curated place media (Supabase Storage + public metadata)

create table if not exists public.places (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  category text not null,
  storage_path text,
  image_url text,
  location text not null default '',
  description text not null default '',
  mood_tags text[] not null default '{}',
  aspect_role text not null default 'hero'
    check (aspect_role in ('hero', 'card', 'thumb')),
  sort_order int not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists places_category_idx on public.places (category);
create index if not exists places_mood_tags_gin on public.places using gin (mood_tags);

comment on table public.places is
  'Curated hero imagery for Feed, Gems, Timeline thumbs, and trip mood covers.';

-- Storage bucket: luxora-places (public read). Path example: heroes/winter-park-rooftop.jpg
