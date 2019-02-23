use d;

# CHP19 UPDATE DELETE
# 客户10005现在有了电子邮件地址
update customers
set cust_email = 'radon@gmail.com'
where cust_id = 10005;

select *
from customers
where cust_id = 10005;

update customers
set cust_name  = 'The Fudds',
    cust_email = 'radon@gmail.com'
where cust_id = 10005;

update customers
set cust_name  = 'E Fudd',
    cust_email = null
where cust_id = 10005;

# DELETE
delete
from customers
where cust_id = 10006;

select *
from customers;












































