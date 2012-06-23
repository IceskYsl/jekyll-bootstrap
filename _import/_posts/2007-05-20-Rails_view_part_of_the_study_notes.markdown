---
layout: post
title: rails view部分学习笔记
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
rails的view部分，是在controller执行完成后，通过显式或隐式调用render 寻找相关模板文件, 如 : rhtml 和rxml,并根据其生成相关页面推送至用户端。为了减少重复性，rails提供了一些复用机制：1、 layout  任何一个controller都可以有自己的layout（跟controller同名），该layout在其所有的action中共用。如果 controller没有设定自己的layout，rails会寻找application (controller的父类)的layout，当然也可以通过程序指定layout如： layout &quot;standard&quot; 或 render(:layout =&gt; &quot;layouts/simple&quot;)也可以不使用layout用:render(:layout =&gt; false)在layout模板中需要有 ： ，  以表明实际内容的渲染位置。2、 action渲染模板缺省与action同名，也可以自己指定如：render(:action =&gt; &quot;actionname&quot;)  render(:template =&gt; 'controller/name')render(:file =&gt; 'dir/template')3、  partial除上述之外，rails还提供了局部页面模板，它用作当一些共享元件在很多页面都有使用是，可以提出成为一个局部页面模板，以提高复用性。通常把这些共享的局部模板放在目录: app/views/shared, 通过在模板中执行下面语句使用: 除了:object 还可以使用 :collection， :locals, :spacer_template 等参数另外，rails还提供组件的概念。为了提供ajax的支持， rails还提供了另外一种模板 rjs。rjs模板可以生成javascript代码。
