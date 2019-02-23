use d;

# INSERT TRIGGER
create trigger new_order
  after insert
  on orders
  for each row select new.order_num into @new_order_num;

insert into orders (order_date, cust_id)
VALUES (NOW(), 10001);

select @new_order_num;

delete
from orders
where order_num = @new_order_num;

# DELETE TRIGGER
# 使用OLD保存将要被删除的行到一个存档表中
show create table orders;

CREATE TABLE archive_orders (
  `order_num`  int(11)  NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `cust_id`    int(11)  NOT NULL,
  PRIMARY KEY (`order_num`)
)
  ENGINE = InnoDB;

show tables;

create trigger delete_order
  before delete
  on orders
  for each row insert into archive_orders (order_num, order_date, cust_id)
               values (OLD.order_num, old.order_date, old.cust_id);

select *
from archive_orders;

show triggers;


# UPDATE TRIGGER
create trigger update_vendor
  before update
  on vendors
  for each row
  set new.vend_state = upper(new.vend_state);

select *
from vendors;

update vendors
set vend_state = 'ca'
where vend_id = 1005;

select *
from vendors
where vend_id = 1005;






















































