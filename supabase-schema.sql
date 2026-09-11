-- Banco compartilhado para a aplicação de Gestão de Folha.
-- Esta versão foi desenhada para um único espaço de trabalho compartilhado.
create table if not exists public.app_state (
  id text primary key check (id = 'main'),
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

drop policy if exists "app_state_public_read" on public.app_state;
drop policy if exists "app_state_public_write" on public.app_state;

create policy "app_state_public_read"
  on public.app_state for select
  to anon, authenticated
  using (id = 'main');

create policy "app_state_public_write"
  on public.app_state for insert
  to anon, authenticated
  with check (id = 'main');

create policy "app_state_public_update"
  on public.app_state for update
  to anon, authenticated
  using (id = 'main')
  with check (id = 'main');

grant select, insert, update on public.app_state to anon, authenticated;
