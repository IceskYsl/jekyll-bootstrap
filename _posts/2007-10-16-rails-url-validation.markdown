--- 
layout: post
comments: true
title: Rails URL Validation
date: "2007-10-16"
link: false
categories: life
---
<p>从上看到的，随手记录如下，可能需要用到。</p>
<div class="codeText">
<div class="codeHead">Rails URL Validation</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>validates_each&nbsp;</span><span class="symbol">:href</span><span>,&nbsp;</span><span class="symbol">:on</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:create</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|record,&nbsp;attr,&nbsp;value|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">begin</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;uri&nbsp;=&nbsp;URI.parse(value)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;uri.</span><span class="keyword">class</span><span>&nbsp;!=&nbsp;URI::HTTP&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;record.errors.add(attr,&nbsp;<span class="string">'Only&nbsp;HTTP&nbsp;protocol&nbsp;addresses&nbsp;can&nbsp;be&nbsp;used'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">rescue</span><span>&nbsp;URI::InvalidURIError&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;record.errors.add(attr,&nbsp;<span class="string">'The&nbsp;format&nbsp;of&nbsp;the&nbsp;url&nbsp;is&nbsp;not&nbsp;valid.'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>以前我判断的时候都是按照是不是http://开头等做的判断，感觉好傻，这样的判断才更加专业和准确。</p>
