---
layout: post
title: 去掉CSS中的链接图片的外边框
date: '2007-5-20'
comments: true
categories: Tips
link: true
---
在ROR的实际开发中,遇到这么一个情况:例如凡是有图片的地方,在图片外面显示了一个边框,很不好看,找了下资料,可以这样修复:1.如果是直接用image_tag来实现的 ,则加上:border =&gt; 0,结果如下:&lt;%= link_to(image_tag(&quot;/images/btn_home.png&quot;, :border =&gt; 0), {:controller =&gt; &quot;code&quot;}) %&gt;2.如果这个图片使用的是CSS中的DIV格式,则需要添加:border: 0就可以了.归结为:when images are used in links they put a border around them.To disable this globally (as most people do) add &quot;img {border: 0}&quot; to your css.
