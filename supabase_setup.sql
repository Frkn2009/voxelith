-- ============================================================
-- VOXELITH — Supabase kurulumu (v2)
-- SQL Editor → New query → BUNU yapıştır → RUN
--
-- Eski profiles tablosu farklı yapıdaysa (user_id kolonu yoksa)
-- otomatik olarak profiles_old diye yedeklenir, veri kaybolmaz.
-- Her çalıştırmada güvenlidir.
-- ============================================================

-- 0) Uyumsuz eski tabloyu yedekle (varsa)
do $$
begin
  if exists (select 1 from information_schema.tables
             where table_schema = 'public' and table_name = 'profiles')
     and not exists (select 1 from information_schema.columns
             where table_schema = 'public' and table_name = 'profiles'
               and column_name = 'user_id') then
    if exists (select 1 from information_schema.tables
               where table_schema = 'public' and table_name = 'profiles_old') then
      drop table public.profiles_old;
    end if;
    alter table public.profiles rename to profiles_old;
  end if;
end $$;

-- 1) Doğru yapıda profil tablosu
create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade
);

alter table public.profiles add column if not exists ui_lang text not null default 'tr';
alter table public.profiles add column if not exists learn_lang text not null default 'es';
alter table public.profiles add column if not exists motive text not null default 'travel';
alter table public.profiles add column if not exists cefr text not null default 'a1';
alter table public.profiles add column if not exists daily_goal_min int not null default 12;
alter table public.profiles add column if not exists onboarded boolean not null default false;
alter table public.profiles add column if not exists is_plus boolean not null default false;
alter table public.profiles add column if not exists streak int not null default 0;
alter table public.profiles add column if not exists last_practice_day_key text not null default '';
alter table public.profiles add column if not exists total_xp int not null default 0;
alter table public.profiles add column if not exists daily_xp int not null default 0;
alter table public.profiles add column if not exists xp_day_key text not null default '';
alter table public.profiles add column if not exists completed_scenes int not null default 0;
alter table public.profiles add column if not exists games_completed int not null default 0;
alter table public.profiles add column if not exists completed_languages jsonb not null default '[]';
alter table public.profiles add column if not exists achievements jsonb not null default '[]';
alter table public.profiles add column if not exists notifications_enabled boolean not null default true;
alter table public.profiles add column if not exists reminder_hour int not null default 19 check (reminder_hour in (10, 19));
alter table public.profiles add column if not exists theme_preference text not null default 'system';
alter table public.profiles add column if not exists phrases_known int not null default 0;
alter table public.profiles add column if not exists speak_seconds_used int not null default 0;
alter table public.profiles add column if not exists speak_day_key text not null default '';
alter table public.profiles add column if not exists bonus_speak_seconds int not null default 0;
alter table public.profiles add column if not exists ads_watched_today int not null default 0;
alter table public.profiles add column if not exists last_ad_epoch bigint not null default 0;
alter table public.profiles add column if not exists joined_event_id text not null default '';
alter table public.profiles add column if not exists learned_ids jsonb not null default '[]';
alter table public.profiles add column if not exists srs jsonb not null default '{}';
alter table public.profiles add column if not exists updated_at timestamptz not null default now();

-- 2) Satır güvenliği: herkes sadece kendi satırını görür/yazar
alter table public.profiles enable row level security;

drop policy if exists "profiles_select_own" on public.profiles;
create policy "profiles_select_own" on public.profiles
  for select using (auth.uid() = user_id);

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own" on public.profiles
  for insert with check (auth.uid() = user_id);

drop policy if exists "profiles_update_own" on public.profiles;
create policy "profiles_update_own" on public.profiles
  for update using (auth.uid() = user_id);

-- 3) Hesap silme: kullanıcı kendi hesabını tamamen silebilir
create or replace function public.delete_my_account()
returns void
language sql
security definer
set search_path = public
as $$
  delete from public.profiles where user_id = auth.uid();
  delete from auth.users where id = auth.uid();
$$;

grant execute on function public.delete_my_account() to authenticated;

-- 4) Plus yetkisi — yalnızca ödeme webhook'u / service role yazabilir.
-- İstemcideki profiles.is_plus görsel yerel durumu korur; ücretli sunucu
-- özelliklerinin güvenlik kararı bu tablodan verilir.
create table if not exists public.subscriptions (
  user_id uuid primary key references auth.users(id) on delete cascade,
  provider text not null,
  provider_customer_id text,
  status text not null check (status in ('trialing', 'active', 'past_due', 'canceled', 'expired')),
  current_period_end timestamptz not null,
  updated_at timestamptz not null default now()
);

alter table public.subscriptions enable row level security;

drop policy if exists "subscriptions_select_own" on public.subscriptions;
create policy "subscriptions_select_own" on public.subscriptions
  for select using (auth.uid() = user_id);

