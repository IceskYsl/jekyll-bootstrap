---
layout: post
title: 在Rails中实现自动登录功能！
date: '2007-9-21'
comments: true
categories: Ruby&Rails
link: true
---
<p>透明同学说需要给<a href="http://www.itechtag.com/">技能云</a>一个&rdquo;自动登录&ldquo;的功能，于是下午睡觉起来google了些资料，也大概问了下几个朋友，思路就有了，思路很多种，这里采取的是<a href="http://livsey.org/2006/6/30/persistent-logins-in-rails">这篇文章</a>介绍的方式。</p>
<p>基本步骤如下：</p>
<p>1、首先创建一个用来保存用户信息的表modle（<span class="cl">PersistentLogin</span>），代码如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;CreatePersistentLogins&nbsp;&lt;&nbsp;ActiveRecord::Migration&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.up&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;create_table&nbsp;<span class="symbol">:persistent_logins</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|t|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:uid</span><span>,&nbsp;</span><span class="symbol">:string</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:user_id</span><span>,&nbsp;</span><span class="symbol">:integer</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:created_on</span><span>,&nbsp;</span><span class="symbol">:datetime</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;add_index&nbsp;<span class="symbol">:persistent_logins</span><span>,&nbsp;</span><span class="symbol">:uid</span><span>,&nbsp;</span><span class="symbol">:name</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;uid&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;add_index&nbsp;<span class="symbol">:persistent_logins</span><span>,&nbsp;</span><span class="symbol">:created_on</span><span>,&nbsp;</span><span class="symbol">:name</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;created_on&quot;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.down&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;drop_table&nbsp;<span class="symbol">:persistent_logins</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>2、然后写这个modle，代码如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;PersistentLogin&nbsp;&lt;&nbsp;ActiveRecord::Base&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;belongs_to&nbsp;<span class="symbol">:user</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;before_create&nbsp;<span class="symbol">:assign_uid</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;private&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;assign_uid&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">self</span><span>.uid&nbsp;=&nbsp;UUID.random_create.to_s&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>3、紧接着在登录的页面加一个chechk_box用来供用户选择是否保存自己的信息以实现自动登录，代码如下：</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span class="tag">&lt;</span><span>%=check_box_tag(&quot;persist&quot;,&nbsp;</span><span class="attribute">value</span><span>&nbsp;=&nbsp;</span><span class="attribute-value">&quot;1&quot;</span><span>,&nbsp;</span><span class="attribute">checked</span><span>&nbsp;=&nbsp;</span><span class="attribute-value">true</span><span>,&nbsp;</span><span class="attribute">options</span><span>&nbsp;=&nbsp;{})%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;记住我吧.&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>4、接着在你原来的验证登录的地方，添加如下代码：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;inside&nbsp;your&nbsp;'login'&nbsp;code&nbsp;after&nbsp;you&nbsp;have&nbsp;validated&nbsp;the&nbsp;credentials</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">if</span><span>&nbsp;params[</span><span class="symbol">:persist</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;p&nbsp;=&nbsp;PersistentLogin.create(<span class="symbol">:user</span><span>=&gt;u)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;cookies[<span class="symbol">:p_session_id</span><span>]&nbsp;=&nbsp;{</span><span class="symbol">:value</span><span>&nbsp;=&gt;&nbsp;p.uid,&nbsp;</span><span class="symbol">:expires</span><span>&nbsp;=&gt;&nbsp;</span><span class="builtin">Time</span><span>.now&nbsp;+&nbsp;7.days}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>5、写一个前置过滤器，判断用户是否存在cookie，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;get_current_user&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;session[</span><span class="symbol">:user</span><span>].</span><span class="keyword">nil</span><span>?&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;cookies[</span><span class="symbol">:p_session_id</span><span>]&nbsp;&amp;&amp;&nbsp;p&nbsp;=&nbsp;PersistentLogin.find_by_uid(cookies[</span><span class="symbol">:p_session_id</span><span>])&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;session[<span class="symbol">:user</span><span>]&nbsp;=&nbsp;c_user.id&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>6、最后用户点了退出登录以后，删除cookie和表中记录，代码如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;logout&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;session[<span class="symbol">:user</span><span>]&nbsp;=&nbsp;</span><span class="keyword">nil</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;cookies[</span><span class="symbol">:p_session_id</span><span>]&nbsp;&amp;&amp;&nbsp;p&nbsp;=&nbsp;PersistentLogin.find_by_uid(cookies[</span><span class="symbol">:p_session_id</span><span>])&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;p.destroy&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;cookies.delete&nbsp;<span class="symbol">:p_session_id</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>备注：需要安装一个<a href="http://rubyforge.org/projects/uuidtools/">UUID</a>用来产生随机数，自然你也可以自己写，对时间MD5一下肯定重复不了，呵呵。</p>
<p>代码偶给的已经相当详细了，就不具体解释了。</p>
<p>另外还可以参考：</p>
<p>http://lightyror.thegiive.net/2007/04/persistent-login-on-rails.html</p>
<p>http://livsey.org/2006/6/30/persistent-logins-in-rails</p>
