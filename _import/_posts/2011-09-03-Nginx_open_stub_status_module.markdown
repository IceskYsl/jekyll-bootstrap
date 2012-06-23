---
layout: post
title: Nginx开启 stub_status 模块
date: '2011-9-3'
comments: true
categories: Mac&*UNIX
link: true
---
Nginx中的<strong>stub_status</strong>模块主要用于查看<strong>Nginx</strong>的一些状态信息.
本模块默认是不会编译进Nginx的,如果你要使用该模块,则要在编译安装Nginx时指定:
./configure –with-http_stub_status_module

<strong>一、查看已安装的 Nginx 是否包含 stub_status 模块</strong>
#/usr/local/nginx/sbin/nginx -V

<em> [root@ice ~]# /opt/nginx/sbin/nginx -V
nginx version: nginx/0.8.53
built by gcc 4.1.2 20080704 (Red Hat 4.1.2-48)
TLS SNI support disabled
configure arguments: --prefix=/opt/nginx --with-http_ssl_module --with-pcre=/tmp/root-passenger-1719/pcre-8.10 --add-module=/usr/local/ruby/lib/ruby/gems/1.8/gems/passenger-3.0.2/ext/nginx</em>

如果包含 <strong>stub_status</strong> 模块，那么就可以进行下面的步骤了：

<strong>二、修改 Nginx 配置文件</strong>
{% codeblock %}location /nginx_status {
  # copied from http://iceskysl.1sters.com
  stub_status on;
  access_log   off;
  allow SOME.IP.ADD.RESS;
  deny all;
}{% endcodeblock %}
{% codeblock %}<strong>三、重启 Nginx</strong>
#/usr/local/nginx/sbin/nginx -s reload

<strong>四、相关数据说明</strong>
<strong>Active connections</strong>: 对后端发起的活动连接数.
<strong>Server accepts handled requests</strong>: Nginx总共处理了38810620个连接,成功创建38810620次握手(证明中间没有失败的),总共处理了298655730个请求.
<strong>Reading</strong>: Nginx 读取到客户端的Header信息数.
<strong>Writing</strong>: Nginx 返回给客户端的Header信息数.
<strong>Waiting</strong>: 开启keep-alive的情况下,这个值等于 active – (reading + writing),意思就是Nginx已经处理完成,正在等候下一次请求指令的驻留连接.
所以,在访问效率高,请求很快被处理完毕的情况下,Waiting数比较多是正常的.如果reading +writing数较多,则说明并发访问量非常大,正在处理过程中.{% endcodeblock %}
