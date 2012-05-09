--- 
layout: post
comments: true
title: "Rails\xE9\x83\xA8\xE7\xBD\xB2:Nginx+Haproxy+Thin"
date: 2008-9-12
link: false
categories: life
---
Nginx和Thin以前都介绍过，这里主要介绍下Haproxy的安装以及配合使用。

<strong>1、下载</strong>
wget  http://haproxy.1wt.eu/download/1.3/src/haproxy-1.3.15.3.tar.gz

<strong>2、编译安装</strong>
sudo aptitude install libpcre++-dev
tar -zxvf haproxy-1.3.15.3.tar.gz
cd haproxy-1.3.15.3
sudo make TARGET=linux26 CPU=i386 USE_STATIC_PCRE=2
sudo make install
install -d /usr/local/sbin
install haproxy /usr/local/sbin
install -d /usr/local/man/man1
install -m 644 doc/haproxy.1 /usr/local/man/man1
install -d /usr/local/doc/haproxy
for x in configuration architecture haproxy-en haproxy-fr; do \
install -m 644 doc/$x.txt /usr/local/doc/haproxy ; \
done

<strong>3、配置文件</strong>
<em><strong>1)Haproxy配置(/opt/devroot/itechtag/haproxy.conf)</strong></em>
<div class="codeText">
<div class="codeHead"><em><strong>Haproxy配置</strong></em></div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>global  </span></span></li>
	<li><span>  daemon  </span></li>
	<li class="alt"><span>  maxconn       4096      # total max connections (dependent on ulimit)  </span></li>
	<li><span>  nbproc        2         # number of processing cores  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>defaults  </span></li>
	<li class="alt"><span>  mode              http  </span></li>
	<li><span>  clitimeout        60000       # maximum inactivity time on the client side  </span></li>
	<li class="alt"><span>  srvtimeout        30000       # maximum inactivity time on the server side  </span></li>
	<li><span>  timeout connect   4000        # maximum time to wait for a connection attempt to a server to succeed  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>  option            httpclose     # disable keepalive (HAProxy does not yet support the HTTP keep-alive mode)  </span></li>
	<li class="alt"><span>  option            abortonclose  # enable early dropping of aborted requests from pending queue  </span></li>
	<li><span>  option            httpchk       # enable HTTP protocol to check on servers health  </span></li>
	<li class="alt"><span>  option            forwardfor    # enable insert of X-Forwarded-For headers  </span></li>
	<li><span>   </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>  balance roundrobin            # each server is used in turns, according to assigned weight  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>  stats enable                  # enable web-stats at /haproxy?stats  </span></li>
	<li class="alt"><span>  stats auth        admin:pass  # force HTTP Auth to view stats  </span></li>
	<li><span>  stats refresh     5s        # refresh rate of stats page  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>listen rails_proxy 127.0.0.1:8100  </span></li>
	<li class="alt"><span>  # - equal weights on all servers  </span></li>
	<li><span>  # - maxconn will queue requests at HAProxy if limit is reached  </span></li>
	<li class="alt"><span>  # - minconn dynamically scales the connection concurrency (bound my maxconn) depending on size of HAProxy queue  </span></li>
	<li><span>  # - check health every 20000 microseconds  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>  server web1 127.0.0.1:8000 weight 1 minconn 3 maxconn 6 check inter 20000  </span></li>
	<li class="alt"><span>   </span></li>
	<li><span>listen slow_proxy 127.0.0.1:8200  </span></li>
	<li class="alt"><span>  # cluster for slow requests, lower the queues, check less frequently  </span></li>
	<li><span>  server web1 127.0.0.1:8000 weight 3 minconn 30 maxconn 300 check inter 20000  </span></li>
	<li class="alt"><span>  server slow1 127.0.0.1:8001 weight 1 minconn 10 maxconn 300 check inter 40000  </span></li>
	<li><span>  server slow2 127.0.0.1:8002 weight 1 minconn 1 maxconn 300 check inter 40000  </span></li>
	<li class="alt"><span>  server slow3 127.0.0.1:8003 weight 1 minconn 1 maxconn 300 check inter 40000  </span></li>
