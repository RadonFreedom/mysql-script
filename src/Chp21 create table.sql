create schema c;
use c;

create table employees (
  emplee_id      int      not null auto_increment,
  emplee_name    char(50) not null,
  emplee_payment int      NOT NULL default 1500,
  primary key (emplee_id)
)
  engine = InnoDB;

insert into employees (emplee_id, emplee_name)
values (1000, 'Radon');

insert into employees (emplee_name, emplee_payment)
values ('Xenon', 1200);

select last_insert_id();

select last_insert_id(10);
select last_insert_id();

# 注释的代码说明了 MyISAM引擎不支持外键
#
# create table employers (
#   empler_id int not null auto_increment,
#   emplee_id int not null,
#   primary key (empler_id)
# )
#   engine = MyISAM;
#
# ALTER TABLE employers
#   ADD CONSTRAINT fk_employers_employees FOREIGN KEY (emplee_id) REFERENCES c.employees (emplee_id);
#
# 从下面语句返回结果中可以发现 table c.employers 中没有 FOREIGN KEY 约束
# show create table c.employers;
#
# drop table employers;


create table employers (
  empler_id int not null auto_increment,
  emplee_id int not null,
  primary key (empler_id),
  foreign key fk__ (emplee_id) references employers (emplee_id)
)
  engine = InnoDB;

drop table employers;

show create table employers;

# ONSTRAINT `employers_ibfk_1` FOREIGN KEY (`emplee_id`) REFERENCES `employees` (`emplee_id`)
# CONSTRAINT `fk_products_vendors` FOREIGN KEY (`vend_id`) REFERENCES `vendors` (`vend_id`);

rename table
    employees to sht;
rename table
    sht to employees;


























































