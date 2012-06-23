---
layout: post
title: Generate_a_random_string
date: '2009-2-22'
comments: true
categories: 技术归总
tags: random ruby
link: true
---
Generates a random string of lowercase letters. Great for email verification codes  or user password salt....
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb">
	<li class="alt"><span><span class="builtin">Array</span><span>.</span><span class="keyword">new</span><span>(6) { (rand(122-97) + 97).chr }.join
</span></span></li>
</ol>
</div>
or:
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb">
	<li class="alt"><span><span class="keyword">def</span><span> newpass( len ) </span></span></li>
	<li><span> chars = (<span class="string">"a"</span><span>..</span><span class="string">"z"</span><span>).to_a + (</span><span class="string">"A"</span><span>..</span><span class="string">"Z"</span><span>).to_a + (</span><span class="string">"0"</span><span>..</span><span class="string">"9"</span><span>).to_a </span></span></li>
	<li class="alt"><span> newpass = <span class="string">""</span><span> </span></span></li>
	<li><span> 1.upto(len) { |i| newpass &lt;&lt; chars[rand(chars.size-1)] } </span></li>
	<li class="alt"><span> <span class="keyword">return</span><span> newpass </span></span></li>
	<li><span><span class="keyword">end</span><span> </span></span></li>
</ol>
</div>
