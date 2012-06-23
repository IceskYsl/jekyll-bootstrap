---
layout: post
title: 深圳电信耍流氓，劫持浏览器
date: '2010-1-23'
comments: true
categories: 无心呢喃
tags: 劫持 电信
link: true
---
今天无意发现在浏览器的左下角经常出现一个页面无法打开的提示，如下
The webpage at http://121.15.207.133:4022/logo.jpg?p=undefined|778|1276|24|800|1280might be temporarily down or it may have moved permanently to a new web address.

看其样式是请求了一个121.15.207.133上的一个logo图片，然后传入了几个参数，但是这个图片的服务器貌似除了电问题，导致请求不到。
无缘无故的，咋会去请求这个玩意呢，查了吓这个IP归属，属于：
<blockquote>
ip138.com IP查询(搜索IP地址的地理位置)
您查询的IP:121.15.207.133
本站主数据：广东省深圳市 电信
参考数据一：广东省深圳市 电信
参考数据二：广东省深圳市 电信
</blockquote>

是深圳电信的，Google下这个IP地址，发现有人（不多）也提到了这个问题，顺藤摸瓜找到月光的一篇2007年文章《<a href="http://www.williamlong.info/archives/1116.html">中国电信又开始耍流氓啦</a>》，描述的差不多是同样的情况。
不晓得邪恶的电信又在监控啥数据，明天警告一下去。
