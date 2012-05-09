--- 
layout: post
comments: true
title: !binary |
  5ZyocmFpbHPkuK3kvb/nlKhQT1Az5o6l5pS26YKu5Lu2

date: 2007-7-4
link: false
categories: life
---
<p>上次我们写了如何在rails中发送email，自然接收email也是常常需要的功能，今天给出一段代码实现在rails中接受并处理email，代码如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#!/usr/bin/env&nbsp;ruby</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>require&nbsp;<span class="string">'net/pop'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>require&nbsp;<span class="builtin">File</span><span>.dirname(__FILE__)&nbsp;+&nbsp;</span><span class="string">'/../config/environment'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger&nbsp;=&nbsp;RAILS_DEFAULT_LOGGER&nbsp;&nbsp;</span></li>
    <li class="alt"><span>logger.info&nbsp;<span class="string">&quot;Running&nbsp;Mail&nbsp;Importer...&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Net::POP3.start(<span class="string">&quot;localhost&quot;</span><span>,&nbsp;</span><span class="keyword">nil</span><span>,&nbsp;</span><span class="string">&quot;username&quot;</span><span>,&nbsp;</span><span class="string">&quot;password&quot;</span><span>)&nbsp;</span><span class="keyword">do</span><span>&nbsp;|pop|&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">if</span><span>&nbsp;pop.mails.empty?&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;logger.info&nbsp;<span class="string">&quot;NO&nbsp;MAIL&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">else</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;pop.mails.<span class="keyword">each</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|email|&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;<span class="keyword">begin</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;logger.info&nbsp;<span class="string">&quot;receiving&nbsp;mail...&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;Notifier.receive(email.pop)&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;email.delete&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;<span class="keyword">rescue</span><span>&nbsp;</span><span class="builtin">Exception</span><span>&nbsp;=&gt;&nbsp;e&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;logger.error&nbsp;<span class="string">&quot;Error&nbsp;receiving&nbsp;email&nbsp;at&nbsp;&quot;</span><span>&nbsp;+&nbsp;</span><span class="builtin">Time</span><span>.now.to_s&nbsp;+&nbsp;</span><span class="string">&quot;:::&nbsp;&quot;</span><span>&nbsp;+&nbsp;e.message&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>logger.info&nbsp;<span class="string">&quot;Finished&nbsp;Mail&nbsp;Importer.&quot;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p><br />
<strong>做些说明：</strong><br />
你需要在*<strong>Net::POP3.start</strong>*这行写上你要接收的邮箱的服务器地址以及你的用户名密码，如上配置好了，你就可以在cron中配置调度这个任务了，至于调度的频度你可以按照自己的需求来设定了。如何，还算简单吧。</p>
