---
layout: post
title: ruby对RSS(XML)的实例解析
date: '2007-6-2'
comments: true
categories: Ruby&Rails Security
link: true
---
有时候你可能想备份下原来的博客，或者对写的文章做些备份之类的，用RUBY很间就可以实现，下面是我的这个应用中所用的，针对用户推荐的文章，给出文章的RSS地址，然后写些自己的感受或者评论，就可以把提交的那个RSS文章取过来的。下面是代码：&lt;code&gt;    @topic.body = '引言:' + @topic.body + '&lt;br/&gt;'    feed = RSS::Parser.parse(open(params[:uri]).read, false)     @topic.body +=  '&lt;br /&gt;*来源:*' + feed.channel.title     @topic.body +=  '&lt;br /&gt;*地址:*' + feed.channel.link      feed.items.each do |item|      @topic.body += '&lt;br /&gt;*标题:*' + item.title      @topic.body += '&lt;br /&gt;*内容摘要:*&lt;br /&gt;' + item.description    end &lt;/code&gt;对了，你还需要在前面加上对库的引用，如下：require 'rss/2.0'require 'open-uri'另外，刚刚看到Javaeye上一个老兄写了一个差不多的，我就不多写了，大家可以参考下，地址如下：http://www.javaeye.com/blog/57538
