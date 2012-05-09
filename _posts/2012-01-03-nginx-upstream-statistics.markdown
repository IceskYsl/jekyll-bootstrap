--- 
layout: post
comments: true
title: NGINX upstream statistics
date: 2012-1-3
link: false
categories: life
---
使用过nginx的应该都都晓得upstream，前面一篇文章说到《nginx upstream的5种配置方式》，例如如下是很常见的一段配置

#create by ice 2011.12.22
upstream unicon_v2_www {
# This is the socket we configured in unicorn.rb
server unix:/var/www/v2/tmp/sockets/unicorn.sock backup;
server 192.168.0.1:5000 weight=9 max_fails=2 fail_timeout=30s;
server 192.168.0.2:5000 weight=3 max_fails=2 fail_timeout=30s;
}
server {
listen 80;
server_name www.iceskysl.com;
error_log /opt/nginx/logs/error/error_v2_www.log;
access_log /opt/nginx/logs/access/access_v2_www.log main;

root /var/www/v2/public/;
index index.html index.htm;

location / {
proxy_redirect off;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header Host $host;
proxy_set_header Content-Length $content_length;
proxy_set_header X-Forwarded-For $remote_addr;
client_max_body_size 10m;
client_body_buffer_size 128k;
proxy_connect_timeout 90;
proxy_send_timeout 90;
proxy_read_timeout 90;
proxy_buffer_size 4k;
proxy_buffers 4 32k;
proxy_busy_buffers_size 64k;
proxy_temp_file_write_size 64k;
chunked_transfer_encoding off;
proxy_pass http://unicon_v2_www/;
}
}

其中upstream的这段配置：
upstream unicon_v2_www {
# This is the socket we configured in unicorn.rb
server unix:/var/www/v2/tmp/sockets/unicorn.sock backup;
server 192.168.0.1:5000 weight=9 max_fails=2 fail_timeout=30s;
server 192.168.0.2:5000 weight=3 max_fails=2 fail_timeout=30s;
}

我们了解到socket模式的这个是backup，其他两个机器分别weight=3和weight=9,于是我们想监控下upstream每个后端具体处理了多少请求，有没有问题等，这个好像就不好监控了，nginx自带的status模块只能监控总的请求数，无法区分每个upstream的具体情况。
找到一个ustats（http://code.google.com/p/ustats/），其介绍是：NGINX basic upstream statistics module，具体的如下：<!--more-->
<blockquote>USTATS module provides basic statistics for each backend in nginx upstreams:

Number of requests
Http 499/500/503 errors count
Tcp errors
Http read/write timeouts
Fail timeout
Max fails count
Last failed access time
Total fails count
Blacklisted backend highlighting
Down backends highlighting
The module allows you to sort values in some columns for each separate upstream. The data can be retrieved as JSON by appending "?json" to the end of location on which the module was set to work on (see configuration instructions below).</blockquote>
看上去正是我需要的，有时间试试看～（为啥nginx不学haproxy官方自带一个详细statistics的页面呢～haproxy那个statistics很详细很好用～）
详细使用指南：<a href="http://code.google.com/p/ustats/" target="_blank">http://code.google.com/p/ustats/</a>

<img src="http://ustats.googlecode.com/svn/wiki/shot1.png" alt="" />
