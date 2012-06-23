---
layout: post
title: Textile_Editor_Helper
date: '2007-5-25'
comments: true
categories: Ruby&Rails
link: true
---
*Textile*是一种语言标记格式，目前在ROR领域用的相当多，本着简洁好用的原则，这套规则就像PHP领域内的BBCODE一样流行，但是一直一来，都是靠手工去写这些标识符号，很不方便，也曾萌发了写一套可视化的东西来，可惜一直没有时间和精力，今天看到slate blog的blog上有关于这个的东西，感觉就是自己想实现的那个，看了下视频（http://www.youtube.com/watch?v=wQYedmbsJf4）和DEMO（http://slateinfo.blogs.wvu.edu/plugins/textile_editor_helper/demo），果然是的，试用了下，很方便，效果很好，再各种浏览器下都表现不错，推荐给大家。可以先看下它的功能：安装也挺方便的：+script/plugin install http://svn.webtest.wvu.edu/repos/rails/plugins/textile_editor_helper/+使用：bq.     # 1.  run rake textile_editor_helper:install   2. for the textarea(s) that you want to add the TEH toolbar to replace the text area tag(s) with: &lt;%= textile_editor 'object', 'field' -%&gt; just like writing a text area tag, same options   3. at the end of your form put in the following code: &lt;%= textile_editor_initialize -%&gt; Important!   4. save your view and check it out*注意*：To use Textile, you must install the RedCloth gem first.
