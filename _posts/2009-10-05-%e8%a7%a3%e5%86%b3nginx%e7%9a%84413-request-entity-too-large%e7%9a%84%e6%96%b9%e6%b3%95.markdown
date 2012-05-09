--- 
layout: post
comments: true
title: !binary |
  6Kej5YazTmdpbnjnmoQ0MTMgUmVxdWVzdCBFbnRpdHkgVG9vIExhcmdl55qE
  5pa55rOV

date: 2009-10-5
link: false
categories: life
---
项目中使用nginx，上传一个大文件，出来错误提示，413 Request Entity Too Large！
查了下资料，解决方法：打开nginx主配置文件nginx.conf，找到http{}段，添加


<blockquote>client_max_body_size 20m; </blockquote>

最好也调整下：
<blockquote> keepalive_timeout  105;</blockquote>
免得链接超时被关！


该文件一般在/etc/nginx/nginx.conf
