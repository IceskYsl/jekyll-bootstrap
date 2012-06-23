---
layout: post
title: Introducing_the_AJAX_Feed_API_FeedControl
date: '2007-10-14'
comments: true
categories: Html/css/js Ruby&Rails
link: true
---
<span style="color: #333399;"> 这篇文章是我很早前写的，放在原来的blog上的，无奈那个blog坏掉了，幸好还有”百度快照 “（http://cache.baidu.com/c?word=feedcontrol&amp;url=http%3A//weblog% 2E1ster%2Ecn/%3Faction%3Dshow%26id%3D112&amp;p=98769a45dcd011a05be7d3284c0096&amp; user=baidu），找回来了，呵呵。以下是原文。</span>

Google放出来的AJAX feed API我老早就关注到了，也试用了一些，感觉还真的不错，现在又添加了一些东西，如下：
其API都很简单，详细的可以看这个页面上的介绍：
http://code.google.com/apis/ajaxfeeds/documentation/reference.html#FeedControl
只有一个构造器：FeedControl
四个函数：
<strong>1.addFeed(url, label) /</strong>/添加需要显示的FEED的URL
<strong>2.addFeed(element, opt_options?)</strong>；//这个其实就是draw方法，指定显示的方式，例如：

feedControl.draw(
document.getElementById("feedControl"),
{
drawMode : google.feeds.FeedControl.DRAW_MODE_TABBED
});

feedControl这个是页面的DOM的ID名称，google.feeds.FeedControl.DRAW_MODE_TABBED 就是指定的显示方式，默认值是：google.feeds.FeedControl.DRAW_MODE_LINEAR.

<strong>3.setNumEntries(num)；</strong> //设定显示的条数（貌似只能统一指定，不能为各个FEED单独指定）
<strong>4.setLinkTarget(linkTarget)</strong> //设定链接的打开方式，其值分别如下：

* google.feeds.LINK_TARGET_BLANK - links will open in a new window
* google.feeds.LINK_TARGET_SELF - links will open in the current window
* google.feeds.LINK_TARGET_TOP - links will open in the topmost frame
* google.feeds.LINK_TARGET_PARENT - links will open in either the topmost frame, or replace the current frame.
* anything-else - the value of target in the resulting anchor element is set to linkTarget

附录其网站上的说明：
---------------
This morning we added a new class to the Google AJAX Feed API designed to allow you to more easily add a collection of feeds to your pages. The FeedControl is pretty simple:

var feedControl = new google.feeds.FeedControl();
feedControl.addFeed("http://www.digg.com/rss/index.xml", "Digg");
feedControl.addFeed("http://feeds.feedburner.com/Techcrunch", "TechCrunch");
feedControl.draw(document.getElementById("feedControl"));

In addition to the formal documentation, we have put together a few samples to help you quickly come up to speed.
<ul>
	<li>Basic <strong style="color: black; background-color: #ffffff;">FeedControl</strong> - <a href="http://www.google.com/uds/samples/feedapidocs/feedcontrol.html"><strong style="color: black; background-color: #ffffff;">feedcontrol</strong>.html</a></li>
	<li style="background-color: #ffffff;">Tabbed <strong style="color: black;">FeedControl</strong> - <a href="http://www.google.com/uds/samples/feedapidocs/tabbed.html">tabbed.html</a></li>
	<li style="background-color: #ffffff;">Sidebar Style <strong style="color: black;">FeedControl</strong> - <a href="http://www.google.com/uds/samples/feedapidocs/sidebar.html">sidebar.html</a></li>
	<li><a href="http://ajaxfeed.blogspot.com/">AJAX Feed API Playground Blog</a></li>
</ul>
另外，补充一点东西，如果你需要定制他的CSS样式表，可以按照这个模式定制，如下：
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span class="comments">&lt;!-- The Feed Control Class (Note: Linear Mode is Shown) --&gt;</span><span>  </span></span></li>
	<li><span><span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-control"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  <span class="comments">&lt;!-- Per Feed Container --&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-resultsRoot"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>    <span class="comments">&lt;!-- Per Feed Header --&gt;</span><span>  </span></span></li>
	<li><span>    <span class="comments">&lt;!-- .gfc-title holds Feed's Label --&gt;</span><span>  </span></span></li>
	<li class="alt"><span>    <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-resultsHeader"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>      <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-title"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>    <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>    <span class="comments">&lt;!-- Collection of Entries --&gt;</span><span>  </span></span></li>
	<li><span>    <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-results"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>      <span class="comments">&lt;!-- One .gfc-result per entry --&gt;</span><span>  </span></span></li>
	<li class="alt"><span>      <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-result"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>        <span class="comments">&lt;!-- One .gf-result per entry --&gt;</span><span>  </span></span></li>
	<li><span>        <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-result"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>          <span class="comments">&lt;!-- Hyperlinked Entry Title --&gt;</span><span>  </span></span></li>
	<li class="alt"><span>          <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-title"</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>            <span class="tag">&lt;</span><span class="tag-name">a</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-title"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">a</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>          <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>          <span class="comments">&lt;!-- Author (Only if entry.author is present --&gt;</span><span>  </span></span></li>
	<li><span>          <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-author"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>          <span class="comments">&lt;!-- Published Date (Only if entry.publishedDate is present --&gt;</span><span>  </span></span></li>
	<li class="alt"><span>          <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-relativePublishedDate"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>          <span class="comments">&lt;!-- Snippet entry.contentSnippet --&gt;</span><span>  </span></span></li>
	<li><span>          <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gf-snippet"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>        <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>      <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>      ...  </span></li>
	<li class="alt"><span>      <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-result"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>    <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  ...  </span></li>
	<li class="alt"><span>  <span class="tag">&lt;</span><span class="tag-name">div</span><span> </span><span class="attribute">class</span><span>=</span><span class="attribute-value">"gfc-resultsRoot"</span><span class="tag">&gt;</span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">div</span><span class="tag">&gt;</span><span>  </span></span></li>
</ol>
</div>
参考Google文档：http://code.google.com/apis/ajaxfeeds/documentation/reference.html#FeedControl
