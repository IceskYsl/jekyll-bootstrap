---
layout: post
title: 使用Rails开发支持WAP/WML的应用
date: '2008-7-1'
comments: true
categories: Ruby&Rails
tags: rails WAP
link: true
---
Rails在WEB开发中独树一帜，取得相当大的成功，但是其内核中尚未支持WML，于是查找了一些资料，如果你使用Rails开发的系统向添加WAP支持，这或许对你有用。

总的来看，有两个方式来实现对WML的支持，单独支持和整合支持，下面详细的说。

<strong>一、按照一般方式支持</strong>

这个方式和做PC WEB方式是一样的，有个单独的controller或者action，指定特有的layout和页面模板，而这些模板中采用WML语言编写，在请求到来的时候，按照URL中特有的特征字符（比如二级域名）或者Http Head中的标识转向Wap的action，进而显示。详细的步骤基本上是这样的：

<strong>1、在app/controllers/application.rb中增加对WAP格式输出的支持</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>before_filter </span><span class="symbol">:set_wap_content_type</span><span>, </span><span class="symbol">:only</span><span> =&gt; </span><span class="symbol">:wap</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="keyword">def</span><span> set_wap_content_type  </span></span></li>
	<li><span>  <span class="variable">@headers</span><span>[</span><span class="string">"Content-Type"</span><span>] = “text/vnd.wap.wml; charset=iso-8859-1″  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>2、添加一个WAP的全局布局模板app/views/layouts/wap.rhtm</strong>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span class="tag">&lt;?</span><span class="tag-name">xml</span><span> </span><span class="attribute">version</span><span>=”1.0″</span><span class="tag">?&gt;</span><span>  </span></span></li>
	<li><span>&lt;!DOCTYPE wml PUBLIC “-//WAPFORUM//DTD WML 1.1//EN” “http://www.wapforum.org/DTD/wml_1.1.xml”<span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">wml</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span><span class="tag">&lt;</span><span class="tag-name">card</span><span> </span><span class="attribute">title</span><span>=”</span><span class="tag">&lt;</span><span>%= @title %</span><span class="tag">&gt;</span><span>”</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">p</span><span> </span><span class="attribute">align</span><span>=”center”</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span><span class="tag">&lt;</span><span>%= @content_for_layout %</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">p</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span><span class="tag">&lt;/</span><span class="tag-name">card</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;/</span><span class="tag-name">wml</span><span class="tag">&gt;</span><span>  </span></span></li>
</ol>
</div>
<strong>3、在我的controller中（index）中增加一个action用来响应WAP请求。</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">def</span><span> wap  </span></span></li>
	<li><span>  <span class="variable">@title</span><span> = </span><span class="string">"San Francisco Sailing Weather"</span><span>  </span></span></li>
	<li class="alt"><span>  render(<span class="symbol">:layout</span><span> =&gt; </span><span class="string">"wml"</span><span>)  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>4、添加相应的view模板app/views/index/wap.rhtml</strong>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span class="tag">&lt;</span><span>%= link_to 'NOAA Marine Forecast', { </span><span class="attribute">:controller</span><span> =</span><span class="tag">&gt;</span><span> '/marine/forecast', </span><span class="attribute">:action</span><span> =</span><span class="tag">&gt;</span><span> 'wap' } %</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span class="tag-name">br</span><span class="tag">/&gt;</span><span>  </span></span></li>
	<li><span><span class="tag">&lt;</span><span>%= link_to 'Wind Readings', { </span><span class="attribute">:controller</span><span> =</span><span class="tag">&gt;</span><span> '/marine/wind', </span><span class="attribute">:action</span><span> =</span><span class="tag">&gt;</span><span> 'wap' } %</span><span class="tag">&gt;</span><span class="tag">&lt;</span><span class="tag-name">br</span><span class="tag">/&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;</span><span>%= link_to 'Current Predictions', { </span><span class="attribute">:controller</span><span> =</span><span class="tag">&gt;</span><span> '/marine/tide', </span><span class="attribute">:action</span><span> =</span><span class="tag">&gt;</span><span> 'wap' } %</span><span class="tag">&gt;</span><span>  </span></span></li>
