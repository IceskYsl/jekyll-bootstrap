---
layout: post
title: mysql实例优化效果
date: '2010-2-5'
comments: true
categories: 技术归总 Database
tags: Database query_cache_size
link: true
---
前段时间写了一篇《实例优化mysql配置文件my.cnf》，这几天看到效果非常明显，别的不说，单mysql cache_hits就很不错（之前竟然没注意到这个参数）
<blockquote># Increase query_cache_size from 0 to 128M
query_cache_size=128M
# Increase query cache limit from 1048576 to 2M
query_cache_limit=2M</blockquote>
看到效果很明显，如下是munin的监控图：
<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/02/li127-248-mysql_queries-week.png"><img class="alignleft size-medium wp-image-653" title="li127-248-mysql_queries-week" src="http://iceskysl.1sters.com/wp-content/uploads/2010/02/li127-248-mysql_queries-week-300x205.png" alt="" width="300" height="205" /></a>
