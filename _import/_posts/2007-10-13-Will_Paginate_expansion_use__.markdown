---
layout: post
title: Will Paginate的扩充使用～
date: '2007-10-13'
comments: true
categories: Ruby&Rails
link: true
---
<p>Will Paginate真的很容易使用，看他自带的readme就能明白，但是其他的一些东西可以看看代码就明白了，比如你想显示一共多少页？当前是第几页？已经一共多少个item，都是可以做到的，看一个我在<a href="http://Will Paginate真的很容易使用，看他自带的readme就能明白，但是其他的一些东西可以看看代码就明白了，比如你想显示一共多少页？当前是第几页？已经一共多少个item，都是可以做到的，看一个我在技能云上用的例子，代码如下：">技能云</a>上用的例子，代码如下：</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="comments">&lt;!--分页导航&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="tag">&lt;</span><span class="tag-name">table</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">tr</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">td</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span>%=&nbsp;will_paginate&nbsp;@projects&nbsp;%</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">td</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">td</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">div</span><span>&nbsp;</span><span class="attribute">class</span><span>=</span><span class="attribute-value">&quot;pagination&quot;</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">span</span><span>&nbsp;</span><span class="attribute">class</span><span>=</span><span class="attribute-value">&quot;lable&quot;</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">b</span><span class="tag">&gt;</span><span>页面信息:&nbsp;</span><span class="tag">&lt;/</span><span class="tag-name">b</span><span class="tag">&gt;</span><span>总</span><span class="tag">&lt;</span><span>%=@projects.total_entries&nbsp;%</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">b</span><span class="tag">&gt;</span><span>个,&nbsp;共</span><span class="tag">&lt;</span><span class="tag-name">b</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span>%=@projects.page_count&nbsp;%</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">b</span><span class="tag">&gt;</span><span>页,&nbsp;&nbsp;当前第</span><span class="tag">&lt;</span><span class="tag-name">b</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span>%=&nbsp;@projects.current_page%</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">b</span><span class="tag">&gt;</span><span>页.&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;/</span><span class="tag-name">span</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;/</span><span class="tag-name">tr</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">table</span><span class="tag">&gt;</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>其他的用法，比如显示的页数什么的，以及是否支持ajax等都是可以找到相关资料的，我就不多说了，参考如下资料：</p>
<p>http://errtheblog.com/post/929</p>
