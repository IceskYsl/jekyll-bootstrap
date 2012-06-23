---
layout: post
title: 隐藏最后四位字符
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
在这样一个需求中，可能会用到这个特性，需要把一个人的信用卡的最后几位（手机号码的最后几位）隐藏掉，用*代替，可以用这样来实现。。def mask_number(number)  number.to_s.size &lt; 5 ? number.to_s : (('*' * number.to_s[0..-5].length) + number.to_s[-4..-1])end 直接传递一个字符串或者数字都可以。。
