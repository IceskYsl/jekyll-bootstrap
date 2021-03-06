---
layout: post
title: ruby中一个方法返回多个结果的实例
date: '2007-7-4'
comments: true
categories: Ruby&Rails
link: true
---
<p>大家知道，在一般的编程实现中，一个method只能返回一个结果，如果想实现返回多个结果，java中可以使用VO来实现，但是ruby借助其灵活的语法，我们可以一次返回多个结果，我记得前些时候还不晓得这么做，问了几个人貌似也没有提到，今天五一看到了这个实现，分享给大家：首先，按照这个需求，你可能会写出类似下面的这段代码来检验，如下:</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;a_method_to_insult_innocent_people&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;error&nbsp;=&nbsp;compute_error&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;error&nbsp;==&nbsp;</span><span class="symbol">:stupid</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;</span><span class="keyword">false</span><span>,&nbsp;</span><span class="string">&quot;You&nbsp;made&nbsp;a&nbsp;stupid&nbsp;error&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">elsif</span><span>&nbsp;error&nbsp;==&nbsp;</span><span class="symbol">:ridiculous</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;</span><span class="keyword">false</span><span>,&nbsp;</span><span class="string">&quot;You&nbsp;made&nbsp;a&nbsp;ridiculous&nbsp;error&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">elsif</span><span>&nbsp;error&nbsp;==&nbsp;</span><span class="symbol">:worst_of_all_time</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;</span><span class="keyword">false</span><span>,&nbsp;</span><span class="string">&quot;You&nbsp;made&nbsp;the&nbsp;most&nbsp;idiot&nbsp;error&nbsp;in&nbsp;history.&nbsp;Way&nbsp;to&nbsp;go&hellip;&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;</span><span class="keyword">return</span><span>&nbsp;</span><span class="keyword">true</span><span>,&nbsp;</span><span class="string">&quot;You&nbsp;made&nbsp;no&nbsp;error,&nbsp;you&nbsp;are&nbsp;still&nbsp;an&nbsp;idiot&quot;</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>success,&nbsp;msg&nbsp;=&nbsp;a_method_to_insult_innocent_people&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>do_something_with_success(success)&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>destroy_hateful_words!(msg)&nbsp; <br />
    </span></li>
</ol>
</div>
<p>但是这段代码还是只能返回一个结果，如何实现返回多个值呢，很简单，使用数组来实现，只要把上面这段代码中的- return false, &quot;you made a stupid error&quot;- 修改为  *return [false, &quot;you made a stupid error&quot;]*就可以了。记录记录以备不时之需。</p>
