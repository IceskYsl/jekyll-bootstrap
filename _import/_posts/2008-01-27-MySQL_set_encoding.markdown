---
layout: post
title: MySQL设置编码
date: '2008-1-27'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong><span class="postbody">1、在my.ini文件的</span><span class="postbody">中设置所有数据库编码</span></strong><span class="postbody"><br />
default-character-set=utf8<br />
<br />
<strong> 2、</strong></span><span class="postbody"><strong>单独设置某个数据库： <br />
</strong> alter database testdb character set utf8; <br />
</span></p>
<p><span class="postbody">
<div class="codeText">
<div class="codeHead">Shell代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>mysql&gt;&nbsp;alter&nbsp;database&nbsp;impsp&nbsp;character&nbsp;set&nbsp;utf8;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Query&nbsp;OK,&nbsp;1&nbsp;row&nbsp;affected&nbsp;(0.00&nbsp;sec)&nbsp; <br />
    </span></li>
</ol>
</div>
</span></p>
<p><span class="postbody"> </span><span class="postbody"><strong>3、查看<span class="hilite1">mysql</span>支持的编码： </strong><br />
show character set; </span></p>
