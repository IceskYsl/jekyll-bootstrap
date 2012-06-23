---
layout: post
title: LoadError__no_such_file_to_load_--_RMagick
date: '2008-5-11'
comments: true
categories: Ruby&Rails
link: true
---
<p>虽然在ubuntu上的rails里面使用过很多次的RMagick,但是却一直没有在单独的ruby</p>
<p>script中使用过,这次需要单独使用来画一些图片,于是写了一段代码,但是却跑不起来,老是报&quot;LoadError: no such file to load -- RMagick &quot;错误,查了些资料,搞清楚原因,记录如下:</p>
<p><strong>1.注意大小写敏感度</strong></p>
<p>在windows或者mac上,不敏感大小写,可以:{% codeblock %}require 'rmagick'{% endcodeblock %}</p>
<p>{% codeblock %}但是在linux上,却不行,需要写:{% endcodeblock %}{% codeblock %} require 'RMagick'{% endcodeblock %}</p>
<p>{% codeblock %}否则您可能得到如下错误:{% endcodeblock %}</p>
<p>{% codeblock %} MissingSourceFile: no such file to load -- rmagick{% endcodeblock %}</p>
<p><strong>2.单独ruby中需要引用{% codeblock %}rubygems{% endcodeblock %}</strong></p>
<p>{% codeblock %}require 'rubygems'<br />
require 'RMagick'{% endcodeblock %}</p>
<p>{% codeblock %}如果不引用{% endcodeblock %}{% codeblock %}rubygems,可能会看到如下错误:{% endcodeblock %}</p>
<p>{% codeblock %} `require': no such file to load -- rmagick (LoadError){% endcodeblock %}</p>
<p>{% codeblock %}或者<br />
{% endcodeblock %}</p>
<p>{% codeblock %} `require': no such file to load -- RMagick (LoadError){% endcodeblock %}</p>
<p><strong>参考文档:</strong></p>
<ul>
    <li>在Ubuntu上安装RMagic:http://www.hhtong.com/blog1/articles/2006/11/11/ubuntu20061111-install-rmagic</li>
    <li>Ruby on Rails RMagic:http://www.mysmallventures.com/ruby-on-rails-rmagick-linux-issues/</li>
</ul>
