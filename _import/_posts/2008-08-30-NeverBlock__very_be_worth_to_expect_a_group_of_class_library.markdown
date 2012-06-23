---
layout: post
title: ! 'NeverBlock: 非常值得期待的一组类库'
date: '2008-8-30'
comments: true
categories: Ruby&Rails
link: true
---
<img src="http://bp0.blogger.com/_XFDHsTWrvBY/SJTYtPOmWBI/AAAAAAAAACE/HisrXjBz3dQ/s400/http_serving_performance.png" alt="" />
<a href="http://www.espace.com.eg/neverblock">NeverBlock</a> is a Ruby library that allows developers to write non-blocking, concurrent code in a transparent manner. Meaning that you will keep coding in your traditional ways while you get the benefit of non-blocking IO operations.

Ruby的伪线程，Rails的非线程安全性导致其性能始终上不去，前端时间发布的ruby1.9有多处修改，后面的Rails2.2也号称要做线程安全了，如果以上两个条件都满足，Rails的性能将得到大幅的提高。

由于Rails的AR是非线程安全的，导致其IO性能不是很好，其Mysql驱动一直是单线，不能很好的提高性能，做个Oracle的应该很怀念Oracle，weblogic中的线程池，java5中的concurrent包用来写同步等处理非常方便和高效。

很高兴看到Ruby世界也有类似的东西出现了，他就是NeverBlock，在其放出PostgreSQL的适配驱动后，近日有发布了<a href="http://www.espace.com.eg/neverblock/blog/2008/08/28/neverblock-mysql-support/">针对MYSQL的版本</a>，名字为<a href="http://github.com/espace/mysqlplus/tree/master">mysqlplus</a>，非常值得期待。

另外，关于“<a href="http://zhanjun.net/?q=node/7">同步、异步、阻塞和非阻塞的概念</a>”，请参考其链接上的文章。

参考文章：

http://chinaonrails.com/topic/view/1974.html

http://www.espace.com.eg/neverblock/blog/2008/08/28/neverblock-mysql-support/

http://github.com/espace/mysqlplus/tree/master

http://zhanjun.net/?q=node/7

&nbsp;
