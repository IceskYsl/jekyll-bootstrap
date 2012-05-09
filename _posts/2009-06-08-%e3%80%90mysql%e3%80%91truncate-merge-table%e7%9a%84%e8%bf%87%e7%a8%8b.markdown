--- 
layout: post
comments: true
title: !binary |
  44CQTXlzcWzjgJF0cnVuY2F0ZSBNRVJHRSB0YWJsZeeahOi/h+eoiw==

date: 2009-6-8
link: false
categories: life
---
<span style="border-collapse: separate; color: #000000; font-family: Simsun; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;"> </span>
<div style="margin: 15px auto 25px; padding: 40px 50px; font-family: SimSun,宋体,'MS Song',serif; font-size: 10pt; background-color: #ffffff; min-height: 1100px; counter-reset: __goog_page__ 0; line-height: normal; width: 548px ! important; border: 1px 2px 2px 1px solid #cccccc #bbbbbb #bbbbbb #cccccc;">数据库告警空间不足，看了下数据文件
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">db1:/var/lib/mysql/yobo_beta_log # du -sm * | sort -nr | more</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">2187    rails_logs_081023.MYD</div>
<div style="margin-top: 0px; margin-bottom: 0px;">1447    rails_logs_081023.MYI</div>
</div>
<div style="margin-top: 0px; margin-bottom: 0px;">687     uwa_sessions_080808.MYD</div>
<div style="margin-top: 0px; margin-bottom: 0px;">607     uwa_sessions_080808.MYI</div>
<div style="margin-top: 0px; margin-bottom: 0px;">591     uplay_daily_stats.MYI</div>
<div style="margin-top: 0px; margin-bottom: 0px;">351     uplay_daily_stats.MYD</div>
<div style="margin-top: 0px; margin-bottom: 0px;">313     uplay_tmp_logs.MYD</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">原来有个日志表文件这么大，看看有多大</div>
</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">-rw-r-----+ 1 4294967294 4294967294      13082 Jun  8 20:20 rails_logs_081023.frm</div>
<div style="margin-top: 0px; margin-bottom: 0px;">-rw-r-----+ 1 4294967294 4294967294 2290840288 Jun  8 20:24 rails_logs_081023.MYD</div>
<div style="margin-top: 0px; margin-bottom: 0px;">-rw-r-----+ 1 4294967294 4294967294 1515332608 Jun  8 20:27 rails_logs_081023.MYI</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">原来有2G多的大小，看看有多少数据</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; select count(id) from rails_logs_081023;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">| count(id) |</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">|  11042292 |</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">1 row in set (0.00 sec)</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">wow，千万级的，看来够大，这个没啥用，先备份下数据文件，然后truncate掉</div>
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; truncate table  rails_logs_081023;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">ERROR 1105 (HY000): MyISAM table 'rails_logs_081023' is in use (most likely by a MERGE table). Try FLUSH TABLES.</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">出错了，这边表貌似被MERGE用了，查了一下，果然是被rails_logs这个表MERGE着用了，那我直接truncate这个rails_logs试试看。</div>
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; truncate table  rails_logs;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">ERROR 1 (HY000): Can't create/write to file './iceskysl_beta_log/rails_logs.MRG' (Errcode: 17)</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">呀，还是出错，文件不可写？Errcode: 17</div>
<div style="margin-top: 0px; margin-bottom: 0px;">查下资料，原来：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">System error: 17 = File exists</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">这咋回事，再查资料，原来.MRG是创建MERGE表的时候创建的，已经存在了。</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">那就先把这个MERGE表干掉，再创建：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">先看下这个表是咋定义的：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt;  show create table rails_logs;</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">记录下SQL，接着drop掉。</div>
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; DROP  table rails_logs;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Query OK, 0 rows affected (0.36 sec)</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">再truncate我的目标表</div>
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; truncate table  rails_logs_081023;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">Query OK, 0 rows affected (4.22 sec)</div>
</div>
</div>
<div style="margin-top: 0px; margin-bottom: 0px;">够快的，11042292条数据4S搞定，接着再创建下这个MERGE表，执行下上面记录的SQL就好了。</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">最后确认下这表没啥问题：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">mysql&gt; select count(id) from rails_logs;</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">| count(id) |</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">|         0 |</div>
<div style="margin-top: 0px; margin-bottom: 0px;">+-----------+</div>
<div style="margin-top: 0px; margin-bottom: 0px;">1 row in set (0.00 sec)</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">OK，搞定，空间有了，天下太平了。</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">附录：如何删除大表</div>
<div style="margin-top: 0px; margin-bottom: 0px;">
<div style="margin-top: 0px; margin-bottom: 0px;">问题：有一个拥有1亿条数据的表，只需要保留其中的5条，其他删除，如何做？</div>
<div style="margin-top: 0px; margin-bottom: 0px;">这就需要用truncate table来搞定了，如下：</div>
<div style="margin-top: 0px; margin-bottom: 0px;">select 5条数据 into #临时表 from 1亿条数据的牛X表</div>
<div style="margin-top: 0px; margin-bottom: 0px;">truncate table 1亿条数据的牛X表</div>
<div style="margin-top: 0px; margin-bottom: 0px;">--让它牛X，不到10毫秒干掉它。</div>
<div style="margin-top: 0px; margin-bottom: 0px;">insert 1亿条数据的牛X表 select * from #临时表</div>
<div style="margin-top: 0px; margin-bottom: 0px;">drop table #临时表</div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
</div>
</div>
<div style="margin-top: 0px; margin-bottom: 0px;">参考资料：</div>
<div style="margin-top: 0px; margin-bottom: 0px;"><a style="color: #551a8b;" href="http://www.vbulletin.com/forum/archive/index.php/t-210887.html">http://www.vbulletin.com/forum/archive/index.php/t-210887.html</a></div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">大表删除数据的思路</div>
<div style="margin-top: 0px; margin-bottom: 0px;"><a style="color: #551a8b;" href="http://www.mysqlsupport.cn/node/21">http://www.mysqlsupport.cn/node/21</a></div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
mysql 的 MERGE存储引擎
<div style="margin-top: 0px; margin-bottom: 0px;"><a style="color: #551a8b;" href="http://bbs.hxxsh.com/thread-52688-1-8.html">http://bbs.hxxsh.com/thread-52688-1-8.html</a></div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
Truncate table,Delete,与Drop table的区别
<div style="margin-top: 0px; margin-bottom: 0px;"><a style="color: #551a8b;" href="http://gaijing814.javaeye.com/blog/403243">http://gaijing814.javaeye.com/blog/403243</a></div>
<div style="margin-top: 0px; margin-bottom: 0px;"></div>
<div style="margin-top: 0px; margin-bottom: 0px;">MySQL删除表中大批量的数据</div>
<div style="margin-top: 0px; margin-bottom: 0px;"><a style="color: #551a8b;" href="http://www.javayou.com/diary/146633154">http://www.javayou.com/diary/146633154</a></div>
</div>
