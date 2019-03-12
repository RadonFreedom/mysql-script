use d;

# CHP8
# like 中 % 匹配任意字符的任意次数
# like 只能完全匹配字符串，而不是字符串包含
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

# BINARY使 like 匹配时强制区分大小写，如果每次查询都需要大小写匹配请修改校对（collation）
select prod_id, prod_name
from products
where prod_name like BINARY 'JetPack _000';

#Chp9
# 检索出包含 1000 字符串的所有行
select prod_id, prod_name
from products
where prod_name REGEXP '1000';

# 检索出包含 .000 字符串的所有行，其中 . 可以是任意字符
select prod_id, prod_name
from products
where prod_name REGEXP '.000';

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
