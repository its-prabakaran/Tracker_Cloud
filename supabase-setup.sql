-- Run this in Supabase Dashboard > SQL Editor.
create table if not exists public.ledger_snapshots (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"borrowers":[],"transactions":[]}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.ledger_snapshots enable row level security;
drop policy if exists "Users read own ledger" on public.ledger_snapshots;
drop policy if exists "Users insert own ledger" on public.ledger_snapshots;
drop policy if exists "Users update own ledger" on public.ledger_snapshots;
create policy "Users read own ledger" on public.ledger_snapshots for select using (auth.uid() = user_id);
create policy "Users insert own ledger" on public.ledger_snapshots for insert with check (auth.uid() = user_id);
create policy "Users update own ledger" on public.ledger_snapshots for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
