--- 
layout: post
comments: true
title: "rsay: ruby interface to the google translation api"
date: 2008-12-8
link: false
categories: life
---
<p>有的时候，需要对一些词语做转换（翻译），这个实现方式有两种，一种是使用Ruby或者其他语言做一些语言转换；一种是利用其它平台的接口API，翻译成目标语言。<br />
第二种方式实现起来比较方便，目前比较成熟的是Google translation ，但是其没有REST的接口，一般的做法是直接调用页面，用正则表达式抓取相关内容。<br />
在Ruby中已经有人写出了gem，比较方便，大概步骤如下：<br />
taojer ~/softback: gem install&nbsp; rsay-1.0.0.gem&nbsp; --local<br />
ERROR:&nbsp; Error installing rsay-1.0.0.gem:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsay requires json (&gt;= 1.1.3, runtime)<br />
taojer ~/softback: gem install json<br />
ERROR:&nbsp; While executing gem ... (Errno::EACCES)<br />
&nbsp;&nbsp;&nbsp; Permission denied - /usr/lib/ruby/gems/1.8/cache/json-1.1.3.gem<br />
taojer ~/softback: sudo gem install json<br />
Building native extensions.&nbsp; This could take a while...<br />
Successfully installed json-1.1.3<br />
1 gem installed<br />
Installing ri documentation for json-1.1.3...<br />
<br />
No definition for cState_configure<br />
<br />
No definition for cState_configure<br />
Installing RDoc documentation for json-1.1.3...<br />
<br />
No definition for cState_configure<br />
<br />
No definition for cState_configure<br />
taojer ~/softback: gem install&nbsp; rsay-1.0.0.gem&nbsp; --local<br />
ERROR:&nbsp; Error installing rsay-1.0.0.gem:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsay requires htmlentities (&gt;= 4.0.0, runtime)<br />
taojer ~/softback: sudo gem install htmlentities<br />
Successfully installed htmlentities-4.0.0<br />
1 gem installed<br />
Installing ri documentation for htmlentities-4.0.0...<br />
Installing RDoc documentation for htmlentities-4.0.0...<br />
taojer ~/softback: gem install&nbsp; rsay-1.0.0.gem&nbsp; --local<br />
ERROR:&nbsp; While executing gem ... (Gem::FilePermissionError)<br />
&nbsp;&nbsp;&nbsp; You don't have write permissions into the /usr/lib/ruby/gems/1.8 directory.<br />
taojer ~/softback: sudo gem install&nbsp; rsay-1.0.0.gem&nbsp; --local<br />
Successfully installed rsay-1.0.0<br />
1 gem installed<br />
<br />
再看个例子，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">&quot;rubygems&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">&quot;rsay&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>result&nbsp;=&nbsp;Translate.t(<span class="string">&quot;Hello&nbsp;my&nbsp;Friend&quot;</span><span>,&nbsp;Language::ENGLISH,&nbsp;Language::ITALIAN)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>puts&nbsp;result&nbsp;&nbsp;</span></li>
    <li class="alt"><span>------&nbsp;&nbsp;</span></li>
    <li class=""><span>taojer&nbsp;~/tmpfiles:&nbsp;ruby&nbsp;t_c.rb&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Ciao&nbsp;amico&nbsp;mio&nbsp;&nbsp;</span></li>
</ol>
</div>
<p>参考：<br />
http://code.google.com/p/rsay/</p>
