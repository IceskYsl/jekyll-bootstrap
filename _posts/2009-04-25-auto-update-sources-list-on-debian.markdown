--- 
layout: post
comments: true
title: Auto update sources.list  on Debian
date: 2009-4-25
link: false
categories: life
---
<p>you can use apt-spy to update sources.list ,here is some step and tips.<br />
1.open&nbsp; /etc/apt/sources.list and add this<br />
deb http://http.us.debian.org/debian/ stable main<br />
2.do &quot;apt-get update&quot;<br />
3.then &quot;apt-get install apt-spy&quot;<br />
4.then &quot;apt-spy update&quot;<br />
5.last,&quot;apt-spy -d unstable -a asia -t 5&quot;<br />
<strong><br />
ref:</strong><br />
http://http.us.debian.org/debian/README.mirrors.txt</p>
