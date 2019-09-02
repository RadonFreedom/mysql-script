use d;

show character set;
show collation where charset regexp 'utf8mb4';

# 各种不同级别的默认字符集
show variables like 'character%';
# 各种不同级别的默认校对
show variables like 'collation%';

create table my_table (
  col  int not null auto_increment,
  col2 varchar(10) character set latin1,
  primary key (col)
)
  default char set hebrew;

show create table my_table;

drop table if exists my_table;


select *
from customers
order by cust_name
collate utf8mb4_0900_as_cs;


















