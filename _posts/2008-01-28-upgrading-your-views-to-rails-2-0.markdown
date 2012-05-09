--- 
layout: post
comments: true
title: Upgrading your views to Rails 2.0
date: 2008-1-28
link: false
categories: life
---
<p>升级后VIEW的后缀有改变，可以使用如下命令改.</p>
<div class="codeText">
<div class="codeHead">Shell代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">for</span><span>&nbsp;old&nbsp;</span><span class="keyword">in</span><span>&nbsp;`find&nbsp;app/views&nbsp;-name&nbsp;*.rhtml`;&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;svn&nbsp;mv&nbsp;<span class="variable">$old</span><span>&nbsp;`dirname&nbsp;</span><span class="variable">$old</span><span>`/`basename&nbsp;</span><span class="variable">$old</span><span>&nbsp;.rhtml`.html.erb;&nbsp;done&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>http://softiesonrails.com/2007/7/11/upgrading-your-views-to-rails-2-0</p>
