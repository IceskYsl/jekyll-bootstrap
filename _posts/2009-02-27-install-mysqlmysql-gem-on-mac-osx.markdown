--- 
layout: post
comments: true
title: Install mysql(&mysql gem) on Mac OSX
date: 2009-2-27
link: false
categories: life
---
<p><span style="border-collapse: collapse; color: rgb(0, 0, 0); font-family: arial; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span">
<div>here is some tips:<br />
<br />
1、Install MYSQL：sudo port install mysql5</div>
<div>2、init some tables：sudo mysql_install_db5</div>
<div>3、install mysql gem：ARCHFLAGS=&quot;-arch i386&quot; gem install mysql -- --with-mysql-dir=/usr/local/<wbr></wbr>mysql</div>
</span></p>
<p>Here is some userfull resource links:<br />
<a href="http://www.macruby.org/trac/wiki/Troubleshooting">http://www.macruby.org/trac/wiki/Troubleshooting</a><br />
<a href="http://www.caibaohua.com/blog/2008/12/02/51/">http://www.caibaohua.com/blog/2008/12/02/51/</a><br />
<a href="http://haoxiai.net/shujuku/mysql/102114.html">http://haoxiai.net/shujuku/mysql/102114.html</a></p>
