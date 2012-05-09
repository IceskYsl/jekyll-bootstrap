--- 
layout: post
comments: true
title: !binary |
  6K6p5L2g55qEUmFpbHPov5znprtTUUwgSW5qZWN0aW9u

date: 2007-9-24
link: false
categories: life
---
<p>做为一名安全爱好者，我自然知道现在在动态语言写的web系统中可能存在的安全隐患的，例如大名鼎鼎的SQL Injection，CSS/XSS，文件包含，暴路径，泄露源代码等等，其中目前最杀手级的应该是SQL注射了，在PHP和ASP的世界了，辅助 union查询可以恩容易的暴出敏感数据，例如管理员用户名、密码等，就算你的密码MD5加密了，也有诸如XMD5这样的站点在线查询破解，如果存在漏 洞，自然非常危险。</p>
<p>Rails出生于真实的WEB应用，自然考虑到这些问题，例如如下代码即可杜绝Rails的SQL Injection：</p>
<p>
<div class="codeText">
<div class="codeHead">示范代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;tasks_controller.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;index&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="variable">@tasks</span><span>&nbsp;=&nbsp;Task.find(</span><span class="symbol">:all</span><span>,&nbsp;</span><span class="symbol">:conditions</span><span>&nbsp;=&gt;&nbsp;[</span><span class="string">&quot;name&nbsp;LIKE&nbsp;?&quot;</span><span>,&nbsp;</span><span class="string">&quot;%</span></span><span><span class="string"><span><span class="string">#{params[:query]}</span></span></span></span><span><span class="string">%&quot;</span><span>])&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
如上代码在PHP或者ASP中的处理逻辑是先取得<span><span class="string">params[:query]，再对这个进行检查、过滤，才能放进去查询的，在Rails中，只要使用? 替代符，然后就可以实现这个效果。如果你写成下面这个样子，肯定是危险的：</span></span></p>
<p><span><span class="string">
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;tasks_controller.rb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;index&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;<span class="variable">@tasks</span><span>&nbsp;=&nbsp;Task.find(</span><span class="symbol">:all</span><span>,&nbsp;</span><span class="symbol">:conditions</span><span>&nbsp;=&gt;&nbsp;[</span><span class="string">&quot;name&nbsp;LIKE&nbsp;#{params[:query]}&quot;</span><span>])&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
以一个业余hacker的口气告诫您，一定要注意！<br />
</span></span></p>
