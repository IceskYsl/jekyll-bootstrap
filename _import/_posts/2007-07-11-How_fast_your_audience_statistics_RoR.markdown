---
layout: post
title: 如何快速统计RoR网站的访问量
date: '2007-7-11'
comments: true
categories: Ruby&Rails
link: true
---
本文来源JavaEye，由于没有提供单篇RSS，我就全部转过来了，版权所有规robbin所有。链接地址：http://robbin.javaeye.com/blog/97287统计网站的访问量有很多专业的第三方工具，例如Google Analytics，提供强大，而且详细的统计功能。当然，也许不是每个人都需要这么复杂而且操作麻烦的工具，如果你只是需要大概了解一下网站的访问量和访问URL的比例，那么让我们看看最简单最容易的统计工具：Unix Shell。一个RoR网站的访问纪录，Web Server(Apache or lighttpd)会记录所有的访问请求，包括动态请求和静态请求，但大量图片，JS，CSS的请求对我们没有太大的统计价值，因此web server的日志参考价值就不大。RoR会记录所有动态请求日志到log/production.log里面，我们要做的就是让RoR进行日志交换，每天产生一个新的日志文件。很简单，修改config/environment.rb RAILS_DEFAULT_LOGGER = Logger.new(&quot;#{RAILS_ROOT}/log/#{RAILS_ENV}.log&quot;, &quot;daily&quot;)  那么每天就会产生一个诸如+production.log.20070702+这样的日志文件。*一、统计每日动态请求处理总数*cat production.log.20070702|grep &quot;200 OK&quot;|wc -l   打印日志文件，挑选正确处理的请求行，统计行数，一条shell命令就搞定了网站处理的动态请求数量。虽然动态请求数量不等于网站访问量，但是可以作为一个重要的参考指标。*二、统计URL的访问频度*网站管理员都很希望知道哪些频道受欢迎被访问的频繁，哪些URL格外受到关注，不必寻求专业的网站流量统计系统，一条shell命令就搞定了：cat production.log.20070702 |grep &quot;200 OK&quot; | awk '{print $17}'|sort|uniq -c | sort -r -n &gt; stat.log  打印日志文件，挑选正确处理请求行，把第17列即URL那一列挑出来，排序，统计唯一URL出现的次数，按照URL次数倒序输出到stat.log文件里面，让我们看看stat.log是什么：10096 [http://www.javaeye.com/]  3590 [http://www.javaeye.com/forums/index]  3446 [http://www.javaeye.com/forums/board/Java]  3300 [http://www.javaeye.com/index/rss_index_topics]  2477 [http://www.javaeye.com/forums/board/Life]  1605 [http://www.javaeye.com/forums/board/AJAX]  .........  网站首页被访问了10096次，论坛频道首页被访问了3590次，......是不是很爽？我们用一条shell命令可以做简单的网站访问统计系统了。那么用Java做的系统，能不能这样统计呢？其实照样可以。你可以在tomcat的配置文件里面设置输出详细的日志信息，然后照样用shell命令搞定。
