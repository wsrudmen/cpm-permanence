-- Permanences CPM - Equipe SUD : structure de la base (aucune donnée personnelle).
-- À coller dans Supabase : SQL Editor > New query > Run (une seule fois).
-- Ensuite, exécutez aussi le fichier supabase-donnees.sql (liste des membres), conservé en dehors du dépôt.

create table if not exists public.members (
  id text primary key,
  team text not null,
  name text not null,
  sort integer not null default 0
);

create table if not exists public.positions (
  date text not null,
  member text not null,
  status text not null check (status in ('yes', 'no')),
  done boolean not null default false,
  at timestamptz not null default now(),
  primary key (date, member)
);

create table if not exists public.journal (
  id bigint generated always as identity primary key,
  date text not null,
  member text not null,
  status text not null check (status in ('yes', 'no', 'none')),
  done boolean not null default false,
  at timestamptz not null default now()
);

alter table public.members enable row level security;
alter table public.positions enable row level security;
alter table public.journal enable row level security;

-- Les membres se lisent seulement (aucune écriture depuis le site)
drop policy if exists members_read on public.members;
create policy members_read on public.members
  for select to anon using (true);

drop policy if exists positions_all on public.positions;
create policy positions_all on public.positions
  for all to anon using (true) with check (true);

drop policy if exists journal_read on public.journal;
create policy journal_read on public.journal
  for select to anon using (true);

drop policy if exists journal_add on public.journal;
create policy journal_add on public.journal
  for insert to anon with check (true);

-- Mise à jour en direct dans les navigateurs ouverts
do $$
begin
  begin
    alter publication supabase_realtime add table public.positions;
  exception when duplicate_object then null;
  end;
  begin
    alter publication supabase_realtime add table public.journal;
  exception when duplicate_object then null;
  end;
end $$;
