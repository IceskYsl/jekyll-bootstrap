---
layout: post
title: 使用Jsonifier在rails中生成json
date: '2007-7-12'
comments: true
categories: Ruby&Rails
link: true
---
<p>由于一个系统需要对外提供数据，自然使用widget来实现，JS中自然是对json支持最好，也是就可以吧数据组装成json格式的，再用JS解析显示，于是就有了这个需求：在rails中生成JSON，尽管rails1.1版本就增加了对json的支持，但要想更加灵活，自然使用插件来实现了，而Jsonifier 正是我们需要的。<br />
看看Jsonifier的自我介绍：<br />
Jsonifier is a Rails plugin that adds options to the ActiveRecord#to_json method similar to ActiveRecord#to_xml. It's time to treat the JSON encoding of AR objects with more respect ;)The :only, :except, :methods, and :include options are supported. Check out the examples below. <br />
<br />
<strong>*安装：*</strong><br />
很简单，script/plugin install svn://svn.codefront.net/jsonifier/trunk<br />
<br />
<strong>*使用：*</strong></p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>david&nbsp;=&nbsp;User.find(1)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>david.to_json&nbsp;<span class="comment">#&nbsp;{id:&nbsp;1,&nbsp;name:&nbsp;&quot;David&quot;,&nbsp;awesome:&nbsp;true,&nbsp;created_at:&nbsp;&quot;07/01/2007&quot;}</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>david.to_json(<span class="symbol">:only</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:name</span><span>)&nbsp;</span><span class="comment">#&nbsp;{name:&nbsp;&quot;David&quot;}</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>david.to_json(<span class="symbol">:only</span><span>&nbsp;=&gt;&nbsp;[</span><span class="symbol">:id</span><span>,&nbsp;</span><span class="symbol">:name</span><span>])&nbsp;</span><span class="comment">#&nbsp;{id:&nbsp;1,&nbsp;name:&nbsp;&quot;David&quot;}</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>david.to_json(<span class="symbol">:except</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:created_at</span><span>)&nbsp;</span><span class="comment">#&nbsp;{id:&nbsp;1,&nbsp;name:&nbsp;&quot;David&quot;,&nbsp;awesome:&nbsp;true}</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>david.to_json(<span class="symbol">:except</span><span>&nbsp;=&gt;&nbsp;[</span><span class="symbol">:id</span><span>,&nbsp;</span><span class="symbol">:created_at</span><span>])&nbsp;</span><span class="comment">#&nbsp;{name:&nbsp;&quot;David&quot;,&nbsp;awesome:&nbsp;true}</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>很简单吧～</p>
