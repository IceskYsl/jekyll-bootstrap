---
layout: post
title: 在RoR中取得最近记录的方法
date: '2008-5-5'
comments: true
categories: Ruby&Rails
link: true
---
<p>时常有类似于&ldquo;查看最近一天发布的文章&rdquo;，&ldquo;最近一个星期发布的文章&rdquo;等，与是找到一段代码，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;Topic&nbsp;&lt;&nbsp;ActiveRecord::Base&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.find_latest(time&nbsp;=&nbsp;</span><span class="keyword">nil</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;r&nbsp;=&nbsp;%w(&nbsp;hour&nbsp;day&nbsp;week&nbsp;month&nbsp;year&nbsp;)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;r.include?(time)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">self</span><span>.find&nbsp;</span><span class="symbol">:all</span><span>,&nbsp;</span><span class="symbol">:conditions</span><span>&nbsp;=&gt;&nbsp;[</span><span class="string">'created_at&nbsp;&gt;&nbsp;?'</span><span>,&nbsp;1.send(time).ago]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">self</span><span>.find&nbsp;</span><span class="symbol">:all</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>Topic.find_latest(<span class="string">'day'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>Topic.find_latest(<span class="string">'week'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Topic.find_latest(<span class="string">'year'</span><span>)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>比较简单，就不罗嗦了，要是你有更好的方法，请分享下～</p>
