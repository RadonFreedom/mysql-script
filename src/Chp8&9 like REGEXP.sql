use d;

# CHP8
select prod_id, prod_name
from products
where prod_name like 'jet%';

select prod_id, prod_name
from products
where prod_name like '%jet%';

select prod_id, prod_name
from products
where prod_name like '%anvil%';

select prod_id, prod_name
from products
where prod_name like 's%e';

select prod_id, prod_name
from products
where prod_name like '_ ton anvil';

select prod_id, prod_name
from products
where prod_name like '% ton anvil';

#Chp9
select prod_id, prod_name
from products
where prod_name REGEXP '1000';

select prod_id, prod_name
from products
where prod_name REGEXP '.000';

select prod_id, prod_name
from products
where prod_name REGEXP BINARY 'JetPack .000';

select prod_id, prod_name
from products
where prod_name REGEXP '1000|2000|3000';

select prod_id, prod_name
from products
where prod_name REGEXP ' ton';

select prod_id, prod_name
from products
where prod_name REGEXP '[123] ton';

select prod_id, prod_name
from products
where prod_name REGEXP '[^123] ton';

select prod_id, prod_name
from products
where prod_name REGEXP '[1-5] ton';

select vend_name
from vendors
where vend_name regexp '\\.';

select prod_name
from products
where prod_name regexp '\\([0-9] sticks\\)';

select prod_name
from products
where prod_name regexp '\\([0-9] sticks?\\)';

select prod_name
from products
where prod_name regexp '\\([0-9] sticks*\\)';

create database c;

use c;

CREATE TABLE customers
(
  cust_name char(50) NOT NULL
);

insert into customers
values ('shittttt');

select cust_name from c.customers where c.customers.cust_name regexp 'shitt?';

select cust_name from c.customers where c.customers.cust_name regexp 'shitt*';

select cust_name from c.customers where c.customers.cust_name regexp 'shitt+';

select cust_name from c.customers where c.customers.cust_name regexp 'shitt{3}';

select cust_name from c.customers where c.customers.cust_name regexp 'shitt{4}';

use d;

select prod_name from d.products where prod_name regexp '[[:digit:]]{3}';

select prod_name from d.products where prod_name regexp '[:digt]{4}';

select prod_name from d.products where prod_name regexp '[0-9]{3}';

select prod_name from products where prod_name regexp '^[0-9]\\.';

select prod_name from products where prod_name regexp '^[0-9.]';

select prod_name from products where prod_name regexp '[0-9.]';

select prod_name from products where prod_name regexp '[0-9.]$';

select prod_name from products where prod_name regexp 's$';

select prod_name from products where prod_name like '%s%';

select prod_name from products where prod_name regexp 's';

select prod_name from products where prod_name regexp '^s';
