--- 
layout: post
comments: true
title: find out the current url / uri in *.rhtml file
date: 2007-5-20
link: false
categories: life
---
// find out the current url / uri in *.rhtml file// is quite simple with the request object&lt;% page = request.request_uri %&gt;page: &lt;%= page %&gt;// but then different urls mean the same page// (../admin = ../admin/ = ../admin/index = ..admin/index/)// and maybe the id is unwanted too (../admin/show/8)// so below is an alternative with control on which parameter is used&lt;% page = &quot;/&quot; + request.path_parameters['controller'] + &quot;/&quot; + request.path_parameters['action'] %&gt;page: &lt;%= page %&gt;
