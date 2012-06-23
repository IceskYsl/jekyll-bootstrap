---
layout: post
title: 使用UUID做ActiveRecord主键
date: '2008-8-14'
comments: true
categories: Ruby&Rails
link: true
---
大家都知道，在Rails中比较常见的做法是使用“<strong>auto increment</strong>”的id做为主键，虽然很便捷，但是也存在以下问题：

1）敏感信息泄漏 --比如注册用户数，发表文章数等，内行一眼就看出你系统的规模；

2）分布式DB存在冲突 --一个DB不够了，需要多个DB的时候，可能会存在ID冲突的情况；

3）旧数据库影响  --导入、导出的时候可能存在一些问题（rake db:schema:dump）

由于这些问题都是很关键的，所以很有必要做一些改变，思路很简单，使用UUID做主键，可以保证主键的唯一性（类似12f186e6-687e-11ad-843e-001b632783f1，全世界唯一），又能隐藏敏感信息，且实现很简单，如下：

<strong>1、创建表，去掉ID属性，增加UUID属性</strong>

&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>create_table </span><span class="symbol">:posts</span><span>, </span><span class="symbol">:id</span><span> =&gt; </span><span class="keyword">false</span><span> </span><span class="keyword">do</span><span> |t|  </span></span></li>
	<li><span>  t.string <span class="symbol">:uuid</span><span>, </span><span class="symbol">:limit</span><span> =&gt; 36, </span><span class="symbol">:primary</span><span> =&gt; </span><span class="keyword">true</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>2、在Model中设置主键为UUID</strong>

&nbsp;

&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> Post &lt; ActiveRecord::Base  </span></span></li>
	<li><span>  set_primary_key <span class="string">"uuid"</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>3、安装UUID的gem</strong>

&nbsp;

&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>sudo gem install uuidtools  </span></span></li>
</ol>
</div>
<strong>4、创建lib/uuid_helper.rb </strong>

&nbsp;

&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'rubygems'</span><span>  </span></span></li>
	<li><span>require <span class="string">'uuidtools'</span><span>  </span></span></li>
	<li class="alt"><span>   </span></li>
	<li><span><span class="keyword">module</span><span> UUIDHelper  </span></span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> before_create()  </span></span></li>
	<li><span>    <span class="keyword">self</span><span>.uuid = UUID.timestamp_create().to_s  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<strong>5、使用<span>UUIDHelper</span></strong>

&nbsp;

&nbsp;
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> Post &lt; ActiveRecord::Base  </span></span></li>
	<li><span>  set_primary_key <span class="string">"uuid"</span><span>  </span></span></li>
	<li class="alt"><span>  include UUIDHelper  </span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
OK，新建一个post，就可以看到，该字段被自动填入了。

&nbsp;

PS：需要注意的是，需要留意<span><span>before_create是否有冲突。</span></span>

参考文章：

http://ariejan.net/2008/08/12/ruby-on-rails-uuid-as-your-activerecord-primary-key/
