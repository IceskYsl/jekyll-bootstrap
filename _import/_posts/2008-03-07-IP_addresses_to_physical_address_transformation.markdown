---
layout: post
title: IP地址到物理地址的转化
date: '2008-3-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>以前我也写过一个类似的，找不到了，刚才看到<a class="t" href="http://chinaonrails.com/u/axgle">axgle</a>写了一个，挺轻巧的。</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>1.&nbsp;require&nbsp;</span><span class="string">'net/http'</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>2.&nbsp;require&nbsp;<span class="string">&quot;uri&quot;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>4.&nbsp;<span class="keyword">def</span><span>&nbsp;ip2addr(ip=</span><span class="string">&quot;google.com&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>5.&nbsp;url=URI.parse(<span class="string">&quot;http://ip138.com/ips8.asp&quot;</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>6.&nbsp;res=Net::HTTP.post_form(url,<span class="symbol">:ip</span><span>=&gt;ip,</span><span class="symbol">:action</span><span>=&gt;2)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>7.&nbsp;res.body.scan(/&lt;ul&nbsp;<span class="keyword">class</span><span>=</span><span class="string">&quot;ul1&quot;</span><span>&gt;(.*)&lt;\/ul&gt;/).to_s.scan(/&lt;li&gt;(.*?)&lt;\/li&gt;/)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>8.&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>0.&nbsp;puts&nbsp;ip2addr&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
</ol>
</div>
<p>结果 <img border="0" align="absmiddle" style="padding: 0px 2px;" src="http://chinaonrails.com/img/icons/silk/emoticon_smile.png" alt="" /><br />
<br />
本站主数据：美国<br />
查询结果2：美国<br />
查询结果3：美国 加利福尼亚州Mountain<br />
<br />
http://chinaonrails.com/topic/view/216.html</p>
<p>&nbsp;</p>
