use d;

show tables;

# start transaction; rollback;
select *
from order_totals;

start transaction;
delete
from order_totals;
select *
from order_totals;
rollback;

select *
from order_totals;

# start transaction; commit;
select *
from orders,
     orderitems
where orders.order_num = orderitems.order_num
  and orders.order_num = 20009;

start transaction;
delete
from orderitems
where order_num = 20009;
delete
from orders
where order_num = 20009;
commit;

select *
from orders,
     orderitems
where orders.order_num = orderitems.order_num
  and orders.order_num = 20009;

# savepoint insert1;  rollback to insert1;
select *
from customers,
     orders
where orders.cust_id = customers.cust_id;

start transaction;
insert into customers (cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
values ('M. Martian', '42 Galaxy Way', 'New York', 'NY', '11213', 'USA');

savepoint insert1;
insert into orders (order_date, cust_id)
values (current_date, last_insert_id());

select *
from customers,
     orders
where orders.cust_id = customers.cust_id
  and orders.order_num = last_insert_id();

rollback to insert1;

select *
from customers,
     orders
where orders.cust_id = customers.cust_id
  and orders.order_num = last_insert_id();

































