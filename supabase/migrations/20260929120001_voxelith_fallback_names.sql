-- Leaderboard, klan ve klan sohbetinde görünen adı olmayan kullanıcıların
-- yedek adını eski marka "NURA XXXX"ten "VOXELITH XXXX"e çevirir.
-- Fonksiyon gövdeleri önceki tanımlarla aynı; yalnızca yedek ad değişti.

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
grant execute on function public.get_weekly_leaderboard(int) to authenticated;

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


create or replace function public.get_clan_messages(p_limit int default 50)
returns table (
  id bigint, user_id uuid, player_name text, text text, created_at timestamptz, is_me boolean
)
language sql security definer stable set search_path = public as $$
  select msg.id, msg.user_id,
    coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(msg.user_id::text, 4))),
    msg.text, msg.created_at, msg.user_id = auth.uid()
  from public.clan_messages msg
  join public.clan_members member on member.clan_id = msg.clan_id and member.user_id = auth.uid()
  left join public.profiles profile on profile.user_id = msg.user_id
  order by msg.created_at desc
  limit least(greatest(p_limit, 1), 100);
$$;
grant execute on function public.get_clan_messages(int) to authenticated;
