---
layout: post
title: Ruby正则表达式小技巧
date: '2008-4-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>关于Ruby的正则表达式的基本的东西大家都很熟悉了,偶然会遇到一些没见过的小技巧,本篇用来收集和记录这些小技巧,如果你有其他小技巧,欢迎分享.</p>
<p>pre_match和<span class="hilite2">post_match这两个方法以前没使用过</span>，他们分别是用来获取当前匹配结果的前一个和后一个匹配结果,看个例子既可以明白了.<span><span>&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;#这个是分析URI的&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.split_uri(&nbsp;uri_str&nbsp;)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;m&nbsp;=&nbsp;%r&lt;http://([^/]+)&gt;.match(uri_str)&nbsp;<span class="keyword">or</span><span>&nbsp;</span><span class="keyword">raise</span><span>&nbsp;ArgumentError,&nbsp;</span><span class="string">&quot;cannot&nbsp;parse&nbsp;URI:&nbsp;#{uri_str}&quot;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;host&nbsp;=&nbsp;m[1].strip&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path&nbsp;=&nbsp;m.post_match&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path&nbsp;=&nbsp;<span class="string">'/'</span><span>&nbsp;</span><span class="keyword">if</span><span>&nbsp;path.empty?&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;puts&nbsp;host,&nbsp;path&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#&nbsp;end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>url&nbsp;=&nbsp;http://www.1sters.com:80/this_is_a_string/and_this_is_too&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>puts(split_uri(url))&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="comment">#Outout:</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#www.1sters.com:80,this_is_a_string/and_this_is_too&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</span></span>如上这段代码很好的说明了<span><span><span>post_match的作用</span></span></span>.</p>
