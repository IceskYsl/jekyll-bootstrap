---
layout: post
title: 用图片代替link_to中的文字
date: '2007-7-4'
comments: true
categories: Ruby&Rails
link: true
---
link_to大家都会用吧，也有人用户把image_tag和link_to结合起来使用过吧，是不是觉得很长很不干净呢，不用怕，我们其实可以在link_to中直接使用图片来替代文字的，如下：&lt;code&gt;&lt;%= link_to image_tag(&quot;search.gif&quot;, :border=&gt;0), :action =&gt; 'show', :id =&gt; user %&gt;&lt;/code&gt;注意里面的:border=&gt;0是为了去掉图片四周那个无聊的框框的，需要加上哦～
