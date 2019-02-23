use d;

# CHP18
# 全文本搜索举例
select note_text
from productnotes
where match(note_text) against('rabbit');

select note_text
from productnotes
where note_text like '%rabbit%';

select note_text
from productnotes
where note_text regexp 'rabbit';

# 说明全文本搜索如何排除行（排除那些等级为0的行），如何排序结果（按等级以降序排序）。
select note_text, match(note_text) against('rabbit') as _rank
from productnotes;

# 首先进行一个简单的全文本搜索，没有查询扩展
select note_text
from productnotes
where match(note_text) against('anvils');

# 下面是相同的搜索，这次使用查询扩展
select note_text
from productnotes
where match(note_text) against('anvils' with query expansion);

# 为演示IN BOOLEAN MODE的作用，举一个简单的例子
select note_text
from productnotes
where match(note_text) against('heavy' in boolean mode );

# 匹配包含heavy但不包含任意以rope开始的词的行
select note_text
from productnotes
where match(note_text) against('heavy -rope*' in boolean mode );

# 下面举几个例子，说明某些操作符如何使用
# 搜索匹配包含词rabbit和bait的行
select note_text
from productnotes
where match(note_text) against('+rabbit +bait' in boolean mode );

# 搜索匹配包含rabbit和bait中的至少一个词的行
select note_text
from productnotes
where match(note_text) against('rabbit bait' in boolean mode );

# 搜索匹配短语rabbit bait而不是匹配两个词rabbit和bait
select note_text
from productnotes
where match(note_text) against('"rabbit bait"' in boolean mode );

# 匹配rabbit和carrot，增加前者的等级，降低后者的等级
select note_text
from productnotes
where match(note_text) against('>rabbit <carrot' in boolean mode );


# 搜索匹配词safe和combination，降低后者的等级
select note_text
from productnotes
where match(note_text) against('+safe +(<combination)' in boolean mode );











































