</ol>
</div>
2)Nginx配置
<div class="codeText">
<div class="codeHead">Nginx配置</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span># File generated on 25 May 08  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>#upstream name has to be unique so add on the port number  </span></li>
	<li><span>#generate multiple mongrels  </span></li>
	<li class="alt"><span>upstream thin_9000{  </span></li>
	<li><span>    server 127.0.0.1:8200;  </span></li>
	<li class="alt"><span>    }  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>server {  </span></li>
	<li><span>            listen   80;  </span></li>
	<li class="alt"><span>            server_name localhost;  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>            access_log /opt/devroot/itechtag/log/access.log;  </span></li>
	<li><span>            error_log  /opt/devroot/itechtag/log/error.log;  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>            root   /opt/devroot/itechtag/public/;  </span></li>
	<li class="alt"><span>            index  index.html;  </span></li>
	<li><span>             </span></li>
	<li class="alt"><span>            location / {  </span></li>
	<li><span>                   proxy_set_header  X-Real-IP  $remote_addr;  </span></li>
	<li class="alt"><span>                   proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;  </span></li>
	<li><span>                   proxy_set_header Host $http_host;  </span></li>
	<li class="alt"><span>                   proxy_redirect false;  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>                   if (-f $request_filename/index.html) {  </span></li>
	<li><span>                                           rewrite (.*) $1/index.html break;  </span></li>
	<li class="alt"><span>                          }  </span></li>
	<li><span>                          if (-f $request_filename.html) {  </span></li>
	<li class="alt"><span>                                           rewrite (.*) $1.html break;  </span></li>
	<li><span>                          }  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>                          if (!-f $request_filename) {  </span></li>
	<li class="alt"><span>                                           proxy_pass http://thin_9000;  </span></li>
	<li><span>                                           break;  </span></li>
	<li class="alt"><span>                          }  </span></li>
	<li><span>            }  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>}  </span></li>
</ol>
</div>
3）thin配置
<div class="codeText">
<div class="codeHead">thin配置</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>---  </span></span></li>
	<li><span>pid: tmp/pids/thin.pid  </span></li>
	<li class="alt"><span>log: log/thin.log  </span></li>
	<li><span>port: 8000  </span></li>
	<li class="alt"><span>max_conns: 1024  </span></li>
	<li><span>timeout: 30  </span></li>
	<li class="alt"><span>chdir: /opt/devroot/itechtag  </span></li>
	<li><span>max_persistent_conns: 512  </span></li>
	<li class="alt"><span>environment: production  </span></li>
	<li><span>address: 0.0.0.0  </span></li>
	<li class="alt"><span>servers: 4  </span></li>
	<li><span>daemonize: true  </span></li>
</ol>
</div>
<strong>4、启动</strong>
sudo haproxy -f /opt/devroot/itechtag/haproxy.conf -p pidfils.oid

<strong>5、停止</strong>
kill  $(cat /home/source/haproxy-1.3.15.3/examples/pidfils.oid)

<strong>6、刷新</strong>
sudo haproxy -f /opt/devroot/itechtag/haproxy.conf -sf $(cat /opt/devroot/itechtag/pidfils.oid)

<strong>7、监控</strong>
http://127.0.0.1:8200/haproxy?stats
<img src="http://docs.google.com/File?id=dhf86kr9_417fvv5w2ck_b" alt="" width="540" height="270" />
<strong>8、测试</strong>
ab -n 2000 -c 200 http://127.0.0.1/

<strong>附录：Haproxy帮助信息</strong>
iceskysl@IceskYsl:/home/source/haproxy-1.3.15.3$ haproxy
HA-Proxy version 1.3.15.3 2008/09/02
Copyright 2000-2008 Willy Tarreau &lt;w@1wt.eu&gt;

Usage : haproxy -f &lt;cfgfile&gt; [ -vdVD ] [ -n &lt;maxconn&gt; ] [ -N &lt;maxpconn&gt; ]
[ -p &lt;pidfile&gt; ] [ -m &lt;max megs&gt; ]
-v displays version ; -vv shows known build options.
-d enters debug mode ; -db only disables background mode.
-V enters verbose mode (disables quiet mode)
-D goes daemon ; implies -q
-q quiet mode : don't display messages
-c check mode : only check config file and exit
-n sets the maximum total # of connections (2000)
-m limits the usable amount of memory (in MB)
-N sets the default, per-proxy maximum # of connections (2000)
-p writes pids of all children to this file
-de disables epoll() usage even when available
-ds disables speculative epoll() usage even when available
-dp disables poll() usage even when available
-sf/-st [pid ]* finishes/terminates old pids. Must be last arguments.

<strong>参考资料:</strong>
http://codesnippets.joyent.com/tag/ubuntu
