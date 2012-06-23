---
layout: post
title: find_out_the_current_url___uri_in__.rhtml_file
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
// find out the current url / uri in *.rhtml file// is quite simple with the request object&lt;% page = request.request_uri %&gt;page: &lt;%= page %&gt;// but then different urls mean the same page// (../admin = ../admin/ = ../admin/index = ..admin/index/)// and maybe the id is unwanted too (../admin/show/8)// so below is an alternative with control on which parameter is used&lt;% page = &quot;/&quot; + request.path_parameters['controller'] + &quot;/&quot; + request.path_parameters['action'] %&gt;page: &lt;%= page %&gt;