</ol>
</div>
&nbsp;

<strong>二、使用Rails2支持的多模板类型支持</strong>

在Rails2以后，Rails支持多种格式的输出，比如Html，RSS，JS等，当然你还可以定制自己的格式，比如我们这里说的WML，Iphone等，使用起来更简单、自然。

<strong>1、添加MIME格式支持</strong>

在config/environment.rb中增加MIME的格式支持，方式如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>Mime::Type.register </span><span class="string">"text/vnd.wap.wml"</span><span>, </span><span class="symbol">:wml</span><span>  </span></span></li>
</ol>
</div>
<pre style="font-size: 90%;">
<strong>2、判断请求类型</strong>{% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># application.rb</span><span>  </span></span></li>
	<li><span>before_filter <span class="symbol">:adjust_format_for_beta</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>...  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="keyword">def</span><span> adjust_format_for_beta  </span></span></li>
	<li class="alt"><span>  request.format = <span class="symbol">:beta</span><span> </span><span class="keyword">if</span><span> beta_request?   </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="keyword">def</span><span> beta_request?  </span></span></li>
	<li class="alt"><span>  <span class="keyword">return</span><span> (request.subdomains.first == </span><span class="string">"beta"</span><span> || params[</span><span class="symbol">:format</span><span>] == </span><span class="string">"beta"</span><span>)  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<pre style="font-size: 90%;">
<strong>3、添加相应的view代码</strong>比较简单，就是写XML或者WML模板<strong>show.wml.erb</strong>{% endcodeblock %}
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>xml.instruct! :xml, </span><span class="attribute">:version</span><span> =</span><span class="tag">&gt;</span><span> "1.0"  </span></span></li>
	<li><span>xml.wml "xml:lang" =<span class="tag">&gt;</span><span> "en-gb" do  </span></span></li>
	<li class="alt"><span>  xml.card <span class="attribute">:title</span><span> =</span><span class="tag">&gt;</span><span> "My title here" do  </span></span></li>
	<li><span>    xml.p "Something interesting here"  </span></li>
	<li class="alt"><span>    xml.p "Something else interesting here."  </span></li>
	<li><span>  end  </span></li>
	<li class="alt"><span>end  </span></li>
</ol>
</div>
<pre style="font-size: 90%;">
<strong>4、添加输出类型支持</strong>{% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">def</span><span> index  </span></span></li>
	<li><span>  respond_to <span class="keyword">do</span><span> |format|  </span></span></li>
	<li class="alt"><span>    format.html  </span></li>
	<li><span>    format.wml  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<pre style="font-size: 90%;">
以上两中方式，我个人更加喜欢Rails2的多模板支持模式，更加自然和清晰。<strong>实用工具：</strong><a href="http://addons.mozilla.org/firefox/addon/62">wmlbrowser add-on for Firefox</a> ：可以在FF下直接查看WML网页<a href="http://cn.opera.com/">Opera</a>：支持WML格式显示{% endcodeblock %}
<strong>参考资文章：</strong>

1、<a href="http://gabrito.com/post/making-your-rails-app-mobile-with-wap-and-wml">Making your Rails app mobile with WAP and WML</a>
2、<a href="http://surfingincognito.com/index.php?hl=f5&amp;q=uggc%3A%2F%2Fqnirc-zhzoyvat.oybtfcbg.pbz%2F2008%2F05%2Fehol-ba-envyf-naq-fbzr-jnc.ugzy">Ruby on Rails (and some WAP)</a>
3、<a href="http://locomotivation.com/2008/06/28/redesign-your-site-in-place-using-rails-custom-mime-types">Redesign your site in place using Rails custom mime types</a>

<strong>参考资料：</strong>

<a href="http://www.w3schools.com/wap/">W3schools WAP tutorial</a>
<a href="http://www.w3schools.com/wap/wml_reference.asp">W3schools WML reference</a>
<a href="http://webcab.de/wcl.htm">Web based WAP Emulator</a>

&nbsp;
