-- Paste this entire file into Supabase Dashboard → SQL Editor → Run.
-- Safe to re-run (uses IF NOT EXISTS / IF EXISTS where possible).

-- 001 — places table
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

-- 002 — geo + Unsplash fields
alter table public.places
  add column if not exists latitude double precision,
  add column if not exists longitude double precision,
  add column if not exists unsplash_photo_id text,
  add column if not exists external_id text;

create unique index if not exists places_external_id_idx
  on public.places (external_id)
  where external_id is not null;

-- 003 — RLS (anon read for active rows)
alter table public.places enable row level security;

drop policy if exists "Public read active places" on public.places;

create policy "Public read active places"
  on public.places
  for select
  using (is_active = true);
