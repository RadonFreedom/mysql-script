# create view 总表 as
#   select 姓名, sum(学分 * 学分点) / sum(学分) as avg_gpa
#   from 自动化zy1601
#   group by `﻿学号`
# order by avg_gpa;

# create view grade_1 as
# select * from grades where 学分点 = 1;
#
# start transaction;
# delete
#   from grades where 学分点 = 0;
# savepoint del1;
#
# create view summary as
# select 班级名称, 姓名, 学号, sum(学分), sum(学分* 学分点)/sum(学分) as gpa, min(学分点)
#
# from grades
#   group by 学号
# order by 班级名称;


use grade;
# 删除空白行
delete
from grades_all
where `﻿学年学期` is null;


# 找到有同学年同课程多次考试的情况
create view 一学年有同一门课重复考试的记录 as
  select 学号, 课程代码
  from grades_all
  group by 学号, 课程代码
  having count(*) > 1
  order by 学号, 课程代码;

create view 重复考试记录表 as
  select grades_all.*
  from 一学年有同一门课重复考试的记录,
       grades_all
  where grades_all.课程代码 = 一学年有同一门课重复考试的记录.课程代码
    and grades_all.学号 = 一学年有同一门课重复考试的记录.学号;

# 删除缓考记录
select *
from 重复考试记录表
where 考试状态 regexp '缓考';
delete
from grades_all
where 考试状态 regexp '缓考';

# 删除重修且课程学分点大于1.0的记录
select *
from grades_all
where 是否重修 is not null
  and 是否重修 not regexp '重修';
select *
from grades_all
where 是否重修 is not null
  and 学分点 > 1.0;
delete
from grades_all
where 是否重修 is not null
  and 学分点 > 1.0;

# 特殊情况处理
# 找出重复考试大于2次的特殊情况并处理
create view 多次考试异常情况处理 as
  select 学号, 课程代码
  from 重复考试记录表
  group by 学号, 课程代码
  having count(*) > 2;

select *
from grades_all,
     多次考试异常情况处理
where grades_all.学号 = 多次考试异常情况处理.学号
  and 多次考试异常情况处理.课程代码 = grades_all.课程代码
order by grades_all.学号;

# delete from grades_all where 学号 = 0121611390222 and 课程代码 = 4050058110 and 是否重修 is null ;
# select * from grades_all where 学号 = 0121611390222 and 课程代码 = 4050058110;

# delete
# from grades_all
# where 学号 = 0121611390627
#   and 课程代码 = 4050052110
#   and 是否重修 is not null;
# select *
# from grades_all
# where 学号 = 0121611390627
#   and 课程代码 = 4050052110;

# 找出两次考试不是一次没过一次补考的情况并处理
select count(*)
from 重复考试记录表;
select count(*)
from 重复考试记录表
where 成绩类型 = '补考';
select count(*)
from 重复考试记录表
where 成绩类型 is null;

create view 正常的一次补考一次挂科学号课程代码 as
  select 学号, 课程代码
  from 重复考试记录表
  where 成绩类型 = '补考'
  group by 学号, 课程代码;

select 重复考试记录表.*
from 重复考试记录表
where 重复考试记录表.学号 not in (select 课程代码 from 正常的一次补考一次挂科学号课程代码)
  and 重复考试记录表.课程代码 not in (select 课程代码 from 正常的一次补考一次挂科学号课程代码);
# 得到的结果是
# 2017-2018-1	自动化1605	1021611380535	拉多夫	4080151110	机械制造工程实训C		2	缺考			0
# 2017-2018-1	自动化1604	1021611380635	甘亚穆	4080151110	机械制造工程实训C		2	缺考			0
# 2017-2018-2	自动化1604	1021611380635	甘亚穆	4080151110	机械制造工程实训C	实践课	2			重修	1
# 2017-2018-2	自动化1605	1021611380535	拉多夫	4080151110	机械制造工程实训C	实践课	2			重修	1

# 最后发现现在的重复考试记录表有3种情况需要处理
# 一次挂科一次重修
# 一次重修挂科一次补考
# 一次挂科一次补考
start transaction;
savepoint d1;
delete
from grades_all
where 学号 = 1021611380535
  and 课程代码 = 4080151110
  and 是否重修 is null;
delete
from grades_all
where 学号 = 1021611380635
  and 课程代码 = 4080151110
  and 是否重修 is null;

savepoint d2;
select count(*)
from grades_all;

# 创建正常记录表
select count(*)
from grades_all
       inner join 一学年有同一门课重复考试的记录 on grades_all.课程代码 = 一学年有同一门课重复考试的记录.课程代码
                                       and grades_all.学号 = 一学年有同一门课重复考试的记录.学号
                                       and grades_all.成绩类型 is null;

delete grades_all
from grades_all
       inner join 一学年有同一门课重复考试的记录 on grades_all.课程代码 = 一学年有同一门课重复考试的记录.课程代码
                                       and grades_all.学号 = 一学年有同一门课重复考试的记录.学号
                                       and grades_all.成绩类型 is null;

# 开始算最终结果
create view 绩点表 as
  select 班级名称 as 班级, 姓名, 学号, sum(学分) as 学年所修学分, sum(学分 * 学分点) / sum(学分) as 平均学分绩点, min(学分点) as 单科最低成绩绩点
  from grades_all
  group by 学号
  order by 班级名称;


create view E栏 as
  select 班级名称 as 班级, 姓名, 学号, sum(学分) as 测评学年获得学分
  from grades_all
  where 学分点 != 0
  group by 学号;

create view H栏 as
  select 班级名称 as 班级, 姓名, 学号, sum(学分) as 太长了
  from grades_all
  where 学分点 != 0
    and 课程性质 != '个性课程'
  group by 学号;

create view 绩点和学分汇总 as
  select 绩点表.*, E栏.测评学年获得学分, H栏.太长了
  from 绩点表,
       E栏,
       H栏
  where E栏.学号 = H栏.学号
    and H栏.学号 = 绩点表.学号;

# 错误排查
use grade;

select *
from grades_all where 班级名称 = '电气zy1601' order by `﻿学年学期`;

select 班级名称,count(*) from grades_all group by 班级名称;

















