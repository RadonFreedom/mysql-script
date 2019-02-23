use d;

# 一个返回产品平均价格的存储过程
create procedure product_pricing()
  begin
    select avg(prod_price) as avg_price from products;
  end;

call product_pricing();

show procedure status where Db = 'd';

show create procedure product_pricing;

drop procedure if exists product_pricing;


create procedure product_pricing(
  out pl decimal(8, 2),
  out ph decimal(8, 2),
  out pa decimal(8, 2)
)
  begin
    select min(prod_price) into pl from products;
    select avg(prod_price) into pa from products;
    select max(prod_price) into ph from products;
  end;

call product_pricing(@pricelow, @pricehigh, @priceavg);

select @priceavg;
select @priceavg, @pricehigh, @pricelow;


create procedure order_total(
  in  ord_num   int,
  out ord_total decimal(8, 2)
)
  begin
    select sum(item_price * quantity)
        into ord_total from orderitems where order_num = ord_num;
  end;

call order_total(20005, @ord_total);

select @ord_total;

drop procedure if exists order_total;


# Name: order_total
# Parameters: ...
create procedure order_total(
  in  ord_num   int,
  in  taxable   boolean,
  out ord_total decimal(8, 2)
)
  comment 'Obtain order total, optionally adding tax'
  begin

    declare total decimal(8, 2);
    declare taxrate int default 6;

    select sum(item_price * quantity)
        into total from orderitems where order_num = ord_num;

    if taxable
    then
      select total + total / 100 * taxrate into total;
    end if;

    select total into ord_total;

  end;

call order_total(20005, 0, @total);
select @total;

show create procedure order_total;
show procedure status where Db = 'd';


# CHP24 CURSOR
# 定义了名为ordernumbers的游标，使用了可以检索所有订单的SELECT语句
create procedure process_orders()
  begin
    declare order_number cursor
    for
      select order_num from orders;

    open order_number;

    close order_number;
  end;

drop procedure if exists process_orders;

# 第一个例子从游标中检索单个行
create procedure process_orders()
  begin
    declare done boolean default 0;
    declare o int;
    declare t decimal(8, 2);

    declare order_number cursor
    for
      select order_num from orders;

    declare continue handler for sqlstate '02000' set done = 1;

    create table order_totals (
      order_num int not null,
      total     decimal(8, 2)
    );

    open order_number;

    repeat

      fetch order_number
      into o;

      call order_total(o, 1, t);

      insert into order_totals (order_num, total) values (o, t);

    until done end repeat;

    close order_number;
  end;


drop table order_totals;
call process_orders();

select *
from order_totals order by order_num;


























