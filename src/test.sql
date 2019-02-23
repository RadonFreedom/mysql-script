use d;

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

show engines;


use d;

show tables;


show create table scores;

use d;
show table status like 'cus%';









