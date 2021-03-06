---
layout: post
title: Rails+Memcached,跑起来嗖嗖的
date: '2008-6-4'
comments: true
categories: Ruby&Rails
link: true
---
<p>很早前接触Rails的时候就知道<a href="http://www.danga.com/memcached/">memcached</a>了，只是在自己的服务器上尚未看到这个需求，但是真的不久将来可能出现的情况，还是提前做下功课比较靠谱。</p>
<p>今天在看一篇比较不错的文章&ldquo; <a href="http://blog.zhangjianfeng.com/article/743">从LiveJournal后台发展看大规模网站性能优化方法</a>&rdquo;，该文章说了其<strong>LiveJournal</strong>发展过程中的几个阶段，逐渐的扩展和完善架构，从一个真实的环境中看出其架构的基本趋势。文中提到了memcached，原来memcached就诞生于此，很有兴趣的再多了解一些，memcached属于<a href="http://www.danga.com/">Danga</a>，旗下还有其他几个很著名的东西，比如<a href="http://www.danga.com/mogilefs/">MogileFS</a>等。<br />
Memcached 是高效、快速的分布式内存对象缓存系统，主要用于加速 WEB 动态应用程序。关于Memcached的安装等，可以参考&ldquo;<a href="http://nio.infor96.com/php-memcached/">PHP &amp; memcached</a>&rdquo;这篇文章的说明，基本上和其他unix下的程序安装差不多，下载源码、编译等等，不再赘述。</p>
<p>其使用非常简单，直接就一个命令，连配置文件都省了，如下：</p>
<p><em>/usr/bin/memcached -d -m 128 -l 192.168.10.1 -p 11211 -u httpd</em></p>
<p>其<strong>参数</strong>分别代表：</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span>-d&nbsp;以守护程序（daemon）方式运行&nbsp;memcached；&nbsp;&nbsp;</span></span></li>
    <li class=""><span>-m&nbsp;设置&nbsp;memcached&nbsp;可以使用的内存大小，单位为&nbsp;M；&nbsp;&nbsp;</span></li>
    <li class="alt"><span>-l&nbsp;设置监听的&nbsp;IP&nbsp;地址，如果是本机的话，通常可以不设置此参数；&nbsp;&nbsp;</span></li>
    <li class=""><span>-p&nbsp;设置监听的端口，默认为&nbsp;11211，所以也可以不设置此参数；&nbsp;&nbsp;</span></li>
    <li class="alt"><span>-u&nbsp;指定用户，如果当前为&nbsp;root&nbsp;的话，需要使用此参数指定用户。&nbsp;&nbsp;</span></li>
</ol>
</div>
<p>如果你想了解在Rails中如何使用，请参cai同学翻译的&rdquo;<a href="http://www.caiwangqin.com/post/297">Ruby on Rails + Memcached</a>&ldquo;，或者直接去看原文；另外，如果你和我一样比较喜欢Nginx做webserver，你可以看看我写的<a href="http://iceskysl.1sters.com/?action=show&amp;id=295">Nginx在Ubuntu上的一系列文章</a>，马上会加上Memcached的相关内容。</p>
<p>&nbsp;</p>
<pre class="code">&nbsp;{% endcodeblock %}
