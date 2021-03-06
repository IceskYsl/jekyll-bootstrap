---
layout: post
title: 防范垃圾利器Akismet使用体验和原理分析
date: '2012-1-2'
comments: true
categories: 无心呢喃 Tips
link: true
---
博客不经常更新的原因是垃圾太猛烈，每次来要删除一批垃圾评论，而且wp后台的那个未审核评论变成垃圾评论还真是麻烦，每次都直接跑去查数据库
{% codeblock %}
select count(*),comment_approved from ice_comments group by comment_approved;
+----------+------------------+
| count(*) | comment_approved |
+----------+------------------+
|     5709 | 0                | 
|      579 | 1                | 
|       71 | spam             | 
+----------+------------------+
{% endcodeblock %}

看到那个comment_approved是0 的就是还没审核的，一个一个审核实在是麻烦的不行～～
找到一个很多人不错的插件 Akismet(Automattic Kismet)是应用广泛的一个垃圾留言过滤系统，其作者是大名鼎鼎的WordPress创始人Matt Mullenweg，Akismet也是WordPress默认安装的插件，其使用非常广泛，设计目标便是帮助博客网站来过滤留言spam。
开启后回自动把comment_approved是0的检查一遍，看看我的
{% codeblock %} 
mysql> select count(*),comment_approved from ice_comments group by comment_approved;
+----------+------------------+
| count(*) | comment_approved |
+----------+------------------+
|     5214 | 0                | 
|      579 | 1                | 
|      566 | spam             | 
+----------+------------------+
3 rows in set (0.00 sec)
{% endcodeblock %}
慢慢自动检查去吧，希望这个能把垃圾评论都找出来～～～

说到这里，对Akismet的工作原理有了更多兴趣，顺手查了下：当一名用户把一条评论列为垃圾评论时，该数据会自动上传到Akismet的服务器上，以方便其他用户的Akismet自动拦截垃圾评论，因此Akismet可以说是广大Akismet用户共同维护的评论防火墙。
大概的流程估计是这样的：

<blockquote>1、所有评论首先都会传送一份到akismet服务器进行判断。
2、akismet收集到了名字，网址，邮箱，和内容,ip，5个数据，其中名字应该不可能用作判断依据。
3、akismet有一个信任名单，中立名单，黑名单几个级别。
4、每当博主对评论手动通过一次，该评论的网址，邮箱,ip就获得一次加权。当积累到一定量之后进入信任白名单，所发评论能自动通过。
5、当博主对评论进行一次垃圾标记，该评论的网址，邮箱，和内容，ip就获得一次负加权，当积累到一定量之后进入黑名单。</blockquote>


如上过程应该有个机器学习的过程～加上一些算法和挖掘的原理，应该是可以实现的，其压力应该在服务器负载上，想全球那么多的wp程序（还有些其他网站接入Akismet的），每次评论的时候一个请求，这个量不得了呀～ 所以我估计Akismet的处理逻辑应该也是分层级的，比如说一个ip已经进入黑名单了，那么他的处理应该很简单了，如果不是黑名单，估计还回根据内容等其他信息判断～～

于是乎，我想到eoeandroid的管理员和版主每天和spam抗争的惨烈情景，不晓得Discuz论坛是否有Akismet插件，如果没有，谁有兴趣可以开发一个，大体思路如下：
<blockquote>
1.使用Akismet提供的API对信息进行检测，地址 <a href="http://akismet.com/development/api/">http://akismet.com/development/api/</a>；
2.对信息的检测只针对特定的用户组，比如“新手上路”、分低于200或者发贴量少于50个帖子的用户，做此限制主要是为了不影响论坛的忠实支持者的操作；
3.用户提交的内容检测为Span时，阻止发贴、回复的操作，并提示用户，并记录用户提交垃圾信息的数次，当达到一定程序时将此用户禁言一定时间；
4.相关参数在后台实现设置接口。
5.在Discuz管理后台设置API Key，并检测API Key的有效性。
</blockquote>
查了下，好像没看到Discuz有这个插件，谁有兴趣开发一个～～
