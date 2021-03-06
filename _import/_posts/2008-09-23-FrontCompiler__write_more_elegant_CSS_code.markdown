---
layout: post
title: ! 'FrontCompiler: 写出更优雅的CSS代码'
date: '2008-9-23'
comments: true
categories: Html/css/js Ruby&Rails
link: true
---
对于Rails开发者来说，总觉得一大堆的CSS代码非常碍眼，写起来也不是很优雅，有没有更优雅的方法，毫无疑问，是有的。

先看一段正常的CSS代码：
<div class="codeText">
<div class="codeHead">CSS代码</div>
<ol class="dp-css" start="1">
	<li class="alt"><span><span>div.article div.title {  </span></span></li>
	<li><span>  <span class="keyword">font-weight</span><span>: </span><span class="string">bold</span><span>;  </span></span></li>
	<li class="alt"><span>}  </span></li>
	<li><span>div.article div.title a.author {  </span></li>
	<li class="alt"><span>  <span class="keyword">padding-left</span><span>: </span><span class="string">12px</span><span>;  </span></span></li>
	<li><span>  <span class="keyword">background</span><span>: </span><span class="string">url</span><span>(</span><span class="string">'user.png'</span><span>) </span><span class="string">no-repeat</span><span> </span><span class="string">left</span><span>;  </span></span></li>
	<li class="alt"><span>}  </span></li>
	<li><span>div.article div.text {  </span></li>
	<li class="alt"><span>  <span class="keyword">border</span><span>: </span><span class="string">1px</span><span> </span><span class="string">solid</span><span> </span><span class="colors">#EEE</span><span>;  </span></span></li>
	<li><span>  <span class="keyword">background</span><span>: </span><span class="colors">#FEF</span><span>;  </span></span></li>
	<li class="alt"><span>}  </span></li>
</ol>
</div>
再看一段有那么点不一样的代码：
<div class="codeText">
<div class="codeHead">CSS代码</div>
<ol class="dp-css" start="1">
	<li class="alt"><span><span>div.article {  </span></span></li>
	<li><span>  div.title {  </span></li>
	<li class="alt"><span>    <span class="keyword">font-weight</span><span>: </span><span class="string">bold</span><span>;  </span></span></li>
	<li><span>      </span></li>
	<li class="alt"><span>    a.author {  </span></li>
	<li><span>      <span class="keyword">padding-left</span><span>: </span><span class="string">12px</span><span>;  </span></span></li>
	<li class="alt"><span>      <span class="keyword">background</span><span>: </span><span class="string">url</span><span>(</span><span class="string">'user.png'</span><span>) </span><span class="string">no-repeat</span><span> </span><span class="string">left</span><span>;  </span></span></li>
	<li><span>    }  </span></li>
	<li class="alt"><span>  }  </span></li>
	<li><span>  div.text {  </span></li>
	<li class="alt"><span>    <span class="keyword">border</span><span>: </span><span class="string">1px</span><span> </span><span class="string">solid</span><span> </span><span class="colors">#EEE</span><span>;  </span></span></li>
	<li><span>    <span class="keyword">background</span><span>: </span><span class="colors">#FEF</span><span>;  </span></span></li>
	<li class="alt"><span>  }  </span></li>
	<li><span>}  </span></li>
</ol>
</div>
有啥不一样了么？是否有点发懵呢，呵呵，下面这个写法更清晰和优雅，不是么！但是这样写的话，我们的浏览器是不认识的，怎么办，可以采用第三方的类库来转换即可。现在看到的可以做这个事情的有<a href="http://github.com/MadRabbit/frontcompiler/tree/master">FrontCompiler</a>和<a href="http://blog.airbladesoftware.com/2006/12/11/cssdryer-dry-up-your-css">css_dryer</a>，除了这个功能外，还有其他的功能，例如FrontCompiler还可以合并多个JS/CSS文件，代码如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="variable">@c</span><span> = FrontCompiler.</span><span class="keyword">new</span><span>  </span></span></li>
	<li><span><span class="variable">@library_code</span><span> = </span><span class="variable">@c</span><span>.compact_files(%w{  </span></span></li>
	<li class="alt"><span>  src/lib.js  </span></li>
	<li><span>  src/lib/something.js  </span></li>
	<li class="alt"><span>  src/lib/another.js  </span></li>
	<li><span>})  </span></li>
</ol>
</div>
其他的功能请参考其各自的主页。

http://st-on-it.blogspot.com/2008/09/nested-styles-with-ruby-and.html

http://github.com/MadRabbit/frontcompiler/tree/master

http://blog.airbladesoftware.com/2006/12/11/cssdryer-dry-up-your-css
