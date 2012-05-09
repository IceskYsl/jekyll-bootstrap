--- 
layout: post
comments: true
title: !binary |
  5L2/55SoTmdpbnjnmoRYLUFjY2VsLVJlZGlyZWN05ZyoUmFpbHPkuK3lj5Hp
  gIHmlofku7Y=

date: 2010-4-18
link: false
categories: life
---
很多时候，我们会遇到需要一些业务逻辑（例如鉴权）后才将文件发送给客户端，那么如果将附件保存在public目录下将是非常不合适的，为了安全起见，你最好是将其保存在客户端无法直接访问的到的目录下，在处理完业务逻辑后，在将文件发送给客户端，Rails中提供了 send_XXXX来发送文件；

但是使用Rails的app server(thin,mongrel,passenger etc.)来发送文件（特别是大文件）一直都不是一个靠谱的方案，rails提供的send_file和send_data在理论上是可以工作的，但是其会阻塞进程，消耗内存，等等系列的弊端，而诸如apache,<a title="http://www.lighttpd.net" rel="nofollow" href="http://www.lighttpd.net">Lighttpd</a>,Nginx等web server在处理静态文件上有着得天独厚的优势。

于是聪明的人们就想，可以使用app server处理业务逻辑，然后再让web server来接管处理剩下的文件发送，所以就有了<a title="http://celebnamer.celebworld.ws/stuff/mod_xsendfile/" rel="nofollow" href="http://celebnamer.celebworld.ws/stuff/mod_xsendfile/">mod_xsendfile for Apache2</a>和<a title="http://www.lighttpd.net" rel="nofollow" href="http://www.lighttpd.net">Lighttp</a>中提供的X-Sendfile功能，Nginx自然也有类似的功能，只是其名字不叫X-Sendfile，而是叫<strong>X-Accel-Redirect</strong>（这个名字好像更容易理解）。  这里主要说Nginx，Apache的自行查阅资料，先了解下原理：
<ol>
	<li>The header must contain a <strong>URI</strong></li>
	<li>The location <strong>should</strong> be defined as <strong>internal;</strong> to prevent the client going directly to the URI</li>
</ol>
定义一段配置：
{% codeblock %}<a href="/NginxHttpCoreModule#location">location</a> /protected/ {
  <a href="/NginxHttpCoreModule#internal">internal</a>;
  <a href="/NginxHttpCoreModule#root">root</a>   /some/path;
}{% endcodeblock %}
{% codeblock %}然后在你的应用中：{% endcodeblock %}
{% codeblock %}
{% codeblock %}add_header("X-Accel-Redirect: /protected/iso.img");{% endcodeblock %}
{% codeblock %}然后Nginx就接管了你的请求，发送<strong>/some/path/protected/iso.img</strong>这个文件。{% endcodeblock %}
{% codeblock %}原理了解了，看看如何使用更快捷，自然是用插件，有人写出了一个插件：<a href="http://github.com/goncalossilva/X-Accel-Redirect">X-Accel-Redirect</a>{% endcodeblock %}
{% codeblock %}
<pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">
<div id="_mcePaste">= X-Accel-Redirect</div>
This Rails plugin allows users to take advantage of nginx's X-Accel-Redirect header, similar to X-Send-File.{% endcodeblock %}
<pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">== Install
You should install it as a plugin, running this command on your projects root directory:
     $ script/plugin install git://github.com/goncalossilva/X-Accel-Redirect.git{% endcodeblock %}
<pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">== Usage
X-Accel-Redirect has an equivalent method to Rails &lt;i&gt;send_file&lt;/i&gt;, called &lt;b&gt;x_accel_redirect&lt;/b&gt;. Using is as easy as:
     x_accel_redirect "/path/to/file", :filename =&gt; "filename"
All &lt;i&gt;send_file&lt;/i&gt; options are available using this method. Now you can even let your old &lt;b&gt;:x_sendfile&lt;/b&gt; option since the plugin will discard it.{% endcodeblock %}
<div></div>{% endcodeblock %}
<div id="_mcePaste"><strong>参考：</strong></div>{% endcodeblock %}
{% codeblock %}
{% codeblock %}<a href="http://wiki.nginx.org/NginxXSendfile">wiki.nginx.org/NginxXSendfile</a>{% endcodeblock %}
{% codeblock %}<span style="font-family: Georgia, Times, 'Times New Roman', serif; line-height: 21px; white-space: normal; color: #21211e; font-size: 13px;">
<h1 class="entry-title" style="outline-width: 0px; outline-style: initial; outline-color: initial; font-size: 14px; vertical-align: baseline; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: transparent; font-weight: bold; clear: both; text-transform: uppercase; letter-spacing: 2px; background-position: initial initial; background-repeat: initial initial; padding: 0px; margin: 0px; border: 0px initial initial;"><a href="http://www.motionstandingstill.com/using-nginx-to-send-files-with-x-accel-redirect/2008-09-03/">USING NGINX TO SEND FILES WITH X-ACCEL-REDIRECT</a></h1>
</span>{% endcodeblock %}
<a href="http://spongetech.wordpress.com/2007/11/13/the-complete-nginx-solution-to-sending-flowers-and-files-with-rails/">The complete nginx solution to sending flowers and files with rails</a><span style="font-family: Georgia, 'Times New Roman', 'Bitstream Charter', Times, serif; font-size: small;"><span style="line-height: 19px; white-space: normal;"> </span></span>{% endcodeblock %}
{% codeblock %}<a href="http://bianbian.org/technology/linux/154.html">[译]利用Nginx的X-Accel-Redirect头实现下载控制（附带php和rails实例）</a>{% endcodeblock %}
