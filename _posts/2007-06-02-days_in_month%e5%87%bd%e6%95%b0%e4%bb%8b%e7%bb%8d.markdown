--- 
layout: post
comments: true
title: !binary |
  ZGF5c19pbl9tb250aOWHveaVsOS7i+e7jQ==

date: 2007-6-2
link: false
categories: life
---
days_in_month这个函数返回给定的年月的月的天数，对于写阴历什么的很有帮助，下面是英文的介绍。Descriptiondays_in_month(month, year=nil)Return the number of days in the given month. If a year is given, February will return the correct number of days for leap years. Otherwise, this method will always report February as having 28 days.&lt;code&gt;   1. &gt;&gt; Time.days_in_month(4) =&gt; 30   2. &gt;&gt; Time.days_in_month(4,2006) =&gt; 30   3. &gt;&gt; Time.days_in_month(2,2006) =&gt; 28   4. &gt;&gt; Time.days_in_month(2) =&gt; 28   5. &gt;&gt; Time.days_in_month(2,2008) =&gt; 29&lt;/code&gt;
