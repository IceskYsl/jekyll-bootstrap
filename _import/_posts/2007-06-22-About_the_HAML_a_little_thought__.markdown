---
layout: post
title: 关于HAML的一点点想法～
date: '2007-6-22'
comments: true
categories: 视觉观察 Ruby&Rails
link: true
---
大清早的，CFC就给我推荐HAML,说未来必将流行，这个东西以前我关注过，无非是使用一种规定的标记来替代RHTML，在显示的时候反向解析（这是我的理解），CFC给我看了他写的一篇文章（没有找到单篇的RSS，只能COPY过来啦==&quot;），内容如下：---------------------------最近開始接觸HAML在Rails中，預設使用ERb來當作模板描述語言，可是這樣寫個人認為非常醜也非常累...而之前看到HAML時感覺到那東西似乎沒有太大的可用性，難道要Designer也學Ruby嗎？不過後來我想通了..架構這部分可以給Coder作，Designer乖乖設計CSS就夠了..來看看底下這個Sample吧：*這是rhtml*&lt;code&gt;&lt;div id='content'&gt;    &lt;div class='left column'&gt;      &lt;h2&gt;Welcome to our site!&lt;/h2&gt;      &lt;p&gt;        &lt;%= print_information %&gt;      &lt;/p&gt;    &lt;/div&gt;    &lt;div class=&quot;right column&quot;&gt;      &lt;%= render :partial =&gt; &quot;sidebar&quot; %&gt;    &lt;/div&gt;  &lt;/div&gt;&lt;/code&gt;*這是HAML*&lt;code&gt;    #content    .left.column      %h2 Welcome to our site!      %p= print_information    .right.column= render :partial =&gt; &quot;sidebar&quot;&lt;/code&gt;看！少了多少行？可以讓開發速度變快耶= v =...最主要的是，看起來也比較美觀了！--------------------------说说偶的看法：（基本上是不推荐的）1、多了一次解析反解析，效果难道不受影响（除非是直接解析成html）2、难道要Designer也學Ruby嗎？同问？3、我把RHTML分成 局部模板，单个文件就不会很大，也很简单。4、美观么？ruby本来是不强制缩进的，这个东西还要求缩进~=_=~有谁再给出一些理由呢？
