---
layout: post
title: 如何把用到的gems附到verdor中
date: '2008-1-21'
comments: true
categories: Ruby&Rails
link: true
---
<p>在本地装多少gems都无所谓，但是当在服务器上或者是 share host的时候，有的时候并不是您需要的gems都有安装的，这个时候，我们在想最好是在本地把需要的gems打包到vendor里面去，这样怎么迁移都不怕了。</p>
<p>于是google了一番，发现老外们已经实践过了，方法其实也不难，主要是要区分一些gems是无法做大的，但是其他的貌似都是可以的。</p>
<p>具体做法请参考如下这几个文章：</p>
<p>1、http://hideto.javaeye.com/blog/82235（中文介绍的，比较简短）</p>
<p><strong>2、http://rubygems.org/read/chapter/10（介绍gem命令的）</strong></p>
<p><strong>3、http://errtheblog.com/posts/50-vendor-everything（具体实现的）</strong></p>
<p>如上三篇文章。用到的命令主要就是gem，所以附带了上面那篇gem的参考：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>E:\Ysl\dev\1ster\vendor\gems&gt;gem&nbsp;unpack&nbsp;uuidtools&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Unpacked&nbsp;gem:&nbsp;<span class="string">'uuidtools-1.0.1'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>E:\Ysl\dev\1ster\vendor\gems&gt;gem&nbsp;unpack&nbsp;rio&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Unpacked&nbsp;gem:&nbsp;<span class="string">'rio-0.4.1'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>E:\Ysl\dev\1ster\vendor\gems&gt;ls&nbsp;&nbsp;</span></li>
    <li class=""><span>rio-0.4.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uuidtools-1.0.1&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>E:\Ysl\dev\1ster\vendor\gems&gt;&nbsp; <br />
    </span></li>
</ol>
</div>
</p>
