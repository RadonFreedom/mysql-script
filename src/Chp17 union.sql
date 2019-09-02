use d;

# CHP17 组合查询
# 给出每条SELECT语句，在各条语句之间放上关键字UNION
select vend_id, prod_id, prod_name, prod_price
from products
where prod_price <= 5
union
select vend_id, prod_id, prod_name, prod_price
from products
where vend_id in (1002, 1001);

# 使用UNION ALL，MySQL不取消重复的行
select vend_id, prod_id, prod_name, prod_price
from products
where prod_price <= 5
union all
select vend_id, prod_id, prod_name, prod_price
from products
where vend_id in (1002, 1001);

# 在用UNION组合查询时，只能使用一条ORDER BY子句，它必须出现在最后一条SELECT语句之后
select vend_id, prod_id, prod_name, prod_price
from products
where prod_price <= 5
union
select vend_id, prod_id, prod_name, prod_price
from products
where vend_id in (1002, 1001)
order by vend_id, prod_price;



























































































