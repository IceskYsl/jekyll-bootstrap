---
layout: post
title: 完善你的URL显示信息
date: '2007-6-8'
comments: true
categories: Ruby&Rails Tips
link: true
---
当你允许用户评论的时候，可能需要他们输入主页等URL，你以为用户会很认真的写上*http://*，现实是用户很多时候懒得写，只写www.1ster.cn这样的，你可以在接收数据的时候或者JS处理一下，如果没有http://就加上，但有的时候，面对一些历史数据或者你不想在接收的时候处理，可以按照下面这个来处理。&lt;code&gt; def url=(addr)    super (addr.blank? || addr.starts_with?('http')) ? addr : &quot;http://#{addr}&quot;  end&lt;/code&gt;当然，你也可以按照这个思路在你接收数据的时候处理。
