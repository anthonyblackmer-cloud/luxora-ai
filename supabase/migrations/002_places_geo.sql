-- Geo + Unsplash fields for Orlando-radius discovery and app sync.

alter table public.places
  add column if not exists latitude double precision,
  add column if not exists longitude double precision,
  add column if not exists unsplash_photo_id text,
  add column if not exists external_id text;

create unique index if not exists places_external_id_idx
  on public.places (external_id)
  where external_id is not null;

comment on column public.places.external_id is
  'Stable app catalog id, e.g. place-wekiwa-springs — matches lib/data/curated_places_catalog.dart';

comment on column public.places.unsplash_photo_id is
  'Unsplash photo id for API hotlink compliance';
