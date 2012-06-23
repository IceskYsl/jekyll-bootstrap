---
layout: post
title: 关于Mysql的连接数问题始末
date: '2008-1-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>看到&ldquo;海阳&rdquo;在chinaonrails上问一个关于在Rails的线程中使用mysql链接的问题（http://chinaonrails.com/topic/view/1201/1.html#replyForm），老是出现异常：</p>
<p><em>ActiveRecord::StatementInvalid (Mysql::Error: Lost connection to MySQL server during query: </em></p>
<p>我以前在写技能云的时候，在后台定时跑的一个并发job的时候，也遇到过类似的问题，个人感觉是线程数的问题，找到几篇资料，证明我的猜测，如下：</p>
<p>MySQL最大连接数设置：http://spaces.huash.com/86932/viewspace-223435.html</p>
<p>MySQL服务维护笔记 ：http://www.chedong.com/tech/mysql.html</p>
<p>加大mysql的最大连接数：http://www.21ds.net/article/56/547</p>
