---
layout: post
title: 修复一个关于自动登录的BUG！
date: '2007-10-2'
comments: true
categories: Ruby&Rails
link: true
---
<p>前几天给&ldquo;技能云&rdquo;加上了自动登录的功能，并写了一篇手记文章（参考这里：<a href="../../../?action=show&amp;id=22&amp;page=1#cm59">在Rails中实现自动登录功能！</a>），但是前几天<span class="author"><a href="http://code.google.com/u/wangdi.cd/">wangdi.cd</a>提了一个问题如下：</span></p>
<p><span class="author">
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>我前几天用了一下itechtag，并且注册了一个hobitton的用户名，，但是现在，，我还没登&nbsp;&nbsp;</span></span></li>
    <li class=""><span>录，就自己给我用trail的用户名登录了，，还能修改他的信息，，怎么回事呢？&nbsp;&nbsp;</span></li>
</ol>
</div>
开始还没有引起重视，昨天晚上另外一个用户dbd也说存在这个问题，详细问了下，他说上次登录的时候选择了&ldquo;记住我&rdquo;，今天再次登录的时候就出现该问题了，而后google时无意看到JAVAEYE的抛出异常的爱说：</span></p>
<p><span class="author">
<div class="codeText">
<div class="codeHead">抛出异常的爱：</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>刚刚在&nbsp;&nbsp;</span></span></li>
    <li class=""><span>技能云http://www.itechtag.com/about&nbsp;&nbsp;</span></li>
    <li class="alt"><span>遇到了。。。&nbsp;&nbsp;</span></li>
    <li class=""><span>用的是温柔一刀的账号。。。。。&nbsp;&nbsp;</span></li>
</ol>
</div>
看来是有问题了，立即检查代码，看到取当前用户是否自动登录的代码如下：</span></p>
<p><span class="author">
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;get_current_user&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;session[</span><span class="symbol">:user</span><span>].</span><span class="keyword">nil</span><span>?&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;cookies[</span><span class="symbol">:p_session_id</span><span>]&nbsp;&amp;&amp;&nbsp;p&nbsp;=&nbsp;PersistentLogin.find_by_uid(cookies[</span><span class="symbol">:p_session_id</span><span>])&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;session[<span class="symbol">:user</span><span>]&nbsp;=&nbsp;<font color="#ff0000">c_user.id&nbsp;</font>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
再看看</span><span class="author"><span><span>PersistentLogin这个表的结构，如下：</span></span></span></p>
<p><span class="author"><span><span>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;CreatePersistentLogins&nbsp;&lt;&nbsp;ActiveRecord::Migration&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.up&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;create_table&nbsp;<span class="symbol">:persistent_logins</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;|t|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:uid</span><span>,&nbsp;</span><span class="symbol">:string</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:user_id</span><span>,&nbsp;</span><span class="symbol">:integer</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.column&nbsp;<span class="symbol">:created_on</span><span>,&nbsp;</span><span class="symbol">:datetime</span><span>,&nbsp;</span><span class="symbol">:null</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">false</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;add_index&nbsp;<span class="symbol">:persistent_logins</span><span>,&nbsp;</span><span class="symbol">:uid</span><span>,&nbsp;</span><span class="symbol">:name</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;uid&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;add_index&nbsp;<span class="symbol">:persistent_logins</span><span>,&nbsp;</span><span class="symbol">:created_on</span><span>,&nbsp;</span><span class="symbol">:name</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;created_on&quot;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.down&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;drop_table&nbsp;<span class="symbol">:persistent_logins</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
一眼看出问题所在，</span></span></span><span class="author"><span><span><span><span class="symbol">user_id</span><span>这个字段保存的才是用户的ID，而前面那段代码取成了id 字段，真是疏忽呀～</span></span></span></span></span></p>
<p><span class="author"><span><span><span><span>找到问题，自然好解决了，不在废话～<br />
</span></span></span></span></span></p>
