---
layout: post
title: 调优：大量的CLOSE_WAIT状态连接
date: '2008-3-24'
comments: true
categories: Ruby&Rails
link: true
---
<p>这几天，项目上遇到一个很奇怪的问题，由于项目比较庞大，使用了3台独立的主机做服务器，前端用了硬件的radware采用轮询算法做了三台服务器的负载均衡，每台服务上部署了一台weblogic和一个前置apache做proxy，并且启用了apache的支持weblogic的集群功能，二次向三台weblogic做负载均衡（虽然这里我觉得没啥必要，但是原先他们就这么做了，我就不改了）。</p>
<p>apache使用的是prefork模块，开了<strong>800</strong>个最大连接，配置了超时机制；后端的weblogic除了线程池和队列，文件句柄等做了修改外，其他的貌似没怎么修改。</p>
<p>出现的问题的现象是，apache的线程全部用完（802个），weblogic相对比较空闲，内存消耗一般，CPU（4颗的）的idea也在50%左右；前端表现是页面打开速度相当慢，基本不可用。</p>
<p>问题的分析过程是，先看到apache的error的log里面很多&ldquo;文件找不到&rdquo;错误，由于编辑做的页面上引了一些并不存在的资源，导致的，怀疑此类错误太多，会影响性能，于是找出错误页面，让编辑修复其中巍峨文件引用。但是效果不是很明显，虽然error少了很多。</p>
<p>继续分析，使用netstat -an看到很多端口被占用，且很多处于CLOSE_WAIT状态，找个脚本统计下，如下：</p>
<p><font>[wwwpps@IceskYsl]$ netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S)  print a, S[a]}'<br />
LAST_ACK 1<br />
SYN_RECV 15<br />
<font color="#ff0000"><strong>CLOSE_WAIT 7729</strong></font><br />
ESTABLISHED  471<br />
FIN_WAIT1 3<br />
FIN_WAIT2 52<br />
SYN_SENT 1<br />
TIME_WAIT 725</font></p>
<p><font>可以看到，确实很多，感觉这里是有问题，google得到一些资料，说到这个问题会导致：&ldquo;</font><font><font color="#000000">大量的CLOSE_WAIT连接，直接占满TCP队列，导致Apache失去响应。&rdquo;</font></font></p>
<p><font><font color="#000000">解决这个问题的方法是修改系统的参数，系统默认超时时间的是7200秒，也就是2小时，这个太大了，对于我们这样的负荷来说，于是修改如下几个参数：</font></font></p>
<p>sysctl -w net.ipv4.tcp_keepalive_time=30<br />
sysctl -w net.ipv4.tcp_keepalive_probes=2<br />
sysctl -w net.ipv4.tcp_keepalive_intvl=2</p>
<p>然后，执行sysctl命令使修改生效，基本上就算完成了。目前正在观察中，看看下午高峰时候效果如何，就可以基本上得出结论了。</p>
<p>参考文章：</p>
<p>1、解释apache的几种模式的差别：http://www.servertechnology.cn/archives/314.html</p>
<p>2、解释&ldquo;CLOSE_WAIT生成的原因及其系统参数的意义&rdquo;：http://haka.sharera.com/blog/BlogTopic/32309.htm</p>
<p>3、解释如何修复：http://luobuwa.cn/tag.php?tag=apache&amp;mode=1</p>
<p><font><br />
</font></p>
