---
layout: post
title: 日期上的迭代问题
date: '2007-5-27'
comments: true
categories: Ruby&Rails
link: true
---
给定一个时间点，希望得到其他时间点的解决方案如下，Ruby 的所有时间对象都可像数字一样用在值域中。Date和DateTime对象按天递增，而Time对象按秒递增：*例子*require 'date'(Date.new(1976, 7, 2)..Date.new(1976, 7, 4)).each { |x| puts x }1976-07-021976-07-031976-07-04span = DateTime.new(1776, 7, 2, 1, 30, 15)..DateTime.new(1776, 7, 4, 7, 0,0)span.each { |x| puts x } 1776-07-02T01:30:15Z 1776-07-03T01:30:15Z 1776-07-04T01:30:15Z(Time.at(100)..Time.at(102)).each { |x| puts x } Wed Dec 31 19:01:40 EST 1969 Wed Dec 31 19:01:41 EST 1969 Wed Dec 31 19:01:42 EST 1969Ruby 的Date类定义了*step*和*upto*两种方便的由数字使用的迭代器：the_first = Date.new(2004, 1, 1)the_fifth = Date.new(2004, 1, 5)the_first.upto(the_fifth) { |x| puts x } 2004-01-01 2004-01-02 2004-01-03 2004-01-04 2004-01-05*讨论*Ruby的日期对象在内部被存储为数字，并且一定范围的这种对象可被视为一定范围的数字。对于Date和DateTime对象而言，内部表示是儒略历日期：每次在一定范围的这种对象上累加一天。对于Time对象而言，内部表示是自Unix 纪元以来的秒数：每次在一定范围的Time对象上累加一秒。*Time*没有定义step和upto方法，但添加它们也很简单：class Timebq.  def step(other_time, increment) raise ArgumentError, &quot;step can't be 0&quot; if increment == 0 increasing = self &lt; other_time if (increasing &amp;&amp; increment &lt; 0) || (!increasing &amp;&amp; increment &gt; 0) yield self return end d = self begin yield d d += increment end while (increasing ? d &lt;= other_time : d &gt;= other_time) enddef upto(other_time) step(other_time, 1) { |x| yield x } endendthe_first = Time.local(2004, 1, 1)the_second = Time.local(2004, 1, 2)the_first.step(the_second, 60 * 60 * 6) { |x| puts x } Thu Jan 01 00:00:00 EST 2004 Thu Jan 01 06:00:00 EST 2004 Thu Jan 01 12:00:00 EST 2004 Thu Jan 01 18:00:00 EST 2004 Fri Jan 02 00:00:00 EST 2004the_first.upto(the_first) { |x| puts x } Thu Jan 01 00:00:00 EST 2004
