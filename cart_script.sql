CREATE TYPE card_status AS ENUM ('OPEN', 'ORDERED');
create extension if not exists "uuid-ossp"

create table carts (
   id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
   user_id uuid NOT NULL,
   created_at DATE NOT NULL,
   updated_at DATE NOT NULL,
   status card_status
)

create table cart_items (
   product_id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
   cart_id uuid,
   count int,
   foreign key ("cart_id") references "carts" ("id")
)

insert into carts (user_id, created_at, updated_at, status) values ('4182a120-f372-41fb-bee4-21daa9f4051e', '2023-01-01', '2023-01-01', 'OPEN');
insert into carts (user_id, created_at, updated_at, status) values ('4182a120-f372-41fb-bee4-21daa9f4052e', '2023-01-02', '2023-01-02', 'OPEN');
insert into carts (user_id, created_at, updated_at, status) values ('4182a120-f372-41fb-bee4-21daa9f4051e', '2023-01-01', '2023-01-01', 'ORDERED');

insert into cart_items (cart_id, "count") values ('ad642458-8602-432a-8f76-c41037225d46', 1);
insert into cart_items (cart_id, "count") values ('b359db76-077a-4442-b7e7-19cc26130571', 2);
insert into cart_items (cart_id, "count") values ('ba5ea846-fa83-4456-8c3b-4cf1b7e6b153', 3);
