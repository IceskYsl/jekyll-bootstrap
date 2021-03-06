---
layout: post
title: 在Rails中集成SMS功能
date: '2008-9-18'
comments: true
categories: Ruby&Rails
link: true
---
大家对于在Rails系统中发送Email或者IM消息都比较熟悉了，接下来还有一个比较有趣的就是直接发送SMS（短信），也就是接收页面上输入的接收者的手机号码和需要发送的消息，以SMS或者WAP的方式发送到用户手机是。

实现这个功能一般来会所有两个思路，其一是使用<span class="Apple-style-span" style="border-collapse: separate; color: #cccccc; font-family: Helvetica; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;"><a style="margin: 0px; padding: 0px; text-decoration: none; font-weight: bold; color: #c4dd06;" href="http://raa.ruby-lang.org/project/ruby-sms/">ruby-sms</a><span style="color: #000000;">这样的类操作移动设备（比如说手机）和网关交互，发送消息。这类一般比较复杂；还有一类是直接调用现成的SMS网关API，按照其API的格式传递参数即可。</span></span>

<span class="Apple-style-span" style="border-collapse: separate; color: #cccccc; font-family: Helvetica; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;"><span style="color: #000000;">现在这里主要说的是第二类的实现，要实现这个方式的SMS发送，需要找到一家类似的服务商，比如台湾的</span></span>TWSMS(<a href="http://www.twsms.com/" rel="nofollow">http://www.twsms.com</a>)，然后根据其API或者form格式就可以发送SMS了，这里举两个例子。一个是一个台湾的朋友写的<a href="http://code.google.com/p/twsms/">twsms</a>；另外一个是一个老外写的<a href="http://clickatell.rubyforge.org/">clickatell</a>。其各自的使用方法都很简单，如下

<strong>twsms：</strong>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'twsms'</span><span>  </span></span></li>
	<li><span>sms = TWSMS.<span class="keyword">new</span><span>(</span><span class="string">"username"</span><span>, </span><span class="string">"password"</span><span>)  </span></span></li>
	<li class="alt"><span>sms.sendSMS(mobile, message)  </span></li>
	<li><span>sms.querySMS  </span></li>
	<li class="alt"><span>sms.setMessageId(msgid)  </span></li>
	<li><span>sms.querySMS  </span></li>
</ol>
</div>
<strong>clicktell:</strong>
<div class="codeText">
<div class="codeHead">ActiveRecord代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'clickatell'</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="keyword">class</span><span> SMS  </span></span></li>
	<li><span>  <span class="keyword">def</span><span> initialize(config)  </span></span></li>
	<li class="alt"><span>    <span class="variable">@config</span><span> = config  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  <span class="keyword">def</span><span> create(recipient, message_text)  </span></span></li>
	<li class="alt"><span>    api.send_message(recipient, message_text)  </span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  private  </span></li>
	<li class="alt"><span>    <span class="keyword">def</span><span> api  </span></span></li>
	<li><span>      <span class="variable">@api</span><span> ||= Clickatell::API.authenticate(  </span></span></li>
	<li class="alt"><span>        <span class="variable">@config</span><span>[</span><span class="symbol">:api_key</span><span>],  </span></span></li>
	<li><span>        <span class="variable">@config</span><span>[</span><span class="symbol">:username</span><span>],  </span></span></li>
	<li class="alt"><span>        <span class="variable">@config</span><span>[</span><span class="symbol">:password</span><span>]  </span></span></li>
	<li><span>      )  </span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">YML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span># config/clickatell.yml  </span></span></li>
	<li><span>api_key: abcdefghi123  </span></li>
	<li class="alt"><span>username: joebloggs  </span></li>
	<li><span>password: secret  </span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">加载配置文件</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># config/environments/production.rb</span><span>  </span></span></li>
	<li><span>CLICKATELL_CONFIG = YAML.load(<span class="builtin">File</span><span>.open(</span><span class="builtin">File</span><span>.join(RAILS_ROOT, </span><span class="string">'config'</span><span>, </span><span class="string">'clickatell.yml'</span><span>)))  </span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead"><span><span>Routing配置</span></span></div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>ActionController::Routing::Routes.draw </span><span class="keyword">do</span><span> |map|  </span></span></li>
	<li><span>  map.resource <span class="symbol">:sms</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">app/views/sms/new.rhtml</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span class="tag">&lt;</span><span>% form_tag '/sms', </span><span class="attribute">:method</span><span> =</span><span class="tag">&gt;</span><span> :post do -%</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  <span class="tag">&lt;</span><span class="tag-name">label</span><span class="tag">&gt;</span><span>Enter the recipients mobile number:</span><span class="tag">&lt;/</span><span class="tag-name">label</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="tag">&lt;</span><span>%= text_field_tag "recipient" %</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  <span class="tag">&lt;</span><span class="tag-name">label</span><span class="tag">&gt;</span><span>Enter your message:</span><span class="tag">&lt;/</span><span class="tag-name">label</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="tag">&lt;</span><span>%= text_area_tag "message_text" %</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li><span>  <span class="tag">&lt;</span><span>%= submit_tag "Send SMS" %</span><span class="tag">&gt;</span><span>  </span></span></li>
	<li class="alt"><span><span class="tag">&lt;</span><span>% end %</span><span class="tag">&gt;</span><span>  </span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead"><span><span>Controller</span></span>代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> SmsController &lt; ApplicationController  </span></span></li>
	<li><span>  <span class="keyword">def</span><span> create  </span></span></li>
	<li class="alt"><span>    sms = SMS.<span class="keyword">new</span><span>(CLICKATELL_CONFIG)  </span></span></li>
	<li><span>    sms.create(params[<span class="symbol">:recipient</span><span>], params[</span><span class="symbol">:message_text</span><span>])  </span></span></li>
	<li class="alt"><span>    flash[<span class="symbol">:notice</span><span>] = </span><span class="string">"Message sent succesfully!"</span><span>   </span></span></li>
	<li><span>    redirect_to <span class="symbol">:back</span><span>  </span></span></li>
	<li class="alt"><span>  <span class="keyword">rescue</span><span> Clickatell::API::Error =&gt; e  </span></span></li>
	<li><span>    flash[<span class="symbol">:error</span><span>] = </span><span class="string">"Clickatell API error: #{e.message}"</span><span>   </span></span></li>
	<li class="alt"><span>    redirect_to <span class="symbol">:back</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
如上说的都是TW或者其他地方的SMS网关的实现，在国内我貌似没看到有类似的服务的，谁看到过，和我说一下哈。

<strong>参考文档：</strong>

<a href="http://www.lukeredpath.co.uk/2007/8/29/sending-sms-messages-from-your-rails-application">http://www.lukeredpath.co.uk/2007/8/29/sending-sms-messages-from-your-rails-application</a>

<a href="http://www.lukeredpath.co.uk/2007/8/29/sending-sms-messages-from-your-rails-application">http://clickatell.rubyforge.org/</a>

<a href="http://www.lukeredpath.co.uk/2007/8/29/sending-sms-messages-from-your-rails-application">http://code.google.com/p/twsms/
</a>

&nbsp;
