--- 
layout: post
comments: true
title: Proc.new vs Lambda in Ruby
date: 2008-1-9
link: false
categories: life
---
<p>一直都不是很能把ruby的Proc运用自由，今天看一个gem的时候，又发现另外一个比较让我迷惑的东西Lambda ，好读书不求甚解，先找到一篇相关的文章，如下：</p>
<p>http://samdanielson.com/2007/3/19/proc-new-vs-lambda-in-ruby</p>
<p>原作者是这么说的：</p>
<blockquote>
<p>I found the following lines of code on Wikipedia today. It&rsquo;s a very succinct description of one important difference between a lambda and a Proc. Try printing the return value of f.call for more insight.</p>
</blockquote>
<p>摘录部分内容如下：</p>
{% codeblock %}<code class="ruby"><br /><span class="keywords">def</span> foo<br />  f = <span class="constants">Proc</span><span class="method">.new</span> <span class="brackets">{</span> return <span class="string">&quot;return from foo from inside proc&quot;</span> <span class="brackets">}</span><br />  f<span class="method">.call</span> <span class="comment"># control leaves foo here</span><br />  return <span class="string">&quot;return from foo&quot;</span> <br /><span class="keywords">end</span><br /><br /><span class="keywords">def</span> bar<br />  f = lambda <span class="brackets">{</span> return <span class="string">&quot;return from lambda&quot;</span> <span class="brackets">}</span><br />  f<span class="method">.call</span> <span class="comment"># control does not leave bar here</span><br />  return <span class="string">&quot;return from bar&quot;</span> <br /><span class="keywords">end</span><br /><br />puts foo <span class="comment"># prints &quot;return from foo from inside proc&quot; </span><br />puts bar <span class="comment"># prints &quot;return from bar&quot; </span><br /><br />在wiki上也有，地址如下：http://en.wikipedia.org/wiki/Closure_(computer_science){% endcodeblock %}{% endcodeblock %}
