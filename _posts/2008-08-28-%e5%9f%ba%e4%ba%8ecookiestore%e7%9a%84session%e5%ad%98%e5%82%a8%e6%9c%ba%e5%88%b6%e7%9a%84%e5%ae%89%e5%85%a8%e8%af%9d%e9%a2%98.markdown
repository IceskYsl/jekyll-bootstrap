--- 
layout: post
comments: true
title: !binary |
  5Z+65LqOQ29va2llU3RvcmXnmoRzZXNzaW9u5a2Y5YKo5py65Yi255qE5a6J
  5YWo6K+d6aKY

date: 2008-8-28
link: false
categories: life
---
最近在看一本《<a href="http://iceskysl.1sters.com/?action=show&amp;id=359">The Rails way</a>》的书，其中关于session存贮机制一章中，对基于CookieStore的session存储机制持否定态度，认为其存在被破解和<a href="http://en.wikipedia.org/wiki/Replay_attack">Replay attack</a>的可能。就我了解的信息来看，这个观点是不妥的。
最详细的一篇文章是写的laigongli写的这篇“<a href="http://izumi.plan99.net/blog/index.php/2007/11/25/rails-20-cookie-session-store-and-security/#comments">Rails 2.0, cookie session store and security</a>”，文章比较长，说的很详细，感兴趣的可以过去看看。其中主要观点为：
<ol>
	<li>The problems with PStore are significant enough to warrant a replacement <em>default</em> implementation.</li>
	<li>It’s a bad idea anyway to store sensitive information (like passwords) in the session. It doesn’t matter whether the session data can be seen by the client or not, it’s something nobody should ever do.</li>
	<li>Forging session data is only possible if cracking the secret is feasible.</li>
</ol>
文中，其针对Rails的采用CookieStore机制时，其针对“449fe2e7daee471bffae2fd8dc02313d”这样一个密码是，按照其机型：
“<em>My machine, an Intel Core 2 Duo T5300, can try 285840.1 passwords per second with 2 threads.</em>”
破解下来需要的时间是：
{% codeblock %}16^32/2 / 285840.1= 5.952*10^32 seconds= 1.886*10^25 years{% endcodeblock %}
这是个什么概念？

但是其也提到了由于Rails采用的<span style="color: red;"> Ruby’s CGI::Session的session Id生成器中</span>存在一个缺陷，导致其算法是可以被破解的，不过“<span style="color: #ff0000;">Update November 28: The key generation security problem has been fixed.</span>”已经修复了。所以，我也认为基于CookieStore的session存储机制是安全可靠的。

参考：
<ul>
	<li><a href="http://izumi.plan99.net/blog/index.php/2007/11/25/rails-20-cookie-session-store-and-security/#comments">Rails 2.0, cookie session store and security</a></li>
	<li><a href="http://blog.phishme.com/wp-content/uploads/BustRailsCookie.rb">BustRailsCookie.rb </a></li>
</ul>
