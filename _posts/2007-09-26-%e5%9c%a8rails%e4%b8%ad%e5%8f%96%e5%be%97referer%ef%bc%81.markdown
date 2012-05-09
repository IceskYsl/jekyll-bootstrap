--- 
layout: post
comments: true
title: !binary |
  5ZyoUmFpbHPkuK3lj5blvpdSRUZFUkVS77yB

date: 2007-9-26
link: false
categories: life
---
{% codeblock %}需要取打开技能云tag的页面地址，于是需要取得<strong>referer</strong>的值，记录如下：<strong><br />Try: </strong><br />request.env['HTTP_REFERER']<br />或者<br />request.referer<br />参考：http://www.ruby-forum.com/topic/79405{% endcodeblock %}
