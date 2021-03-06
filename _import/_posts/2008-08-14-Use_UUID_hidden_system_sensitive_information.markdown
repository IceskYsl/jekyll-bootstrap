---
layout: post
title: 使用UUID隐藏系统敏感信息
date: '2008-8-14'
comments: true
categories: Ruby&Rails Security
link: true
---
在前面一篇文章中已经说了如何使用“<a href="http://iceskysl.1sters.com/?action=show&amp;id=349">使用UUID做ActiveRecord主键</a>”，其说到使用Rails默认的id做为自增变量的几个缺点，其中一条就是“敏感信息泄漏 ”，这个是很致命的，可以让您的竞争对手很清楚的了解到你的系统的数据量，比如多少注册用户，发布了多少个帖子等等，还可以根据这个计算出你系统的增长率，做趋势预测，总之，把这些敏感信息暴露出来非常危险（搞社工的都明白）。

更可怕的是，同质化竞争对手可以按照URL中后面这个ID来遍历您的DB中的内容，写个小<strong>爬虫</strong>把你的页面上的关键信息顺次爬下来也不是什么难事，这样的话，你就非常被动了。

而采用UUID来做逐渐，因为其每次生成的都是唯一的、类似<em>12f186e6-687e-11ad-843e-001b632783f1</em>这样的串，所以可以很大程度上避免敏感信息的泄露。也可以防止自动采集的发生。
具体使用方法，请参考前面一篇文章“<a href="../../../?action=show&amp;id=349">使用UUID做ActiveRecord主键</a>”。安全意识还是要有的，切记。
