
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
	user_id integer references users (id) on delete cascade, -- should probably create a function to populate an orders or invoices table
	product_id integer references products (id) on delete cascade,
	quantity integer not null default 1
);



-- trying it simpler with users table, products table, and a join table

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


select * from users;
select * from products;
select * from carts;

-- john buys some things
insert into carts values
(1, 1, 1),
(1, 3, 1),
(1, 4, 2),
(1, 2, 1);

-- view john's cart
select c.product_id, p.name, p.description, p.price, c.quantity from carts c 
	left join products p on c.product_id = p.id where c.user_id = 1;
	
-- get subtotal of john's cart
select sum(price) as subtotal from (
	select c.product_id, p.name, p.description, p.price, c.quantity from carts c 
	left join products p on c.product_id = p.id where c.user_id = 1
) as cart;










/* below is first attempt - too convoluted*/




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

select c.id as cart_id, c.user_id,  u.username from carts c join users u on c.user_id = u.id;


-- jen logs in? do we create and delete the cart each time? No - should store between sessions?... TBD
insert into carts values (default, 3);

-- jen adds some things to buy
insert into carts_products values 
(1, 1),
(1, 3),
(1, 4),
(1, 5);

-- john's cart
insert into carts values (default, 1);

-- john buys some things -> TODO: need a new column to track quantity of each item
insert into carts_products values 
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5);

-- bethany's cart
insert into carts values (default, 2);

-- bethany buys some things
insert into carts_products values 
(3, 2),
(3, 3),
(3, 5);

-- view the carts
-- jen's cart
select cp.cart_id , cp.product_id , c.user_id , p.name, p.description, p.price from carts_products cp
left join carts c on cp.cart_id = c.id 
left join products p on cp.product_id  = p.id
where user_id = 3;

-- john's cart
select cp.cart_id , cp.product_id , c.user_id , p.name, p.description, p.price  from carts_products cp
left join carts c on cp.cart_id = c.id 
left join products p on cp.product_id  = p.id
where user_id = 1;

-- bethany's cart
select cp.cart_id , cp.product_id , c.user_id , p.name, p.description, p.price  from carts_products cp
left join carts c on cp.cart_id = c.id 
left join products p on cp.product_id  = p.id
where user_id = 2;

-- does removing items work? 


