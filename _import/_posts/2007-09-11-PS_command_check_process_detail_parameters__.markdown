---
layout: post
title: PS命令查看进程详细参数～
date: '2007-9-11'
comments: true
categories: Ruby&Rails
link: true
---
<p>遇到一个问题需要查看下当前进程中执行到哪条命令了，于是</p>
<p>使用ps -ef | grep java，无奈看不全参数，于是google，请教了下其他同学，得到：</p>
<div class="codeText">
<div class="codeHead">LUNIX代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>ps&nbsp;-auxww&nbsp;|&nbsp;more&nbsp;&nbsp;</span></span></li>
</ol>
</div>
