---
layout: post
title: 隐藏你log中的敏感信息～
date: '2007-9-25'
comments: true
categories: Ruby&Rails
link: true
---
<p>写过rails的肯定看过它的日志文件，在登录的时候，你肯定看过类型下面的内容：</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>Processing&nbsp;UsersController#create&nbsp;(for&nbsp;127.0.0.1&nbsp;at&nbsp;2007-02-23&nbsp;19:11:20)&nbsp;[POST]&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Session&nbsp;ID:&nbsp;4047778b64af62d387f7e860e51cce20&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="tag">&lt;</span><span class="tag-name">span</span><span>&nbsp;</span><span class="attribute">style</span><span>=</span><span class="attribute-value">&quot;color:red;&quot;</span><span class="tag">&gt;</span><span>Parameters</span><span class="tag">&lt;/</span><span class="tag-name">span</span><span class="tag">&gt;</span><span>:&nbsp;{&quot;user&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;{&quot;name&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;&quot;name&quot;,&nbsp;&quot;password_confirmation&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;&quot;123456&quot;,&nbsp;&quot;password&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;&quot;123456&quot;},&nbsp;&quot;commit&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&quot;Register&quot;,&nbsp;&quot;action&quot;&nbsp;=<span class="tag">&gt;</span><span>&nbsp;&quot;create&quot;,&nbsp;&quot;controller&quot;&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;&quot;users&quot;}&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>SQL&nbsp;(0.000108)&nbsp;BEGIN&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="tag">&lt;</span><span class="tag-name">span</span><span>&nbsp;</span><span class="attribute">style</span><span>=</span><span class="attribute-value">&quot;color:red;&quot;</span><span class="tag">&gt;</span><span>SQL</span><span class="tag">&lt;/</span><span class="tag-name">span</span><span class="tag">&gt;</span><span>&nbsp;(0.000238)&nbsp;INSERT&nbsp;INTO&nbsp;users&nbsp;('name',&nbsp;'password')&nbsp;VALUES('name',&nbsp;'123456')&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>SQL&nbsp;(0.000395)&nbsp;COMMIT&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>Redirected&nbsp;to&nbsp;http://localhost:3000/users/5&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>...&nbsp;&nbsp;&nbsp; <br />
    </span></li>
</ol>
</div>
<p>做为一个安全爱好者，我可以负责任的告诉你，这些东西非常危险，恶意的人总是能想办法（这个办法很多，比如旁注等）拿到你的日志文件，而这个日志文件比起加密的数据库文件还要危险，于是肯定是需要做一些工作的。</p>
<p><strong>ActionController#filter_parameter_logging</strong> 就是我们需要的东西，它可以用来过滤那些你不想保存在日志中的数据，它可以阻止一些敏感数据赤裸裸的暴露在日志文件中，比如密码，或者信用卡帐号。也可以防止一些大块的数据占用日志文件，等等。<br />
如果你的应用用到passwords，复制下面这行到你的ApplicaitonController&nbsp; Class:</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>filter_parameter_logging&nbsp;</span><span class="string">&quot;password&quot;</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>这样就可以阻止任何匹配<u>/password/i</u>模式的数据被写入日志，诸如：<u>[user][password] 或 [user][password_confirmation]</u><br />
<br />
另外，如果想在开发环境下显示POST logging,但是在产品环境下完全不显示，如何做呢？</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>filter_parameter_logging(</span><span class="string">&quot;password&quot;</span><span>)&nbsp;</span><span class="keyword">if</span><span>&nbsp;RAILS_ENV&nbsp;==&nbsp;</span><span class="string">&quot;production&quot;</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>如果想完全禁止POST logging，则可以在production.rb中修改：config.log_level = :<font color="#ff0000">warn</font><br />
<br />
其他类似文章，请参考：</p>
<p>http://blackanger.blog.51cto.com/140924/35735<br />
http://hideto.javaeye.com/blog/106956<br />
http://api.rubyonrails.com/classes/ActionController/Base.html#M000260</p>
