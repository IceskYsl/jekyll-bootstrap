---
layout: post
title: 进程 消息： 开始Erlang之旅
date: '2009-1-9'
comments: true
categories: Mac&*UNIX
link: true
---
<p>知道Erlang很久了，在我接触Ruby不久之后就了解了Erlang，但是一直没静下心好好看，恰巧利用这段时间开始我的Erlang之旅吧。</p>
<p>说句题外话，Erlang这个名字我很有亲切感，要是熟悉我的人肯定不会奇怪，呵呵。</p>
<p><strong>Erlang概述</strong><br />
<br />
Erlang不但是一种编程语言，而且它具有比编程语言更加贴近操作系统的一些特性：并发线程、作业调度、内存管理、分布式、网络化等。据说使用Erlang编写的Yaws Web服务器，其并发性能是apache的15倍！（这个没啥好炫耀的吧～）<br />
<br />
这个Erlang初始开源版本包含了Erlang的实现，同时它也是用于构建分布式高可用性系统的Ericsson中间件的最大组成部分。<br />
<br />
<strong>Erlang具有以下特性：</strong><br />
<br />
<strong>并发性 </strong>- Erlang具有超强的轻量级进程，这种进程对内存的需求是动态变化的，并且它没有共享内存和通过异步消息传送的通讯。Erlang支持超大量级的并发线程，并且不需要操作系统具有并发机制。<br />
<br />
<strong>分布式 </strong>- Erlang被设计用于运行在分布式环境下。一个Erlang虚拟机被成为Erlang节点。一个分布式Erlang系统是多个Erlang节点组成的网络（通常每个处理器被作为一个节点）。一个Erlang节点能够创建运行在其它节点上的并行线程，而其它节点可以使用其它操作系统。线程依赖不同节点之间的通讯，这完全和它依赖于单一节点一样。<br />
<br />
<strong>健壮性 </strong>- Erlang具有多种基本的错误检测能力，它们能够用于构建容错系统。例如，进程能够监控其它进程的状态和活动，甚至这些进程是在其它节点上执行。在分布式系统中的线程能够配置为在其它节点故障的情况下自动进行故障恢复，并在故障节点恢复时自动迁移回到恢复节点。<br />
<br />
<strong>软实时性 </strong>- Erlang支持可编程的&ldquo;软&rdquo;实时系统，这种系统需要反应时间在毫秒级。而在这种系统中，长时间的垃圾收集（garbage collection）延迟是无法接受的，因此Erlang使用了递增式垃圾收集技术。<br />
<br />
<strong>热代码升级 </strong>- 一些系统不能够由于软件维护而停止运行。Erlang允许程序代码在运行系统中被修改。旧代码能被逐步淘汰而后被新代码替换。在此过渡期间，新旧代码是共存的。这也使得安装bug补丁、在运行系统上升级而不干扰系统操作成为了可能。<br />
<br />
<strong>递增式代码装载 </strong>- 用户能够控制代码如何被装载的细节。在嵌入式系统中，所有代码通常是在启动时就被完全装载。而在开发系统中，代码是按需装载的，甚至在系统运行时被装载的。如果测试到了未覆盖的bug，那么只有具有bug的代码需要被替换。<br />
<br />
<strong>外部接口 </strong>- Erlang进程与外部世界之间的通讯使用和在Erlang进程之间相同的消息传送机制。这种机制被用于和操作系统通讯、与其它语言编写的程序交互。如果出于高效率的需要，这种机制的一个特殊版本也允许例如C程序这样的代码直接链接到Erlang运行时系统中来。</p>
<p>入门参考文档：</p>
<ul>
    <li><a href="http://erlang.org/about.html">http://erlang.org/about.html</a></li>
    <li><a href="http://www.matrix.org.cn/resource/article/2007-09-04/2948b459-5ac5-11dc-af81-f34262335978.html">http://www.matrix.org.cn/resource/article/2007-09-04/2948b459-5ac5-11dc-af81-f34262335978.html</a></li>
    <li><a href="http://erlang-china.org/misc/simplified_erlang.html">http://erlang-china.org/misc/simplified_erlang.html</a></li>
    <li><a href="http://www.douban.com/subject/3260311/">http://www.douban.com/subject/3260311/</a></li>
</ul>
