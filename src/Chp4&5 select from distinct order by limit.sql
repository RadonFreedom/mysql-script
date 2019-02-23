use d;

# CHP4
select prod_name
from products;
select
  prod_name,
  prod_desc,
  prod_id
from products;
select *
from products;
select distinct vend_id
from products;
select prod_name
from products
limit 5;
select prod_name
from products
limit 0, 7;

# CHP5
use d;
select prod_name
from products
order by prod_name;
select
  prod_id,
  prod_price,
  prod_name
from products
order by prod_price, prod_name desc;
select
  prod_id,
  prod_price,
  prod_name
from products
order by prod_price desc, prod_name;
select prod_price
from products
order by prod_price desc
limit 0, 1;




