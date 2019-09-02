use d;

# case when
create table scores (
  name    varchar(50) not null,
  subject varchar(50) not null,
  score   int         not null,
  primary key (name, subject)
);

insert into scores (name, subject, score)
values ('g1', 'math', 100),
       ('g1', 'ch', 60),
       ('mi', 'math', 90),
       ('mi', 'ch', 60),
       ('g1', 'eng', 90),
       ('mi', 'eng', 90);

create table weights (
  subject varchar(50) not null,
  percent float       not null,
  primary key (subject)
);

insert into weights (subject, percent)
values ('math', 0.5),
       ('ch', 0.05),
       ('eng', 0.45);

select sum(case when stu_scores.score between 0 and 59 then 1 else 0 end) / count(*)   as 0to59,
       sum(case when stu_scores.score between 60 and 89 then 1 else 0 end) / count(*)  as 60to89,
       sum(case when stu_scores.score between 90 and 100 then 1 else 0 end) / count(*) as 90to100
from (select sum(score * percent) as score
      from scores,
           weights
      where scores.subject like weights.subject
      group by name) as stu_scores;


# 字符集和like regexp匹配大小写的关系
create table account
(
  id int not null auto_increment,
  name varchar(50) binary not null,
  primary key (id)
);

show create table account;

insert into account (name)
values ('radon');
insert into account (name)
values ('Radon');
select name from account where name like 'radon';
select name FROM account WHERE name REGEXP 'radon';

alter table account modify name varchar(50) not null ;
show create table account;

select name from account where name like 'radon';
select name FROM account WHERE name REGEXP 'radon';

drop table account;

# 数据库和表名的大小写敏感与否？
show global variables like '%lower_case%';





