---
layout: post
title: Java获取IP地址:request.getRemoteAddr()警惕
date: '2008-7-16'
comments: true
categories: 技术归总 Android&Java
tags: getRemoteAddr ip
link: true
---
项目中需要和第三方平台接口，加了来源IP鉴权功能，测试时发现没有问题，但是部署以后发现存在问题，一直鉴权不通过，一群人抓瞎。

我找到那块的代码，跟了一遍流程发现逻辑没有啥问题，但是最终的结果却还是鉴权不通过，实在有些诡异。其基本逻辑为先取得配置的IP列表，然后通过<strong>request.getRemoteAddr()</strong>取得客户端的IP地址，做鉴权和校验，逻辑没问题，那么肯定是request.getRemoteAddr()出了问题，google下，发现有人遇到类似的问题。

最终定位为request.getRemoteAddr()这种方法在大部分情况下都是有效的。但是在通过了Apache,Squid等反向代理软件就不能获取到客户端的真实IP地址了。

如果使用了反向代理软件，将<span style="text-decoration: underline;"><a href="http://192.168.1.110:2046/">http://192.168.1.110:2046/</a></span> 的URL反向代理为<span style="text-decoration: underline;">http://www.xxx.com/</span> 的URL时，用<strong>request.getRemoteAddr()</strong>方法获取的IP地址是：127.0.0.1　或　<span style="text-decoration: underline;"><span style="color: #0000ff;">192.168.1.110</span></span>，而并不是客户端的真实ＩＰ。

经过代理以后，由于在客户端和服务之间增加了中间层，因此服务器无法直接拿到客户端的IP，服务器端应用也无法直接通过转发请求的地址返回给客户端。但是在转发请求的HTTP头信息中，增加了<span style="text-decoration: underline;"><strong>X－FORWARDED－FOR</strong></span>信息用以跟踪原有的客户端IP地址和原来客户端请求的服务器地址。
原来如此，我们的项目中正好是有前置apache，将一些请求转发给后端的weblogic，看来就是这样导致的咯。

给出一份还算靠谱的代码，如下：
<div class="codeText">
<div class="codeHead">Java代码</div>
<ol class="dp-j">
	<li class="alt"><span><span class="keyword">public</span><span> String getIpAddr(HttpServletRequest request) { </span></span></li>
	<li><span> String ip = request.getHeader(<span class="string">"x-forwarded-for"</span><span>); </span></span></li>
	<li class="alt"><span> <span class="keyword">if</span><span>(ip == </span><span class="keyword">null</span><span> || ip.length() == </span><span class="number">0</span><span> || </span><span class="string">"unknown"</span><span>.equalsIgnoreCase(ip)) { </span></span></li>
	<li><span> ip = request.getHeader(<span class="string">"Proxy-Client-IP"</span><span>); </span></span></li>
	<li class="alt"><span> } </span></li>
	<li><span> <span class="keyword">if</span><span>(ip == </span><span class="keyword">null</span><span> || ip.length() == </span><span class="number">0</span><span> || </span><span class="string">"unknown"</span><span>.equalsIgnoreCase(ip)) { </span></span></li>
	<li class="alt"><span> ip = request.getHeader(<span class="string">"WL-Proxy-Client-IP"</span><span>); </span></span></li>
	<li><span> } </span></li>
	<li class="alt"><span> <span class="keyword">if</span><span>(ip == </span><span class="keyword">null</span><span> || ip.length() == </span><span class="number">0</span><span> || </span><span class="string">"unknown"</span><span>.equalsIgnoreCase(ip)) { </span></span></li>
	<li><span> ip = request.getRemoteAddr(); </span></li>
	<li class="alt"><span> } </span></li>
	<li><span> <span class="keyword">return</span><span> ip; </span></span></li>
	<li class="alt"><span>} </span></li>
</ol>
</div>
如果有人遇到类似问题，请多加留意，呵呵。

PS：可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串Ｉｐ值，究竟哪个才是真正的用户端的真实IP呢？
答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130, 192.168.1.100,用户真实IP为： 192.168.1.110

<strong>参考文章：</strong>http://blog.sina.com.cn/s/blog_407a68fc01000ai7.html
