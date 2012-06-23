---
layout: post
title: Mongrel之cluster::restart vs. stop/start的区别
date: '2008-4-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>最近终于用上了我一直比较推荐的Rails部署方式（<strong>Nginx+Mongrel</strong>集群）,感觉相当的不错，关于这方面的技巧和配置，以后有时间再说，今天主要说说Mongrel集群的时候，其<strong>start./stop</strong>和<strong>restart</strong>有啥区别。
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>mongrel_rails&nbsp;cluster::start&nbsp;#启动&nbsp;&nbsp;</span></span></li>
    <li class=""><span>mongrel_rails&nbsp;cluster::restart&nbsp;#重启&nbsp;&nbsp;</span></li>
    <li class="alt"><span>mongrel_rails&nbsp;cluster::stop&nbsp;#停止&nbsp;&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>如上三条命令为启动，停止和重启的命令，找我们的理解，重启应该是和stop/start一样的效果，其实不然，主要区别就是：</p>
<p><strong>1、</strong>stop/start模式就是先stop掉，再启动，他会等到线程结束后stop，启动时会再次读取配置文件。</p>
<p><strong>2、</strong>restart模式和这个类似，但是其不会重新加载配置文件，也就是说你如果修改了配置文件，restart是不起作用的。</p>
<p>以上是我的理解，有不对的地方，还望指出，谢谢～</p>
<p><strong>参考文章：</strong></p>
<p>1.http://rubyforge.org/pipermail/mongrel-users/2006-June/000438.html</p>
<p>2.http://linux.ccidnet.com/art/302/20080327/1403439_1.html</p>
