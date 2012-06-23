---
layout: post
title: Rails全文检索最佳方案:Sphinx+libmmseg+Ultrasphinx
date: '2008-6-25'
comments: true
categories: Ruby&Rails
tags: libmmseg rails Sphinx Ultrasphinx
link: true
---
大家知道，全文检索（特别是中文全文检索）中有两个比较重要的指标，性能和中文分词技术，由于性能要求，使得其必须采用C/C++的检索引擎才有生存的空间，其二是中文分词等，这也是个难题。
在Java中lucene是绝对的权威和首选，虽然其对中文分词支持也不是很好，但是有很多第三方的程序可以集成起来实现相关功能，而在Rails中，至今尚无权威的解决方案，最开始的时候是Ferret一枝独秀，现在另外一个很优秀的Sphinx。
刚接触Rails全文检索的时候就知道<strong>Sphinx</strong>了，当时还不是很完善，而且那个时候<strong>Ferret</strong>非常流行，所以也就没有多加关注，只记得这两个全文检索都不提供中文分词技术，而全文检索中的中文分词恰恰是无法绕过去的。
前段时间，看到有人介绍了<a href="http://www.coreseek.cn/opensource/mmseg/" target="_blank">libmmseg</a>， 这个是李沫南用C++编写的开源的中文分词软件，libmmseg的分词算法采用的是“基于词库的最大匹配算法”，分词速度为每秒300KB左右，使用 libmmseg，可以和Ferret结合起来做全文检索了，这个JavaEye的Robbin有介绍过，详细情况请参看《<a href="http://www.javaeye.com/topic/196451">使用libmmseg实现Ruby的中文分词功能</a>》，其详细介绍了如何在Ruby中调用libmmseg做中文分词，进而使用Ferret做全文检索。
但是值得说的是，libmmseg本来是被作者用来实现Sphinx全文检索软件的中文分词功能，因此作者给Sphinx提供了一个补丁文件，可以让Sphinx集成libmmseg，从而支持对于中文文章的全文检索功能，关于这一点可以看《<a href="http://www.coreseek.com/forum/index.php?action=vthread&amp;forum=2&amp;topic=17">Rails程序员Sphinx中文全文检索安装指南</a>》的介绍。
所以，如果你要在Rails中做全文检索的话，我推荐您使用的是Sphinx + libmmseg + Ultrasphinx来实现，其简单高效，且支持并发，再仔细说一下：
<strong>1、Sphinx</strong>，是俄罗斯的Andrew Aksyonoff 开发的，被人叫做“狮身人面”，关于其高效的介绍，你可以参考《<a href="http://www.javaeye.com/topic/122696">JavaEye3.0开发手记之三 － 狮身人面</a>》，其性能出色，和架构清晰，学习成本很低，且其和数据库结合的很棒。其他相关介绍可以参考“<a href="http://www.coreseek.cn/index.php?page=Sphinx">coreseek对Sphinx的就介绍</a>”，也可以参考其发布的《<a href="http://www.coreseek.com/uploads/pdf/sphinx_doc_zhcn_0.9.pdf">Coreseek 全文检索服务器 2.0 (Sphinx 0.9.8)参考手册</a>》，其Coreseek就是基于Sphinx的一个全文搜索服务器。
<strong>2、libmmseg</strong>，就是前面说的中文分词程序，当前最新版本是0.73，采用C++开发，同时支持Linux平台和Windows平 台，切分速度大约在300K/s（PM-1.2G），libmmseg从0.7.2版本开始，作者提供了ruby调用的接口，所以我们可以直接在ruby 程序里面调用libmmseg进行分词，相当方便。
<strong>3、Ultrasphinx</strong>，是一个Rails插件，Rails开发人员可以使用它来很方便地调用Sphinx的功能。其他类似的插件有<a href="http://www.datanoise.com/articles/2007/3/23/acts_as_sphinx-plugin">acts_as_sphinx</a>，使用其可以很方便的在Rails中整合Sphinx。

以上三个的安全不是很复杂，推荐是在Unix上，请参考《<a href="http://www.coreseek.com/forum/index.php?action=vthread&amp;forum=2&amp;topic=17">Rails程序员Sphinx中文全文检索安装指南</a>》，这个文章就是基于以上三个组件的安装和使用说明。我会在近期发布出一些笔记和文档，以帮助需要的朋友更好的实现自己的全文检索。
<strong>
参考文档：</strong>
1、<a href="http://www.datanoise.com/articles/2007/3/23/acts_as_sphinx-plugin">acts_as_sphinx plugin</a>
2、<a href="http://www.javaeye.com/topic/122696">JavaEye3.0开发手记之三 － 狮身人面</a>
3、<a href="http://www.javaeye.com/topic/196451">使用libmmseg实现Ruby的中文分词功能</a>
4、<a href="http://agilewebdevelopment.com/plugins/ultrasphinx">Plugins - Ultrasphinx</a>
5、<a href="http://www.coreseek.com/forum/index.php?action=vthread&amp;forum=2&amp;topic=17">Rails程序员Sphinx中文全文检索安装指南</a>
6、<a href="http://www.sphinxsearch.com/downloads.html">Sphinx</a>
