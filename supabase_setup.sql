-- Run this whole script in Supabase SQL Editor.
create table if not exists public.products (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 name text not null,
 price numeric(12,2) not null default 0,
 image_url text,
 affiliate_url text not null,
 description text default '',
 active boolean not null default true,
 created_at timestamptz not null default now()
);
create table if not exists public.click_events (
 id bigint generated always as identity primary key,
 product_id uuid references public.products(id) on delete set null,
 created_at timestamptz not null default now()
);
create table if not exists public.order_notes (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 product_id uuid references public.products(id) on delete set null,
 product_name text not null,
 order_value numeric(12,2) not null default 0,
 commission numeric(12,2) not null default 0,
 status text not null default 'Pending' check(status in ('Pending','Approved','Cancelled')),
 created_at timestamptz not null default now()
);
alter table public.products enable row level security;
alter table public.click_events enable row level security;
alter table public.order_notes enable row level security;
create policy "Public can view active products" on public.products for select using (active=true or auth.uid()=user_id);
create policy "Owner inserts products" on public.products for insert to authenticated with check(auth.uid()=user_id);
create policy "Owner updates products" on public.products for update to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
create policy "Owner deletes products" on public.products for delete to authenticated using(auth.uid()=user_id);
create policy "Visitors can record product clicks" on public.click_events for insert to anon, authenticated with check (
 exists(select 1 from public.products p where p.id=product_id and p.active=true)
);
create policy "Owner reads clicks on own products" on public.click_events for select to authenticated using (
 exists(select 1 from public.products p where p.id=product_id and p.user_id=auth.uid())
);
create policy "Owner manages order notes" on public.order_notes for all to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
