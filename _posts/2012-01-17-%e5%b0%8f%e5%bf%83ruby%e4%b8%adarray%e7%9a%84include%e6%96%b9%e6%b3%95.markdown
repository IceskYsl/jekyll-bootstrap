--- 
layout: post
comments: true
title: !binary |
  5bCP5b+DcnVieeS4rUFycmF555qEaW5jbHVkZT/mlrnms5U=

date: 2012-1-17
link: false
categories: life
---
前几天遇到一个很诡异的情况，昨天终于找到根本原因并解决了，我觉得有必要把这个过程纪录下，应该会有人遇到类似的问题。

前几天在一个坛子里问“每天500w条log如何入mysql库比较靠谱”，需求是
<blockquote>我们有个产品，每天差不多500w的业务量，需要对500w做相关的分析，就需要入库～
目前用的是mysql 按月切表定期老化数据，但是导入数据情况比较糟糕～每天导入数据差不多需要20个小时，和MySQL 5000 records/second差距巨大～
尝试过三个方案：
1. 定期解析日志，直接入库；
2. 定期解析日志，生成sql，再直接sql入库；
3. 生成data文件，load到库里
但是效果都不理想～ 没什么大数据处理的经验，大家支招～～～</blockquote>
其中第一种方案基本上被抛弃了，采用第二种方案，但是还是很糟糕，500w的数据差不多需要10来个小时，还是无法接受，于是仔细剖析了下过程：<!--more-->
<blockquote>1. 准备sql文件
sqlFileName = RAILS_ROOT + "/log/insert.sql." + LOG_POSTFIX_FOR_YESTERDAY
sqlfile = File.open(sqlFileName, "w")
2. 打开日志文件
File.open("../log/apps.log.#{LOG_POSTFIX_FOR_YESTERDAY}").each do |line|
3.提取需要的数据
id, apk_id, ip, client_id, channel_id, uniquely_code ,track = line.split(" : ")[1].split(",")
4. 生成sql串
sqlInsert = "INSERT logs_downloads.....balalaalala
5. 写到sql文件里
sqlfile.puts( sqlInsert )
6. 调mysql直接导入sql
里面还有一些数据的清洗和排重工作～
每天的日志文件差不多500w行，解析生成sql的过程不理想（其中没用数据库操作）～ 难道是我磁盘性能很糟糕～～</blockquote>
过程看到基本上都没问题，无外乎解析文件，写文件的操作，不应该慢成这样的，最后把目光放在了数据的清洗和排重工作种，这个过程是想在入库的时候就把一些虚假的量排除掉，于是我们自己设计了一个算法来过滤，算法的逻辑很简单，根据一些参赛md5出一个key，然后把这个key丢在Array中，然后用include?来判断这个key是否已经存在，问题就出在这里！

ruby的Array中的include?是需要很小心的，我之前想当然的认为这个方法应该很快，也没仔细看就用了，结果发现问题就在这个方法上，直接上下源码看看：
<a href="http://www.iceskysl.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-17-at-11.03.19-PM.png"><img class="alignnone size-medium wp-image-1107" title="Screen Shot 2012-01-17 at 11.03.19 PM" src="http://www.iceskysl.com/wp-content/uploads/2012/01/Screen-Shot-2012-01-17-at-11.03.19-PM.png" alt="" /></a>
当看到:
{% codeblock %}
for (i=0; i #blalalal
}
{% endcodeblock %}

这个的时候我就明白了，果然，这个方法直接遍历Array，然后你可以想想当我有个500w大小的Array的时候，再用include?是何等的情景啦～
修改方案很容易了，改用hash就好了，不多说～～
