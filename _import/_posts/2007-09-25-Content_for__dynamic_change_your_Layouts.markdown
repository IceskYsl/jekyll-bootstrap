---
layout: post
title: content_for:动态改变您的Layouts
date: '2007-9-25'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong>content_for</strong>这个方法竟然一直没看到过，今天也是无意中看到的，看到对此介绍为：<br />
If you want to change something in the layout on a per-template basis, content_for is your answer! This allows templates to specify view code that can be placed anywhere in a layout.<br />
也就是说，如果你想动态的改变你原来layout中的东西，你可以使用content_for这个方法，结合代码就很好理解了，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="comments">&lt;!--&nbsp;projects/index.rhtml&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="tag">&lt;</span><span>%&nbsp;content_for&nbsp;:head&nbsp;do&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span>%=&nbsp;stylesheet_link_tag&nbsp;'projects'&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="tag">&lt;</span><span>%&nbsp;end&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comments">&lt;!--&nbsp;layouts/application.rhtml&nbsp;--&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">head</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span class="tag-name">title</span><span class="tag">&gt;</span><span>Todo&nbsp;List</span><span class="tag">&lt;/</span><span class="tag-name">title</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span>%=&nbsp;stylesheet_link_tag&nbsp;'application'&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="tag">&lt;</span><span>%=&nbsp;yield&nbsp;:head&nbsp;%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">head</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
先用<span><span>content_for申明一个变量，接着可以在你需要的地方使用</span></span><span><span class="tag">&lt;</span><span>%=&nbsp;yield&nbsp;:name %</span><span class="tag">&gt;</span><span> 来调用，参考如上代码应该不难理解。</span></span></p>
<p><span><span>另外，对于其详细用法，</span></span></p>
<p><span><span>请参考API:<a href="http://api.rubyonrails.com/classes/ActionView/Helpers/CaptureHelper.html">http://api.rubyonrails.com/classes/ActionView/Helpers/CaptureHelper.html</a><br />
</span></span></p>
