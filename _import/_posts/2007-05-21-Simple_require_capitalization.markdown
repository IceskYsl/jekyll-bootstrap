---
layout: post
title: 简单的require写法
date: '2007-5-21'
comments: true
categories: Ruby&Rails
link: true
---
当你需要加载多个require的时候，是不是写了很多的require ×××什么的呢，就像JAVA一样，前面一对的import一样，其实我们可以这样写，是不是更方便快捷呢～%w(uri net/http yaml rubygems hpricot active_support).each { |f| require f }如上，少了不少字符吧～
