--- 
layout: post
comments: true
title: !binary |
  W0dlbXxwbHVnaW5dQ29uZmlnYXRyb24mU2ltcGxlQ29uZmlnOiDlnKhSYWls
  c+S4rea3u+WKoOmcgOimgeeahOmFjee9rg==

date: 2008-8-31
link: false
categories: life
---
搞Java的人应该很习惯把一些配置（数据库连接、个性化配置等）写到配置文件中，一般会使用XML或者TXT文件中，在启动的时候读取配置，初始化等等。
Rails中也可以实现类似的功能，虽然Rails提倡“<strong>零配置</strong>”，但有的时候开发一个系统，比如Blog系统等还是需要一些个性化的配置，我们原来的实现方式是：增加一个配置文件，启动的时候读取，并保存为全局变量，用的时候直接使用。也很方便。
其实还可以使用插件或者gem来做，<a href="http://www.rubyinside.com/configatron-ruby-app-configuration-library-1130.html">Configatron</a>就是这么一个gem，另外还有一个插件版的<a href="http://github.com/lukeredpath/simpleconfig/tree/master">SimpleConfig</a>，两者还是有些不同的，按照<a href="http://www.rubyinside.com/configatron-ruby-app-configuration-library-1130.html">Configatron</a> 作者的说法，其不同点在于：
<blockquote>SimpleConfig looks nice, but it definitely has a few differences from Configatron. The first big difference is that SimpleConfig is limited to use with Rails. Configatron can be used with any framework, any application, and any script. Configatron also seems a bit easier to use. There are no mixins needed to use it. The configatron method lives in Kernel, which means it’s available everywhere, no ‘configuration’ needed. <img class="wp-smiley" src="http://www.mackframework.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" /> Different strokes, eh? There are a few other configuration systems out there, I always encourage people to check out the options before they decide on a piece of software to use.</blockquote>
其实我们自己也可以写，只是没有必要再搞一套，功能上来说，上述这两个足够了，下面简单的看看<a href="http://www.rubyinside.com/configatron-ruby-app-configuration-library-1130.html">Configatron</a> 的用法：
<strong>1、安装</strong>
$ sudo gem install configatron
<strong>2、定义（支持namespace）</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>configatron </span><span class="keyword">do</span><span> |config|  </span></span></li>
	<li><span>  config.website_url = <span class="string">"http://www.1sters.com"</span><span>  </span></span></li>
	<li class="alt"><span>  config.namespace(<span class="symbol">:mems</span><span>) </span><span class="keyword">do</span><span> |mem|  </span></span></li>
	<li><span>    email.namespace(<span class="symbol">:iceskysl</span><span>) </span><span class="keyword">do</span><span> |iceskysl|  </span></span></li>
	<li class="alt"><span>      iceskysl.email = <span class="string">"iceskysl@1sters.com"</span><span>  </span></span></li>
	<li><span>      pop.blog_url = <span class="string">"http://iceskysl.1sters.com"</span><span>  </span></span></li>
	<li class="alt"><span>      <span class="comment"># etc ...</span><span>  </span></span></li>
	<li><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    email.namespace(<span class="symbol">:shine</span><span>) </span><span class="keyword">do</span><span> |shine|  </span></span></li>
	<li><span>      smtp.email = <span class="string">"shine@1sters.com"</span><span>  </span></span></li>
	<li class="alt"><span>      smtp.blog_url = <span class="string">"http://shine.1sters.com"</span><span>  </span></span></li>
	<li><span>      <span class="comment"># etc ...</span><span>  </span></span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="comment"># etc...</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>3、使用</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>configatron.mems.iceskysl.email </span><span class="comment"># =&gt; "iceskysl@1sters.com"</span><span>  </span></span></li>
	<li><span>configatron.mems.shine.blog_url <span class="comment"># =&gt; "http://shine.1sters.com"</span><span>  </span></span></li>
	<li class="alt"><span>configatron.website_url <span class="comment"># =&gt; "http://www.1sters.com"</span><span>  </span></span></li>
</ol>
</div>
<strong>4、重写</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>configatron </span><span class="keyword">do</span><span> |config|  </span></span></li>
	<li><span>  config.website_url = <span class="string">"http://www.1sters.com/index"</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>PS：</strong>
如果你是在自己的Rails里使用，可能<strong><a href="http://github.com/lukeredpath/simpleconfig/tree">simpleconfig</a></strong>会更加适合你，请参考其链接上的Readme。<strong></strong>

参考文档：
http://www.mackframework.com/2008/08/29/configatron-100-released/
http://www.rubyinside.com/configatron-ruby-app-configuration-library-1130.html
http://github.com/lukeredpath/simpleconfig/tree/master