-- Bilerek INSERT/UPDATE/DELETE policy yoktur. Bu işlemler ödeme webhook'u
-- tarafından SUPABASE_SERVICE_ROLE_KEY ile yapılmalıdır.

-- 5) Haftalık XP sıralaması
-- Ayrıntılı açıklamalar için: supabase/leaderboard.sql
alter table public.profiles add column if not exists display_name text;

create table if not exists public.xp_events (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  amount int not null check (amount > 0 and amount <= 2000),
  source text not null check (source in ('correct', 'scene', 'game', 'ad')),
  created_at timestamptz not null default now()
);
alter table public.xp_events drop constraint if exists xp_events_amount_check;
alter table public.xp_events add constraint xp_events_amount_check check (amount > 0 and amount <= 2000);
alter table public.xp_events drop constraint if exists xp_events_source_check;
alter table public.xp_events add constraint xp_events_source_check check (source in ('correct', 'scene', 'game', 'ad'));
create index if not exists xp_events_user_created_idx on public.xp_events(user_id, created_at desc);

create table if not exists public.leaderboard (
  week_start date not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  xp int not null default 0 check (xp >= 0),
  updated_at timestamptz not null default now(),
  primary key (week_start, user_id)
);
create index if not exists leaderboard_week_xp_idx on public.leaderboard(week_start, xp desc);

alter table public.xp_events enable row level security;
alter table public.leaderboard enable row level security;
drop policy if exists "xp_events_select_own" on public.xp_events;
create policy "xp_events_select_own" on public.xp_events for select using (auth.uid() = user_id);
drop policy if exists "leaderboard_read_authenticated" on public.leaderboard;
create policy "leaderboard_read_authenticated" on public.leaderboard for select to authenticated using (true);

create or replace function public.record_xp(p_amount int, p_source text)
returns void language plpgsql security definer set search_path = public as $$
declare
  v_user uuid := auth.uid();
  v_week date := date_trunc('week', timezone('utc', now()))::date;
begin
  if v_user is null then raise exception 'authentication_required'; end if;
  if p_source not in ('correct', 'scene', 'game', 'ad') then raise exception 'invalid_source'; end if;
  if (p_source = 'correct' and p_amount not in (10, 20))
     or (p_source = 'scene' and p_amount not in (50, 100))
     or (p_source = 'game' and (p_amount < 20 or p_amount > 2000)) or (p_source = 'ad' and p_amount <> 20) then
    raise exception 'invalid_xp_amount';
  end if;
  insert into public.xp_events(user_id, amount, source) values (v_user, p_amount, p_source);
  insert into public.leaderboard(week_start, user_id, xp) values (v_week, v_user, p_amount)
  on conflict (week_start, user_id) do update
    set xp = public.leaderboard.xp + excluded.xp, updated_at = now();
  insert into public.clan_xp(clan_id, user_id, week_start, xp)
    select member.clan_id, v_user, v_week, p_amount
    from public.clan_members member where member.user_id = v_user
  on conflict (clan_id, user_id, week_start) do update
    set xp = public.clan_xp.xp + excluded.xp;
end;
$$;
revoke all on function public.record_xp(int, text) from public;
grant execute on function public.record_xp(int, text) to authenticated;

create or replace function public.get_weekly_leaderboard(p_limit int default 10)
returns table (rank bigint, user_id uuid, player_name text, xp int, is_me boolean)
language sql security definer stable set search_path = public as $$
  with ranked as (
    select dense_rank() over (order by board.xp desc, board.updated_at asc) as rank,
      board.user_id,
      coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(board.user_id::text, 4))) as player_name,
      board.xp
    from public.leaderboard board
    left join public.profiles profile on profile.user_id = board.user_id
    where board.week_start = date_trunc('week', timezone('utc', now()))::date
  )
  select ranked.rank, ranked.user_id, ranked.player_name, ranked.xp,
    ranked.user_id = auth.uid() as is_me
  from ranked
  where ranked.rank <= greatest(1, least(p_limit, 100)) or ranked.user_id = auth.uid()
  order by ranked.rank, ranked.user_id;
$$;
revoke all on function public.get_weekly_leaderboard(int) from public;
grant execute on function public.get_weekly_leaderboard(int) to authenticated;

-- 6) Plus aile planı profilleri
create table if not exists public.family_profiles (
  user_id uuid not null references auth.users(id) on delete cascade,
  profile_id text not null,
  profile_name text not null,
  profile_data jsonb not null default '{}',
  updated_at timestamptz not null default now(),
  primary key (user_id, profile_id)
);
alter table public.family_profiles enable row level security;
drop policy if exists "family_profiles_select_own" on public.family_profiles;
create policy "family_profiles_select_own" on public.family_profiles
  for select using (auth.uid() = user_id);
drop policy if exists "family_profiles_insert_own" on public.family_profiles;
create policy "family_profiles_insert_own" on public.family_profiles
  for insert with check (auth.uid() = user_id);
