use d;

alter table archive_orders partition by hash ( order_num ) partitions 8;

show create table archive_orders;

explain select * from archive_orders where order_num > 2009;