use d;

# CHP10 拼接字段，算数运算
select CONCAT(vend_name, ' (', vend_country, ')')
from vendors
order by vend_name;

select CONCAT(vend_name, ' (', RTRIM(vend_country), ')')
from vendors
order by vend_name;

select CONCAT(vend_name, ' (', vend_country, ')') as vend_title
from vendors
order by vend_name;

select prod_name as Porsche, prod_price as Maserati
from products
where prod_price = 2.5;

select prod_id, item_price, quantity
from orderitems
where order_num = 20005;

select prod_id, item_price, quantity, item_price * quantity as expanded_price
from orderitems
where order_num = 20005
order by expanded_price desc;

select trim(' abc ') as foo1, ltrim(' abc ') as foo2, rtrim(' abc ') as foo3;

select now() as time;

# CHP11 常用的数据处理函数
# 文本处理函数
select vend_name, upper(vend_name)vend_name_upcase
from vendors;

select cust_name, cust_contact
from customers
where cust_contact sounds like 'Y Li';

select cust_name, cust_contact
from customers
where soundex(cust_contact) = soundex('Y Li');

select concat(current_date, ' ', current_time) as current;
select now() as time;

# 日期和时间处理函数
select cust_id, order_num
from orders
where order_date = '2005-09-01';
select cust_id, order_num
from orders
where date(order_date) = '2005-09-01';

select cust_id, order_num
from orders
where date(order_date) between '2005-09-01' and '2005-09-30';

select cust_id, order_num
from orders
where month(order_date) = 9
  and year(order_date) = 2005;

# CHP12 汇总数据
# aggregate function 聚集函数

# 下面的例子使用AVG()返回products表中所有产品的平均价格
select avg(prod_price) as avg_price
from products;
# AVG()也可以用来确定特定列或行的平均值
select avg(prod_price) as avg_price
from products
where vend_id = 1003;

# 下面的例子返回customers表中客户的总数
select count(*) as cust_num
from customers;
# 下面的例子只对具有电子邮件地址的客户计数
select count(cust_email) as num_cust_email
from customers;

# MAX()返回指定列中的最大值。MAX()要求指定列名
select max(prod_price) as max_price
from products;
select max(prod _name)
from products;
select min(prod_price) as min_price
from products;
select min(prod_name)
from products;

# 可如下检索所订购物品的总数（所有quantity值之和）
select sum(quantity) as quantity_order_num_20005
from orderitems
where order_num = 20005;
select quantity as quantity_order_num_20005
from orderitems
where order_num = 20005;
# SUM()也可以用来合计计算值。在下面的例子中，合计每项物品的item_price*quantity，得出总的订单金额
select sum(item_price * quantity) as total_price_order_num_20005
from orderitems
where order_num = 20005;

# 下面的例子使用AVG()函数返回特定供应商提供的产品的平均价格。它与上面的SELECT语句相同，但使用了DISTINCT参数，因此平均值只考虑各个不同的价格
select avg(distinct prod_price) as avg_price
from products
where vend_id = 1003;
select distinct prod_price as avg_price
from products
where vend_id = 1003;
#DISTINCT必须使用列名
select count(distinct prod_price)
from products
where vend_id = 1003;

# 可根据需要包含多个聚集函数
select count(*) as num_items,
       min(prod_price) as price_min,
       max(prod_price) as price_max,
       avg(prod_price) as avg_price
from products;






















