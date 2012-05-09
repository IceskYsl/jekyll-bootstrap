--- 
layout: post
comments: true
title: image_tag with popup for alt attribute
date: "2007-10-16"
link: false
categories: life
---
<p>firefox不能显示alt指定的文字，只能显示title 指定的，以前的做法是每个地方都写两个，真是够麻烦的，在rails中可以扩充下这个helper，使用起来方便多了，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">module</span><span>&nbsp;ApplicationHelper&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;image_tag(location,&nbsp;options)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;options[<span class="symbol">:title</span><span>]&nbsp;||=&nbsp;options[</span><span class="symbol">:alt</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">super</span><span>(location,&nbsp;options)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
感谢互联网～</p>
