---
layout: post
title: 保持SSH客户端不掉线
date: '2008-2-21'
comments: true
categories: Ruby&Rails
link: true
---
<p>不管我是使用linux的的SSH还是windows下的putty、SecureCRT还是AbsoluteTelnet，当我连接到服务器端 后，离开一会或者做点其他的事情，再回到SSH的时候，常常发现客户端自动掉出来了；有的时候甚至跑一个需要时间比较长的JOB的时候，还没跑完就掉出来 了，导致JOB跑了一半，等等。。</p>
<p>所以一直在找解决这个问题的办法，今天在googleReader上找到了一个<a href="http://fosswire.com/2008/02/19/keep-your-ssh-connection-open/">解决办法</a>，如下：</p>
<div class="post-entry">
<p dragover="true">Do you get annoyed when you have a SSH session open, visit your browser for a while, and then return only to find you were disconnected? Most home NAT routers are the cause of this. If your router doesn&rsquo;t offer an option to not shut off idle connections, you are probably better off by setting a keep-alive setting.</p>
<p>To do this, just open <strong>/etc/ssh/ssh_config</strong> on your home (client) computer. Add the following line:</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">配置代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>ServerAliveInterval&nbsp;180&nbsp;&nbsp;</span></span></li>
</ol>
</div>
There you have it! Just remember now, if you leave SSH open accidentally, anyone else can get on it. Remember to close your session when finished.PS：If you&rsquo;re using AbsoluteTelnet (for Windows), you can do this from the Options-&gt;Properties-&gt;Connection page. There is an option there to enable keepalives and you can specify the duration between them.</div>
