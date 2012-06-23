---
layout: post
title: malformed_format_string_on_rails_
date: '2010-9-4'
comments: true
categories: Ruby&Rails
link: true
---
在rails中使用find进行模糊查询时，出现了<strong>malformed</strong> <strong>format string</strong><strong>（</strong>输入为字符）或非法字符（输入为数字）的提示。
（1） @vendors  = Vendor.find(:all,:conditions=&gt;[@sql])
（2） @vendors = Vendor.find_by_sql("select * from vendor where "+@sql)
错误发生在按（1）方式查询过程中，采用（2）方式可以避免这个错误，这间接说明了find_by_sql确实相当不安全。
查阅了一下资料，对于这个问题的说法如下：Rails uses sprintf (%) on the inside. So, Escape your % with %，因此只要将模糊查询的地方一个百分号全部换成两个便可以解决问题。
