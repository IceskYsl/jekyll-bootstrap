---
layout: post
title: 警惕rails中的保留字带来的问题～
date: '2007-7-12'
comments: true
categories: Ruby&Rails
link: true
---
这个问题还真一直没有关注过，只是晓得rails和ruby中有些关键字、保留字，也没太注意，昨天开始遇到一个很奇怪的问题，我建立了一个用来存放友情链接的表links，里面有title，desc，*type*，created_at等字段，然后在controller中取记录的时候类似如下语句：  @friend_links = Link.find(:all, :conditions =&gt; { :type =&gt; 1, :visible =&gt; 1 })貌似一切都很平常，却发生如下的错误：compile errorD:/soft/ruby/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/base.rb:1358: syntax errorObject::1一切都很平常呀，试着换个find的写法，还是一样出问题，真是够邪门的～！然后今天问了几个朋友，也说奇怪，没有遇到过，还好google还是找到了这个问题的根源：保留字。请注意，这里我使用了一个保留字*type*做为字段名，导致这个错误的发生，就像一个朋友这样解释的一样：Its because *type *is a reserved word, so you'll have to change that column's name (perhaps to kind or something). Otherwise you're code looks fine wink.大家以后一定要注意，这个小问题浪费了不少时间～
