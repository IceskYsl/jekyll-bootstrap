---
layout: post
title: 自动FTP下载多个文件
date: '2007-11-22'
comments: true
categories: Ruby&Rails
link: true
---
<p>
<div class="codeText">
<div class="codeHead">SHELL代码</div>
<ol start="1" class="dp-c">
    <li class="alt"><span><span>ftp&nbsp;-i&nbsp;-n&nbsp;10.1.1.1&nbsp;&lt;&lt;YSL&nbsp;&nbsp;</span></span></li>
    <li class=""><span>user&nbsp;username&nbsp;password&nbsp;&nbsp;</span></li>
    <li class="alt"><span>bin&nbsp;&nbsp;</span></li>
    <li class=""><span>hash&nbsp;&nbsp;</span></li>
    <li class="alt"><span>cd&nbsp;some/path/here/datas/&nbsp;&nbsp;</span></li>
    <li class=""><span>#prompt&nbsp;&nbsp;</span></li>
    <li class="alt"><span>mget&nbsp;*<span class="vars">$1</span><span>*&nbsp;&nbsp;</span></span></li>
    <li class=""><span>quit&nbsp;&nbsp;</span></li>
    <li class="alt"><span>YSL&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
