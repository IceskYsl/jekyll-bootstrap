---
layout: post
title: RSS和ATOM的版本和规范
date: '2007-12-6'
comments: true
categories: Ruby&Rails
link: true
---
<p>由于需要在技能云(iTechTag.com)添加mash-up用户写过的文章（blog），于是写了一个自动探测用户提供的地址的RSS地址以及其附带的一些属性和其下的blog内容，由于之前只看了RSS2.0的规范，所以写的都是兼容RSS2.0的，测试了一把也相当顺利；</p>
<p>然后再测试透明的blog内容，无奈的是什么都检测不到，后来看了下他的塬，发现是ATOM的，以前倒是晓得RSS和ATOM，也晓得其不是很兼容，但不晓得差别这么大，看来还需要写一份解析ATOM的了。</p>
<p><strong>附录几个问题：</strong></p>
<p>1、怎么判断RSS是RSS2.0规范还是微软的SSE,还是Atom的XML格式？</p>
<p>文件头部&nbsp; <br />
RSS&nbsp;&nbsp; 2.0 判断&lt;rss&nbsp;&nbsp; version=&quot;2.0&quot;&gt;&nbsp; <br />
atom&nbsp; 判断&lt;feed&nbsp;&nbsp; xmlns=&quot;http://www.w3.org/2005/Atom&quot;&gt;</p>
<p>2、几个有用的文章</p>
<p><strong>RSS 简介</strong>：http://www.ibm.com/developerworks/cn/xml/x-rssintro/</p>
<p><strong>Atom 规范及中文翻译 附：ATOM规范英文原版</strong>&nbsp; http://hi.baidu.com/liberty88/blog/item/f5dd1db3decde1a7d8335a12.html</p>
