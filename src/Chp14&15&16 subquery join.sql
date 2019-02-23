use d;

# CHP14 sub-query
# 列出订购物品TNT2的所有客户
select cust_id, cust_name, cust_contact
from customers
where cust_id in
      (select cust_id from orders where order_num in (select order_num from orderitems where prod_id REGEXP 'TNT2'))
order by cust_id;

# 每个客户的订单总数
select cust_name, cust_state, (select count(*) from orders where orders.cust_id = customers.cust_id) as order_num
from customers
order by cust_name;

# CHP15 INNER JOIN & 笛卡儿积
# 联结的创建非常简单，规定要联结的所有表以及它们如何关联即可
select vend_name, prod_name, prod_price
from vendors,
     products
where vendors.vend_id = products.vend_id
order by vend_name;

# 不用 where 结果会是笛卡儿积
select vend_name, prod_name, prod_price
from vendors,
     products
order by vend_name;

# 可以使用稍微不同的语法来明确指定联结的类型
select vend_name, prod_name, prod_price
from vendors
       inner join products on vendors.vend_id = products.vend_id
order by vend_name;

# SQL对一条SELECT语句中可以联结的表的数目没有限制
select vend_name, prod_name, prod_price, quantity
from vendors,
     products,
     orderitems
where vendors.vend_id = products.vend_id
  and products.prod_id = orderitems.prod_id;

select vend_name, prod_name, prod_price, sum(quantity) as prod_quantity
from vendors,
     products,
     orderitems
where vendors.vend_id = products.vend_id
  and products.prod_id = orderitems.prod_id
group by products.prod_id;

# 列出订购物品TNT2的所有客户
select cust_name, cust_contact
from customers,
     orders,
     orderitems
where orders.cust_id = customers.cust_id
  and orders.order_num = orderitems.order_num
  and prod_id regexp 'TNT2';

# CHP16
# SQL还允许给表名起别名
select cust_name, cust_contact
from customers as c,
     orders as o,
     orderitems as oi
where o.cust_id = c.cust_id
  and o.order_num = oi.order_num
  and prod_id regexp 'TNT2';

# 自联结
select p1.prod_id, p1.prod_name, p1.vend_id, p2.prod_id
from products as p1,
     products as p2
where p1.vend_id = p2.vend_id;

# 自然联结
# 迄今为止我们建立的每个内部联结都是自然联结，很可能我们永远都不会用到不是自然联结的内部联结
select c.*, o.order_num, o.order_date, oi.prod_id, oi.quantity, oi.item_price
from orderitems as oi,
     orders as o,
     customers as c
where o.cust_id = c.cust_id
  and oi.order_num = o.order_num
  and prod_id = 'FB';

# 外部联结 联结包含了那些在相关表中没有关联行的行
select c.cust_id, cust_name, order_num
from customers as c
       inner join orders as o on c.cust_id = o.cust_id;
# 使用关键字OUTER JOIN来指定联结的类型
select c.cust_id, cust_name, order_num
from customers as c
       left outer join orders as o on c.cust_id = o.cust_id;

# 使用带聚集函数的联结
# 检索所有客户及每个客户所下的订单数
select c.cust_id, cust_name, count(order_num) as num_ord
from customers as c
       left join orders as o on c.cust_id = o.cust_id
group by c.cust_id
order by c.cust_id;






































