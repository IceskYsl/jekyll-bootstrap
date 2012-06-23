---
layout: post
title: 聚焦你的页面上的第一个输入框
date: '2007-5-20'
comments: true
categories: Tips
link: true
---
如果可以在用户打开一个注册或者发表文章的页面，能把光标直接聚焦到第一个输入框，或许会改善不少的用户体验，我们在ROR中可以轻松实现，把如下代码粘贴到你的application.js 中，并保证在你的布局RHTML文件中包含这个js文件：&quot;javascript_include_tag :defaults&quot;.Event.observe(window, 'load', function() {  var e = $A(document.getElementsByTagName('*')).find(function(e) {    return (e.tagName.toUpperCase() == 'INPUT' &amp;&amp; (e.type == 'text' || e.type == 'password'))        || e.tagName.toUpperCase() == 'TEXTAREA' || e.tagName.toUpperCase() == 'SELECT';  });  if (e) e.focus();}); 你也可以对你特定的需求进行编辑。。
