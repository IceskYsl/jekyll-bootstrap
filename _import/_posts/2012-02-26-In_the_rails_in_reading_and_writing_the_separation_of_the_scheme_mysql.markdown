---
layout: post
title: 在rails中mysql读写分离的方案
date: '2012-2-26'
comments: true
categories: Architecture Ruby&Rails
tags: db-charmer mysql Octopus rails Sharding
link: true
---
手上几个项目访问的压力越来越大，用合用的mysql转移到单独的msql服务器了，但还是压力还是很大，偶尔还会遇到lock问题，是想着需要做一下mysql的读写分离的方案，找了一些资料，汇总如下：

之前晓得有两个方案可以使用
1. 用类似<strong>use_db</strong>这样的插件，实现针对model的读写分离（其实这个不是真正意义上的读写分离，但是可以凑合用）
2. 用类似<strong>master_slave_adapter</strong>和<strong>masochism</strong>插件实现真正意思上的读写分离，配置稍微麻烦点，有的可能还需要一些hard code～

也在ruby_china发了帖子和大家讨论了下（<a href="http://ruby-china.org/topics/1397">http://ruby-china.org/topics/1397</a>），在大家的回复了，看到 @kevinxu 提到了<strong>db-charmer</strong> (<a href="https://github.com/kovyrin/db-charmer">https://github.com/kovyrin/db-charmer</a>)，也看到 @ShiningRay 提到了<strong>data_fabric</strong>，还有 @bony 提到了可以自己来拦截“拦截一下activerecord的方法，在读操作和写操作时重新设置connection”。

于是就去多查下资料，看到有如下ruby-toolbox上有个Active_Record_Sharding的页面（<a href="https://www.ruby-toolbox.com/categories/Active_Record_Sharding">https://www.ruby-toolbox.com/categories/Active_Record_Sharding</a> ），里面还提到了了<strong>Octopus</strong>这个gem（<a href="https://github.com/tchandy/octopus">https://github.com/tchandy/octopus</a>），于是仔细看了一下Db-charmer这个还是比较完善的，按照其描述是这样的：DbCharmer is a Rails plugin (and gem) that could be used to manage AR model connections, implement master/slave query schemes, sharding and other magic features many high-scale applications need. 然后找到几篇不错的介绍文章
<strong>DB Charmer – ActiveRecord Connection Magic Plugin</strong>
<a href="http://kovyrin.net/2009/11/03/db-charmer-activerecord-connection-magic-plugin/"> http://kovyrin.net/2009/11/03/db-charmer-activerecord-connection-magic-plugin/</a>

<strong>DbCharmer 1.7.0 Release: Rails 3.0 Support and Forced Slave Reads</strong>
<a href="http://kovyrin.net/2011/09/01/dbcharmer-1-7-0/"> http://kovyrin.net/2011/09/01/dbcharmer-1-7-0/</a>

<strong>db-charmer github</strong>
<a href="https://github.com/kovyrin/db-charmer"> https://github.com/kovyrin/db-charmer</a>

<strong>db-charmer homepage</strong>
<a href="http://kovyrin.github.com/db-charmer/index.html"> http://kovyrin.github.com/db-charmer/index.html</a>

看到几经完善，现在也已经支持rails3了，没仔细测试，也还没来得及看源码，有空的可以看后分析下，我主要考虑稳定性和扩展性～
