---
layout: post
title: ubuntu下出现缺少openssl的解决
date: '2007-10-21'
comments: true
categories: Ruby&Rails
link: true
---
<h1><font size="2">   MissingSourceFile        in PeopleController#invite</font></h1>
<h1><font size="2">no such file to load -- openssl</font></h1>
{% codeblock %}<font size="3"><strong>解决：</strong><br /></font>$ sudo apt-get install libopenssl-ruby1.8{% endcodeblock %}
