use d;

# 视图的最常见的应用之一是隐藏复杂的SQL，这通常都会涉及联结
create view product_customers as
  select cust_name, cust_contact, prod_id
  from customers,
       orders,
       orderitems
  where orders.cust_id = customers.cust_id
    and orders.order_num = orderitems.order_num;


select cust_name, cust_contact
from product_customers
where prod_id regexp 'TNT2';

select *
from product_customers;

# 用视图重新格式化检索出的数据
select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')') as vend_title
from vendors
order by vend_title;

create view vendor_locations as
  select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')') as vend_title
  from vendors
  order by vend_title;

# 查看view
show table status where Comment = 'view';

show create view product_customers;

# 用视图过滤不想要的数据
create view customer_emails as
  select cust_id, cust_name, cust_email
  from customers
  where cust_email is not null;

show table status where Comment = 'view';

select *
from customer_emails;

# 使用视图与计算字段
create view orderitems_expended as
  select order_num, prod_id, quantity, item_price, quantity * item_price as expended_price
  from orderitems;

select *
from orderitems_expended
where order_num = 20005;


















