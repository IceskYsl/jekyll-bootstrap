---
layout: post
title: Ruby的集合对象的遍历技巧
date: '2008-3-30'
comments: true
categories: Ruby&Rails
link: true
---
<p>前面一篇文章说到了<a href="http://iceskysl.1sters.com/?action=show&amp;id=238">在Rails中实现缓存(码表)</a>,接下来就说说如何度缓存的码表做查询,这里说的缓存有可能是数组,或者是Hash.</p>
<p>1.先看数组的</p>
<p>可以使用delect或者select方法来查找需要的那个元素,代码段如下:</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;get_object_by_id(collections,id)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;collections.select{|c|&nbsp;c.step_id&nbsp;==&nbsp;id}&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
2.Hash的,待续</p>
