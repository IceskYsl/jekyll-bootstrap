---
layout: post
title: 给当前链接加上class属性
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
在WEB系统中，如果能给当前链接加上一些标识，那是一件比较high的事。link_to_unless_current 可以做到把当前的链接中去掉链接，不能指定我们自己的class类别，于是我们可以自己DIR，如下：写一个新的css类，例如叫：current然后把下面这个help方法加到您的help.rb中，然后在rhtml中进行引用，如下：def link_to_with_current_class_if_current(name,                                           options = {},                                           html_options = {},                                           *parameters_for_method_reference)  html_options[:class] = &quot;current&quot; if current_page?(options)  link_to(name, options, html_options, *parameters_for_method_reference)end
