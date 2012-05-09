--- 
layout: post
comments: true
title: publish a rails plugin:Nginx-X-Accel-Redirect
date: 2010-4-18
link: false
categories: life
---
前面2个文章说到了在Rails中使用send_file实现断点续传《<a href="iceskysl.1sters.com/?p=696">在rails下实现多线程下载和断点续传</a>》和利用Nginx的X-Accel-Redirect实现发送大文件《<a href="http://iceskysl.1sters.com/?p=708">使用Nginx的X-Accel-Redirect在Rails中发送文件</a>》，项目中需要两个功能，就把他整合起来，同时发布到github上了，<a href="http://github.com/IceskYsl/Nginx-X-Accel-Redirect">Nginx-X-Accel-Redirect</a>。

<strong>简介：</strong>
This Rails plugin allows users to take advantage of nginx’s X-Accel-Redirect header, similar to X-Send-File and Content-Range.

<strong>安装：</strong>
$ script/plugin install git://github.com/IceskYsl/Nginx-X-Accel-Redirect.git

<strong>使用：</strong>
x_accel_redirect "/path/to/file", :filename =&gt; "filename",:root=&gt;"/path/to/root"

详细信息：<a href="http://github.com/IceskYsl/Nginx-X-Accel-Redirect">github.com/IceskYsl/Nginx-X-Accel-Redirect</a>
