---
layout: post
title: 如何完成非utf8格式的RSS转换
date: '2008-1-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>在<strong>技能云</strong>的开发过程中，由于提供了抓取用户提交的Feed上的文章的功能，于是乎，遭受到编码问题的困扰，按照一般的规范，RSS或者ATOM都应该使用UTF-8的编码吧，无奈的是总有些人不遵守，比较<em>baid空间</em>的RSS就是gb2312编码的。<br />
<br />
没办法，竟然用户提出来，我也只能想办法搞定它了。其实原理也很简单，读取该feed的编码，然后在入库前先做此编码转换。<br />
至于如何取得该feed的编码，可以参考我前面写的这篇文章（http://iceskysl.1sters.com/?action=show&amp;id=184）。</p>
<p>PS：新版本的firefox3b2对我这个blog的编辑器支持不是很好，无法弹出加链接等等的框，比较不爽。。</p>
