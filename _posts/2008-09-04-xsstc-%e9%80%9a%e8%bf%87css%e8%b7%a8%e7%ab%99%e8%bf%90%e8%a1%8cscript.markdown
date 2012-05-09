--- 
layout: post
comments: true
title: !binary |
  WHNzdGM6IOmAmui/h0NTU+i3qOermei/kOihjHNjcmlwdA==

date: 2008-9-4
link: false
categories: life
---
Xsstc: <em>Cross-site scripting through CSS data</em>，看名字就看出来了，通过CSS跨站运行script，使用方法:
<ul>
	<li>导入<a onclick="javascript:pageTracker._trackPageview('/outgoing/www.tralfamadore.com/xsstcx.js');" href="http://www.tralfamadore.com/xsstcx.js" target="_blank">xsstcx.js</a>(未压缩版<a onclick="javascript:pageTracker._trackPageview('/outgoing/www.tralfamadore.com/xsstc.js');" href="http://www.tralfamadore.com/xsstc.js" target="_blank">xsstc.js</a>)</li>
	<li>添加一个id=”Xsstc”的空DIV。</li>
	<li>在JS中调用Xsstc.exec(functionURL, callback)，使用的内容作为callback的参数传入callback中</li>
</ul>
其中CSS的定义也有要求，下面是Hello World中CSS的定义
<div class="codeText">
<div class="codeHead">CSS代码</div>
<div class="codeHead">
{% codeblock %}{% codeblock %}&lt;pre lang="css"&gt; {% endcodeblock %}
Xsstc {
 background-image: url('about:blank#Hello%20World');
}{% endcodeblock %}
{% codeblock %}{% codeblock %}&lt;/pre&gt;{% endcodeblock %}{% endcodeblock %}
</div>
</div>
<div class="codeText">
<div class="codeHead">JavaScript代码</div>
<ol class="dp-c" start="1">
	<li class="alt"><span><span>Xsstc.exec(</span><span class="string">'http://lbs.tralfamadore.com/test.css'</span><span>, showResponse)  </span></span></li>
</ol>
</div>
<strong>参考文档：</strong>

原文说明: http://ajaxian.com/archives/xsstc-cross-site-scripting-through-css-data
测试页面:http://www.tralfamadore.com/test-xsstc.html
