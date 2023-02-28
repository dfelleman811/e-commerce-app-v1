
drop table if exists users cascade;
drop table if exists products cascade;
drop table if exists carts cascade;
drop table if exists carts_products cascade;


create table users (
	id serial primary key,
	username varchar
);



create table products (
	id serial primary key,
	name varchar not null,
	description varchar not null,
	price float not null,
	quantity integer
);


create table carts (
	id serial primary key,
	user_id integer references users (id) on delete cascade -- should probably create a function to populate an orders or invoices table
);

create table carts_products (
	cart_id integer references carts (id) on delete cascade,
	product_id integer references products (id) on delete cascade
);

insert into users values 
(default, 'john'),
(default, 'bethany'),
(default, 'jen');


insert into products values 
(default, 'hat', 'hat with logo', 29.99, 40),
(default, 'jeans', 'acid wash jeans', 49.99, 30),
(default, 'ski jacket', 'it''s super warm', 129.99, 20),
(default, 'coffee mug', 'use it for tea!', 19.99, 140),
(default, 'cat bed', 'they''ll still sit on your keyboard', 49.99, 20);


--demo users' carts
select * from users;

-- jen logs in? do we create and delete the cart each time? No - should store between sessions... TBD
insert into carts values (default, 3);

-- jen adds some things to buy
insert into carts_products values 
(1, 1),
(1, 3),
(1, 4),
(1, 5);

-- john buys some things -> TODO: need a new column to track quantity of each item
insert into carts_products values 
(1, ),


-- view the carts
select * from carts_products cp
left join carts c on cp.cart_id = c.id 
left join products p on cp.product_id  = p.id
where user_id = 3;



-- does removing items work? 