drop policy if exists "family_profiles_update_own" on public.family_profiles;
create policy "family_profiles_update_own" on public.family_profiles
  for update using (auth.uid() = user_id);
drop policy if exists "family_profiles_delete_own" on public.family_profiles;
create policy "family_profiles_delete_own" on public.family_profiles
  for delete using (auth.uid() = user_id);

-- 7) Clan / takım sistemi
create table if not exists public.clans (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(name) between 3 and 32),
  join_code text not null unique,
  owner_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);
create table if not exists public.clan_members (
  clan_id uuid not null references public.clans(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  joined_at timestamptz not null default now(),
  primary key (clan_id, user_id),
  unique (user_id)
);
create table if not exists public.clan_xp (
  clan_id uuid not null references public.clans(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  week_start date not null,
  xp int not null default 0,
  primary key (clan_id, user_id, week_start)
);

alter table public.clans enable row level security;
alter table public.clan_members enable row level security;
alter table public.clan_xp enable row level security;

create or replace function public.create_clan(p_name text)
returns void language plpgsql security definer set search_path = public as $$
declare
  v_user uuid := auth.uid();
  v_clan uuid;
  v_code text;
begin
  if v_user is null then raise exception 'authentication_required'; end if;
  if char_length(trim(p_name)) not between 3 and 32 then raise exception 'invalid_name'; end if;
  if exists (select 1 from public.clan_members where user_id = v_user) then raise exception 'already_in_clan'; end if;
  loop
    v_code := upper(substr(md5(random()::text || clock_timestamp()::text), 1, 6));
    exit when not exists (select 1 from public.clans where join_code = v_code);
  end loop;
  insert into public.clans(name, join_code, owner_id)
    values (trim(p_name), v_code, v_user) returning id into v_clan;
  insert into public.clan_members(clan_id, user_id) values (v_clan, v_user);
end;
$$;

create or replace function public.join_clan(p_code text)
returns void language plpgsql security definer set search_path = public as $$
declare
  v_user uuid := auth.uid();
  v_clan uuid;
begin
  if v_user is null then raise exception 'authentication_required'; end if;
  if exists (select 1 from public.clan_members where user_id = v_user) then raise exception 'already_in_clan'; end if;
  select id into v_clan from public.clans where join_code = upper(trim(p_code));
  if v_clan is null then raise exception 'clan_not_found'; end if;
  insert into public.clan_members(clan_id, user_id) values (v_clan, v_user);
end;
$$;

create or replace function public.leave_clan()
returns void language plpgsql security definer set search_path = public as $$
declare
  v_user uuid := auth.uid();
  v_clan uuid;
  v_owner uuid;
begin
  select clan_id into v_clan from public.clan_members where user_id = v_user;
  if v_clan is null then return; end if;
  select owner_id into v_owner from public.clans where id = v_clan;
  if v_owner = v_user and (select count(*) from public.clan_members where clan_id = v_clan) > 1 then
    raise exception 'owner_cannot_leave';
  end if;
  if v_owner = v_user then delete from public.clans where id = v_clan;
  else delete from public.clan_members where clan_id = v_clan and user_id = v_user;
  end if;
end;
$$;

create or replace function public.get_my_clan()
returns table (
  clan_id uuid, clan_name text, join_code text, rank bigint,
  user_id uuid, player_name text, xp int, is_me boolean, is_owner boolean
)
language sql security definer stable set search_path = public as $$
  with mine as (
    select member.clan_id from public.clan_members member where member.user_id = auth.uid()
  ), ranked as (
    select member.clan_id, member.user_id,
      dense_rank() over (order by coalesce(points.xp, 0) desc, member.joined_at) as rank,
      coalesce(points.xp, 0)::int as xp
    from public.clan_members member
    join mine on mine.clan_id = member.clan_id
    left join public.clan_xp points on points.clan_id = member.clan_id
      and points.user_id = member.user_id
      and points.week_start = date_trunc('week', timezone('utc', now()))::date
  )
  select clan.id, clan.name, clan.join_code, ranked.rank, ranked.user_id,
    coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(ranked.user_id::text, 4))),
    ranked.xp, ranked.user_id = auth.uid(), clan.owner_id = ranked.user_id
  from ranked
  join public.clans clan on clan.id = ranked.clan_id
  left join public.profiles profile on profile.user_id = ranked.user_id
  order by ranked.rank, ranked.user_id;
$$;

revoke all on function public.create_clan(text) from public;
revoke all on function public.join_clan(text) from public;
revoke all on function public.leave_clan() from public;
revoke all on function public.get_my_clan() from public;
grant execute on function public.create_clan(text) to authenticated;
grant execute on function public.join_clan(text) to authenticated;
grant execute on function public.leave_clan() to authenticated;
grant execute on function public.get_my_clan() to authenticated;
