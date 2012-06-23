---
layout: post
title: Dynamic_Scopes_is_si_cool_
date: '2009-2-13'
comments: true
categories: 技术归总
tags: Ruby&amp;Rails Scopes
link: true
---
<p>早就见过Rails2中增加的Scope功能，但是一直没在意，今天遇到一个需求，想在@user.topics中按照条件返回指定的数量或者排序，发现按照以往的处理方法比较麻烦，也不够优雅，经一朋友指点，觉得Scope应该有戏，仔细看了下，果然适合我的这个场景，代码非常优雅，如下：</p>
<p>&nbsp;&nbsp;&nbsp; @albums =Album.scoped_by_singer_id(@artist.id).find(:all, :limit =&gt; 5)<br />
不多说，应该都看得懂，如果你想了解更加详细的使用方法，你可以去下面的参考资料地址去看看，再举个例子：</p>
<p><span style="border-collapse: separate; color: rgb(51, 51, 51); font-family: verdana; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span">
<pre style="border: 1px solid rgb(204, 204, 204); margin: 0px 0px 10px; padding: 10px; overflow: auto; background-color: rgb(238, 238, 238); line-height: 1.4em;"><tt style="border-width: 0px; margin: 0px; padding: 0px; background-image: none;">Order<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">.</span>scoped_by_customer_id<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">(</span><span style="margin: 0px; padding: 0px; color: rgb(153, 51, 153);">12</span><span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">)</span><br />Order<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">.</span>scoped_by_customer_id<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">(</span><span style="margin: 0px; padding: 0px; color: rgb(153, 51, 153);">12</span><span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">).</span>find<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">(:</span>all<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">,</span><br />  <span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">:</span>conditions <span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">=&gt;</span> <span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);">&quot;status = 'open'&quot;</span><span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">)</span><br />Order<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">.</span>scoped_by_customer_id<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">(</span><span style="margin: 0px; padding: 0px; color: rgb(153, 51, 153);">12</span><span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">).</span>scoped_by_status<span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">(</span><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);">&quot;open&quot;</span><span style="margin: 0px; padding: 0px; color: rgb(153, 0, 0);">)</span></tt>{% endcodeblock %}
</span></p>
<p><span style="border-collapse: separate; color: rgb(51, 51, 51); font-family: verdana; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span">
<ul style="margin: 1em 0px 10px; padding: 0px; list-style-type: none;">
    <li style="margin: 0px 0px 0px 0.5em; padding: 0px 0px 0px 1em; background-image: url(http://guides.rubyonrails.org/images/bullet.gif); background-repeat: no-repeat; background-position: 0px 0.55em;">
    <p style="margin: 0px 0px 0.5em; padding: 0px;">Lead Contributor:<span class="Apple-converted-space">&nbsp;</span><a style="margin: 0px; padding: 0px; color: rgb(187, 34, 51);" href="http://evilmartians.com/">Yaroslav Markin</a></p>
    </li>
    <li style="margin: 0px 0px 0px 0.5em; padding: 0px 0px 0px 1em; background-image: url(http://guides.rubyonrails.org/images/bullet.gif); background-repeat: no-repeat; background-position: 0px 0.55em;">
    <p style="margin: 0px 0px 0.5em; padding: 0px;">More Information:<span class="Apple-converted-space">&nbsp;</span><a style="margin: 0px; padding: 0px; color: rgb(153, 17, 34);" href="http://ryandaigle.com/articles/2008/12/29/what-s-new-in-edge-rails-dynamic-scope-methods">What&rsquo;s New in Edge Rails: Dynamic Scope Methods</a>.</p>
    </li>
</ul>
</span></p>
<p>参考：</p>
<p><a href="http://guides.rubyonrails.org/2_3_release_notes.html">http://guides.rubyonrails.org/2_3_release_notes.html</a></p>
<p><a href="http://ryandaigle.com/articles/2008/12/29/what-s-new-in-edge-rails-dynamic-scope-methods">http://ryandaigle.com/articles/2008/12/29/what-s-new-in-edge-rails-dynamic-scope-methods</a></p>
