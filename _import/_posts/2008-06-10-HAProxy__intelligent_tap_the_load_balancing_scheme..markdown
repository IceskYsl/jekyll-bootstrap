---
layout: post
title: HAProxy,智能分流的负载均衡方案。
date: '2008-6-10'
comments: true
categories: Ruby&Rails
link: true
---
<p>以前说过，我最喜欢的一个跑Rails的方式是Nginx在前面，后端采用mongrel或者thin，采用nginx的原因不在多说，想详细了解 nginx的参考我以前的文章，按照道理来说，这样的方案已经很不错了，如果再加上memcached做cach，应该可以顶住不小的压力了。<br />
但是其当时也说到，Nginx的负载均衡到目前为止还是比较简单的轮训算法，他不会检测后端的mongrel是否压力过大，或者是否已经down下去了，这样就会初选，如果其中的一个mongrel挂掉了，nginx还是会把请求分过去的，这样就存在一个问题。<br />
<br />
于是就有这么一个需求，能不能监控到后端的mongrel的状况，做智能分发呢？啊哈，是的，可以，<a href="http://haproxy.1wt.eu/download/1.2/doc/architecture.txt">HAProxy</a>就可以做到这点。先看个改进版的架构。<br />
<img alt="" src="http://www.igvita.com/posts/05-08/haproxy-diagram.png" /><br />
ok，比较清晰吧，Nginx接收到请求后，放到RequestQueue中，然后HAProxy从queue中取请求，智能的分发给后端的 App.Server。如此处理的好处就是HAProxy可以判断后端App.Server的负载情况以及是否down机情况，然后做智能分发。</p>
<p>OK,比较清晰了，我们再把Memcached加上，再加上智能判断一台服务器Down掉的情况，我再画个图片，如下：</p>
<p><img src="http://lh3.ggpht.com/iceskysl/SE-chiVdktI/AAAAAAAACIY/QAcLzs3Nzbc/s400/haproxy_nginx_mongrel.jpg" alt="" /></p>
<p>参考文章：<br />
1、<a href="http://chinaonrails.com/topic/view/1619/1.html">HAproxy做负载均衡</a><br />
2、<a href="http://www.opensourcery.co.za/2008/05/15/nginx-reading-the-fine-print/">nginx - Reading the fine print </a><br />
3、<a href="http://brainspl.at/articles/2007/01/03/new-nginx-conf-with-optimizations">New Nginx.conf with optimizations</a><br />
4、<a href="http://www.igvita.com/2008/05/13/load-balancing-qos-with-haproxy/">Load Balancing &amp; QoS with HAProxy</a><br />
5、<a href="http://blog.hungrymachine.com/2008/3/27/analyzing-application-performance-with-haproxy-stats">Reviewing Application Health with HAProxy Stats</a></p>
