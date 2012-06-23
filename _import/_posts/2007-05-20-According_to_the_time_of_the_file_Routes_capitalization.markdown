---
layout: post
title: 按时间归档的Routes写法
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
在博客等系统中，通常需要按时间进行归档，这个Routes可以这样写。。如下：# allow neat perma urlsmap.connect 'articles/:year/:month/:day', :controller  =&gt; 'articles',      :action =&gt; 'find_by_date',      :year =&gt; /\d{4}/, :day =&gt; nil, :month =&gt; nilmap.connect 'articles/:year/:month/:day/:title', :controller  =&gt; 'articles',      :action =&gt; 'permalink', :year =&gt; /\d{4}/
