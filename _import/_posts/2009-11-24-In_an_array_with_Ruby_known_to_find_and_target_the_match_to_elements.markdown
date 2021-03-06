---
layout: post
title: 用Ruby在已知数组中找到和目标最匹配得元素
date: '2009-11-24'
comments: true
categories: 无心呢喃
tags: find inject rails ruby select
link: true
---
有个需求，给定一个数组，然后给出一个变量，需要在这个数组中找到和这个变量得值最接近得那个元素，开始用find或者select都不是很合适，最后找到inject，很好得解决了这个需求，现在记录下：
首先看下inject这个函数
{% codeblock %}
enum.inject(initial) {| memo, obj | block } => obj
enum.inject {| memo, obj | block } => obj
Combines the elements of enum by applying the block to an accumulator value (memo) and each element in turn. At each step, memo is set to the value returned by the block. The first form lets you supply an initial value for memo. The second form uses the first element of the collection as a the initial value (and skips that element while iterating).

   # Sum some numbers
   (5..10).inject {|sum, n| sum + n }              #=> 45
   # Multiply some numbers
   (5..10).inject(1) {|product, n| product * n }   #=> 151200

   # find the longest word
   longest = %w{ cat sheep bear }.inject do |memo,word|
      memo.length > word.length ? memo : word
   end
   longest                                         #=> "sheep"

   # find the length of the longest word
   longest = %w{ cat sheep bear }.inject(0) do |memo,word|
      memo >= word.length ? memo : word.length
   end
   longest                                         #=> 5
{% endcodeblock %}

然后根据我得需求，写出一个函数如下：
{% codeblock %}
  # find the min abs size
  def self.select_h(h)
    if ALL_FORMATS.include?(h)
      return h
    else
      ok_size = ALL_FORMATS.inject do |i,j|
        (i-h).abs < (j-h).abs ? i : j
      end
      return ok_size
    end
  end
{% endcodeblock %}
首先看是否包含这个变量，如果又，直接返回，如果没有就inject来取一个最合适得。
