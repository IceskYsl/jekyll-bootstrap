---
layout: post
title: 开发Rails插件的方法和步骤
date: '2008-9-1'
comments: true
categories: Ruby&Rails
link: true
---
Rails丰富的插件真是强大，幻想着把各个功能都做出插件，以后开发系统就像搭积木一样堆积就好啦，呵呵。
开发个Rails插件其实不难，或者说很简单，流程基本如下：
<strong>1、生成骨架</strong>
在Rails的script下有个generate，可以直接生成骨架，执行：
# ruby script/generate plugin foo
就会在$RAILS_ROOT/vendor/plugins下生成一个foo目录，如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>/1stlog</span><span class="variable">$ruby</span><span> script/generate plugin foo  </span></span></li>
	<li><span>      create  vendor/plugins/foo/lib  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/tasks  </span></li>
	<li><span>      create  vendor/plugins/foo/test  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/README  </span></li>
	<li><span>      create  vendor/plugins/foo/MIT-LICENSE  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/Rakefile  </span></li>
	<li><span>      create  vendor/plugins/foo/init.rb  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/install.rb  </span></li>
	<li><span>      create  vendor/plugins/foo/uninstall.rb  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/lib/foo.rb  </span></li>
	<li><span>      create  vendor/plugins/foo/tasks/foo_tasks.rake  </span></li>
	<li class="alt"><span>      create  vendor/plugins/foo/test/foo_test.rb  </span></li>
</ol>
</div>
<strong>2、编写相关代码</strong>
在lib/foo.rb 下编写你的插件代码即可。
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">module</span><span> Foo  </span></span></li>
	<li><span>  <span class="keyword">def</span><span> say_hello name  </span></span></li>
	<li class="alt"><span>    <span class="string">"hello #{name}"</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>3、混入到core中去</strong>
在init.rb中编写混入代码即可。
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'foo'</span><span>    </span></span></li>
	<li><span>ActionController::Base.send <span class="symbol">:include</span><span>, Foo
</span></span></li>
</ol>
</div>
<strong>参考文档：</strong>
http://blog.ericsk.org/archives/769
http://blog.railschina.com/637/viewspace-236
http://kyoleelqh.javaeye.com/blog/215090
