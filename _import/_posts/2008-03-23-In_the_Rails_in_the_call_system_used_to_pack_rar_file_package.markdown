---
layout: post
title: 在Rails中调用系统的rar来打包文件包
date: '2008-3-23'
comments: true
categories: Ruby&Rails
link: true
---
<p>由于项目需求,用户可以定制,下载一些数据和图片,于是乎就需要实现的功能有:打包,中文,以及下载等,这里大概的说一下,我也是测试了好久,查了好多资料踩搞明白一些问题,首先BS下window所谓的国际化.真是FT.</p>
<p>先看如果压缩文件,看代码,如下:</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>pwd&nbsp;=&nbsp;</span><span class="builtin">Dir</span><span>.pwd&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger.info(<span class="string">&quot;Dir.pwd=#{pwd}&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="builtin">Dir</span><span>.chdir(</span><span class="string">&quot;#{cp_dir}&quot;</span><span>)&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;system&nbsp;<span class="string">&quot;rar&nbsp;a&nbsp;&nbsp;#{local_dir_name}&nbsp;#{local_dir_name}&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>使用了Ruby的Dir及其代码块的临时切换目录的功能,实在是棒,开始的时候,我还在想使用Tar或者rar用-C参数来去掉打包后的文件夹路径;</p>
<p>至于这里为什么使用rar而没有使用比较传统的tar或者gzip,zip或则7zip等,主要是乱码的问题,详细的大家可以查看我以前的文章&lt;<a href="../../../?action=show&amp;id=229" id="r_l_3">linux和windows之间的压缩包乱码</a>&gt;.</p>
<p>而后下载的过程中,再次感觉WIn下IE的可恶,乱码,呵呵,没关系,我们可以这样做,如下:<span>&nbsp;<br />
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>res&nbsp;=&nbsp;Resource.find(params[</span><span class="symbol">:id</span><span>])&nbsp;&nbsp;</span></span></li>
    <li class=""><span>res.update_attribute(<span class="symbol">:downed_count</span><span>,&nbsp;res.downed_count&nbsp;+&nbsp;1)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>user_agent&nbsp;=&nbsp;request.user_agent.downcase&nbsp;&nbsp;</span></li>
    <li class=""><span>filename&nbsp;=&nbsp;<span class="builtin">File</span><span>.basename(res.path)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">if</span><span>&nbsp;user_agent&nbsp;&nbsp;=~&nbsp;/msie/i&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;send_file(RAILS_ROOT&nbsp;+&nbsp;res.path,<span class="symbol">:buffer</span><span>&nbsp;=&gt;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">&quot;16384&quot;</span><span>,</span><span class="symbol">:filename</span><span>=&gt;CGI:</span><span class="symbol">:escape</span><span>(filename))&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">else</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;send_file(RAILS_ROOT&nbsp;+&nbsp;res.path,<span class="symbol">:buffer</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;16384&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</span></p>
<p>差不多这些都是关键,搞明白了,就基本上无敌了,呵呵.</p>
