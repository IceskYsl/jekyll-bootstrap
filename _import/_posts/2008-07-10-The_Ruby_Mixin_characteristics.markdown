---
layout: post
title: Ruby中的Mixin特性
date: '2008-7-10'
comments: true
categories: Ruby&Rails
link: true
---
在<span class="hilite1">Ruby</span>中，我们可以把一个模块混入（<span class="hilite2">Mixin</span>）到对象中，从而达到类似多重继承的效果。看几个例子：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">module</span><span> Mixin1  </span></span></li>
	<li><span>  <span class="keyword">def</span><span> fun1  </span></span></li>
	<li class="alt"><span>    puts <span class="string">"I am fun1 from Mixin1"</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  <span class="keyword">def</span><span> fun2  </span></span></li>
	<li class="alt"><span>    puts <span class="string">"I am fun2 from Mixin1. I’ll call a member function of the class which includes me"</span><span>  </span></span></li>
	<li><span>    mem_fun  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> fun3  </span></span></li>
	<li><span>    puts <span class="string">"I am fun3 from Mixin1. I’ll puts out a member variable of the class which includes me"</span><span>  </span></span></li>
	<li class="alt"><span>    puts <span class="variable">@mem_var</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="keyword">class</span><span> A  </span></span></li>
	<li><span>  include Mixin1  </span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> mem_fun  </span></span></li>
	<li><span>    puts <span class="string">"I am a member fun of class A"</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> initialize  </span></span></li>
	<li><span>    <span class="variable">@mem_var</span><span> =</span><span class="string">"I am a member varaible of class A"</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
调用一下试试看：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>a = A.</span><span class="keyword">new</span><span>  </span></span></li>
	<li><span>a.fun1  </span></li>
	<li class="alt"><span>a.fun2  </span></li>
	<li><span>a.fun3  </span></li>
</ol>
</div>
结果如下：
I am fun1 from Mixin1
I am fun2 from Mixin1. I’ll call a member function of the class which includes me
I am a member fun of class A
I am fun3 from Mixin1. I’ll puts out a member variable of the class which includes me
I am a member varaible of class A

很明显了，不赘述。

<strong>参考文档：</strong>
http://thinkinginruby.javaeye.com/blog/148967
http://my.donews.com/idlecat/2006/10/21/UDDxaYBkNCABNXNVgmIMuMwuKJMHiRXduBBu/
http://www.juixe.com/techknow/index.php/2006/06/15/mixins-in-ruby/
