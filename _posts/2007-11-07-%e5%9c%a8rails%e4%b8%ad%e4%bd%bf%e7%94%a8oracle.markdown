--- 
layout: post
comments: true
title: !binary |
  5ZyocmFpbHPkuK3kvb/nlKhvcmFjbGU=

date: 2007-11-7
link: false
categories: life
---
<p><strong>1.安装驱动</strong><br />
http://rubyforge.org/projects/ruby-oci8/<br />
下载并运行（双击）ruby-oci8-mswin里面的*.rb<br />
<strong><br />
2.更改database.yml</strong><br />
<br />
development:<br />
&nbsp; adapter: oci<br />
&nbsp; host: examplesid<br />
&nbsp; username: exampleuser<br />
&nbsp; password: examplepass<br />
<br />
or<br />
<br />
development:<br />
&nbsp; adapter: oci<br />
&nbsp; host: 192.168.0.50/examplesid<br />
&nbsp; username: exampleuser<br />
&nbsp; password: examplepass<br />
<br />
没有用到database字段；exampleuser可以用tns来代替；<br />
<br />
我的oracle装在另外一台机器上，所以配置如下<br />
development:<br />
&nbsp; adapter: oci<br />
&nbsp; host: MyTnsName<br />
&nbsp; username: system<br />
&nbsp; password: manager</p>
<p>参考地址：http://www.oracle.com/technology/global/cn/pub/articles/haefel-oracle-ruby.html</p>
