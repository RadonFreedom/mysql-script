use d;

# CHP19 INSERT
insert into customers
values (null, 'Pep E. LaPew', '100 Main Street', 'LA', 'CA', '90046', 'USA', NULL, NULL);

# 编写INSERT语句的更安全（不过更烦琐）的方法
insert into customers (cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
values ('Pep E. LaPew', '100 Main Street', 'LA', 'CA', '90046', 'USA', NULL, NULL);
delete
from customers
where cust_id > 10006;

# 下面的INSERT语句填充所有列（与前面的一样），但以一种不同的次序填充
insert into customers (cust_country, cust_contact, cust_email, cust_name, cust_address, cust_city, cust_state, cust_zip)
values ('USA', NULL, NULL, 'Pep E. LaPew', '100 Main Street', 'LA', 'CA', '90046');
delete
from customers
where cust_id > 10006;

# 省略不填充值的列
insert into customers (cust_country, cust_name, cust_address, cust_city, cust_state, cust_zip)
values ('USA', 'Pep E. LaPew', '100 Main Street', 'LA', 'CA', '90046');
delete
from customers
where cust_id > 10006;

# 插入多行
# 只要每条INSERT语句中的列名（和次序）相同，可以如下组合
insert into customers (cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
values ('Pep E. LaPew', '100 Main Street', 'LA', 'CA', '90046', 'USA'),
       ('M. Martian', '42 Galaxy Way', 'New York', 'NY', '11213', 'USA');
delete
from customers
where cust_id > 10006;

# 插入检索出的数据
# 从另一表中合并客户列表到你的customers表。不需要每次读取一行，然后再将它用INSERT插入
########################
# Create custnew table
########################
CREATE TABLE custnew
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL,
  cust_address char(50)  NULL,
  cust_city    char(50)  NULL,
  cust_state   char(5)   NULL,
  cust_zip     char(10)  NULL,
  cust_country char(50)  NULL,
  cust_contact char(50)  NULL,
  cust_email   char(255) NULL,
  PRIMARY KEY (cust_id)
)
  ENGINE = InnoDB;

##########################
# Populate customers table
##########################
INSERT INTO custnew (cust_id,
                     cust_name,
                     cust_address,
                     cust_city,
                     cust_state,
                     cust_zip,
                     cust_country,
                     cust_contact,
                     cust_email)
VALUES (10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com'),
       (10002, 'Mouse House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse', null),
       (10003, 'Wascals', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'),
       (10004, 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com'),
       (10005, 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', null);


insert into customers (cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
select cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country,
       cust_contact,
       cust_email
from custnew;

delete
from customers
where cust_id > 10006;

delete
from custnew
where cust_id > 10005;









































