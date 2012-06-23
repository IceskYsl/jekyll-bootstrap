---
layout: post
title: Url_encode_URLDecode_in_ruby
date: '2009-2-17'
comments: true
categories: 技术归总
tags: encode Ruby&amp;Rails URLDecode
link: true
---
<p>在一些API接口传递参数的时候，需要对URL做一些编码，有人写了两个脚本，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;URLDecode(str)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;str.gsub!(/%[a-fA-F0-9]{2}/)&nbsp;{&nbsp;|x|&nbsp;x&nbsp;=&nbsp;x[1..2].hex.chr&nbsp;}&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;URLEncode(str)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;str.gsub!(/[^\w$&amp;\-+.,\/:;=?@]/)&nbsp;{&nbsp;|x|&nbsp;x&nbsp;=&nbsp;format(<span class="string">&quot;%%%x&quot;</span><span>,&nbsp;x[0])&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
其实不需要这么麻烦，在Ruby中提供了现成的函数，比如CGI::escape, CGI::inescape, CGI::escapeHTML, CGI::inescapeHTML，CGI::unescape()等，详细的可以看：<a href="http://www.ruby-doc.org/core/classes/CGI.html">http://www.ruby-doc.org/core/classes/CGI.html</a></p>
<p>看下他的写法：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;File&nbsp;lib/cgi-lib.rb,&nbsp;line&nbsp;134</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;CGI:</span><span class="symbol">:escape</span><span>(str)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str.gsub(/[^a-zA-Z0-9_\-.]/n){&nbsp;sprintf(<span class="string">&quot;%%%02X&quot;</span><span>,&nbsp;$&amp;.unpack(</span><span class="string">&quot;C&quot;</span><span>)[0])&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#&nbsp;File&nbsp;lib/cgi-lib.rb,&nbsp;line&nbsp;139</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;CGI:</span><span class="symbol">:unescape</span><span>(str)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str.gsub(/\+/,&nbsp;<span class="string">'&nbsp;'</span><span>).gsub(/%([0-9a-fA-F]{2})/){&nbsp;[</span><span class="variable">$1</span><span>.hex].pack(</span><span class="string">&quot;c&quot;</span><span>)&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>&nbsp;</p>
