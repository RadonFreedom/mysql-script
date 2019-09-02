use d;

# CHP6
select prod_name,
       prod_price
from products
where prod_price = 2.5;
select prod_name,
       prod_price
from products
where prod_name = 'fuses';
select prod_name,
       prod_price
from products
where prod_price > 10
order by prod_price asc;
select prod_name,
       prod_price
from products
where prod_price >= 10
order by prod_price asc;
select vend_id,
       prod_name
from products
where vend_id != 1003;

select prod_name,
       prod_price
from products
where prod_price between 5 and 10;

select cust_id,
       cust_name
from customers
where cust_email is null;

# CHP7
select prod_id,
       prod_name,
       prod_price,
       prod_desc
from products
where prod_price <= 10
  and vend_id = 1003
  and prod_desc is not null
order by prod_price desc;

select prod_name,
       prod_price
from products
where vend_id = 1002
   or vend_id = 1003;

select vend_id,
       prod_name,
       prod_price
from products
where vend_id = 1002
   or (vend_id = 1003 and prod_price > 10);

select vend_id,
       prod_name,
       prod_price
from products
where (vend_id = 1002 or vend_id = 1003)
  and prod_price > 10;

select prod_name,
       prod_price
from products
where vend_id in (1002, 1003)
order by prod_name;

select prod_name,
       prod_price
from products
where vend_id not in (1002, 1003)
order by prod_name;























