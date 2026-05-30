-- Allow the mobile app (anon key) to read active curated places.

alter table public.places enable row level security;

drop policy if exists "Public read active places" on public.places;

create policy "Public read active places"
  on public.places
  for select
  using (is_active = true);
