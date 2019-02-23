use d;

# CHP13 分 组 数 据
select prod_id, vend_id, count(*) as prod_num
from products
group by vend_id
order by prod_num;

select cust_id, count(*) as num_order
from orders
group by cust_id
having num_order >= 2;

# wrong expression
# select prod_price, vend_id, count(*) as num_prod
# from products
# group by vend_id
# having prod_price >= 10 and num_prod >= 2;

# 检索总计订单价格大于等于50的订单的订单号和总计订单价格
select order_num, sum(item_price * quantity) as total_price
from orderitems
group by order_num
having total_price >= 50
order by total_price;































































































