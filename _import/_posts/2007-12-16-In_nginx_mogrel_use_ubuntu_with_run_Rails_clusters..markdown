---
layout: post
title: 在ubuntu下配置使用nginx+mogrel跑Rails集群.
date: '2007-12-16'
comments: true
categories: Ruby&Rails
link: true
---
<p>很早前就曾经关注过nginx（一个俄罗斯人开发的HTTP服务器），看过一些中文和英文文档，觉得相当棒的一个服务器，但是一直没亲自试试其威力如何，这个周末写了不少代码，自己也都很满意，于是周日晚上准备休息下，顺便亲自试试nginx。</p>
<p>按照我对rails服务构架部署的理解，在我本本上是ubuntu系统，由于一直订阅了mogrel的邮件列表，所以对其相当看好和喜欢，于是这次就把这两个接合起来。</p>
<p>大概的架构是nginx在前面充当HTTP代理，同时处理一些静态的资源文件（比如图片，JS，CSS等），WEB请求直接到nginx后，将ruby的内容转到后端的mogrel处理;而mogrel采取集群的方式，可以自己设定需要启动的进程数（虽然以前说mogrel是非多线程的，但是从我现在跑的技能云的效果来看，一个实例都可以支撑相当的请求了），这样就形成一个前端nginx，后端mogrel的部署构架。</p>
<p>其他不在多说，网上资源相当丰富，从我试验的效果看，虽然没有刻意调优的等操作，但是其配置等都相当简介明了，用起来也相当放心。</p>
<p>如果以后有了自己的服务器，我肯定选择这个方式跑Rails应用。</p>
<p>如下是我在这个过程中google到的参考资料，各有侧重，请需要的朋友自己筛选需要的信息：</p>
<p>1、http://blackanger.blog.51cto.com/140924/40089</p>
<p>2、nginx官方：http://nginx.net/</p>
<p>3、英文wiki：http://wiki.codemongers.com/NginxGettingStarted</p>
<p>4、javaeye上有一篇：http://yangzx.javaeye.com/blog/105869</p>
<p>5、有部分中文wiki：http://wiki.codemongers.com/NginxChsWhyUseIt</p>
<p>如果您对nginx、rails、mogrel等有自己的见解，欢迎分享。</p>
