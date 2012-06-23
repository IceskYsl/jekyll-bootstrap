---
layout: post
title: 抓取在线网页图像的方法～
date: '2007-10-12'
comments: true
categories: Ruby&Rails
link: true
---
<p>在考虑给技能云添加一个特色的功能，就是给动态抓取提交项目的页面图片，google了一些方法，记录如下：</p>
<p>1、http://thumbnailspro.com/网站</p>
<div class="codeText">
<div class="codeHead">Website Thumbnails - Screenshots captured in seconds - Over 1000 sizes!</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">a</span><span>&nbsp;</span><span class="attribute">href</span><span>=</span><span class="attribute-value">&quot;http://thumbnailspro.com&quot;</span><span>&nbsp;</span><span class="attribute">title</span><span>=</span><span class="attribute-value">&quot;website&nbsp;thumbnails&quot;</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="tag">&lt;</span><span class="tag-name">img</span><span>&nbsp;</span><span class="attribute">src</span><span>=</span><span class="attribute-value">&quot;http://thumbnailspro.com/thumb.php?url=http://www.itechtag.com&amp;S=150&quot;</span><span>&nbsp;</span><span class="attribute">border</span><span>=</span><span class="attribute-value">&quot;0&quot;</span><span>&nbsp;</span><span class="attribute">alt</span><span>=</span><span class="attribute-value">&quot;website&nbsp;thumbnails&quot;</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">a</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>这个网站号称Screenshots captured in seconds，我在本地测试了几个，感觉速度还不错，我们可以直接使用，或者第一次把这个图片保存到本地即可。</p>
<p>2、http://webthumb.bluga.net/home.php<br />
按照http://snippets.dzone.com/posts/show/3621上面的代码，抓取，采用ruby代码，用webservice连接到做snap的网站获得jpg文件，但是需要注册，申请API的key，免费有限制每月250次。</p>
<p>3、www.artviper.net</p>
<p>第3种比较简单和第一种web service相似<br />
不过不用ruby而是纯html img的tag， 有点慢<br />
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">img</span><span>&nbsp;</span><span class="attribute">src</span><span>=</span><span class="attribute-value">&quot;http://www.artviper.net/screenshots/screener.php?&amp;url=www.meinedomain.com&amp;q=xx&amp;h=hh&amp;w=ww&amp;sdx=xxx&amp;sdy=xxx&quot;</span><span>&nbsp;</span><span class="attribute">alt</span><span>=</span><span class="attribute-value">&quot;artViper&nbsp;designstudio&nbsp;website&nbsp;thumbnail&nbsp;&quot;</span><span class="tag">/&gt;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
The parameters as following:<br />
&nbsp;&nbsp;&nbsp; * q = quality level ( 30-70% )<br />
&nbsp;&nbsp;&nbsp; * h = output height<br />
&nbsp;&nbsp;&nbsp; * w = output width<br />
&nbsp;&nbsp;&nbsp; * sdx = crop area horizontally<br />
&nbsp;&nbsp;&nbsp; * sdy = crop area vertically<br />
<br />
If you omit the sdx &amp; sdy values, the whole page gets snapped.<br />
Don't forget to add a backlink to www.artviper.net or www.artviper.de ( textlink is enough ) but please place the link good visible.<br />
http://www.artviper.net/screenshots/screener.php?&amp;url=http://www.itechtag.com&amp;q=70&amp;h=180&amp;w=360</p>
<p><img src="http://www.artviper.net/screenshots/screener.php?&amp;url=http://www.itechtag.com&amp;q=70&amp;h=180&amp;w=360" alt="" /></p>
