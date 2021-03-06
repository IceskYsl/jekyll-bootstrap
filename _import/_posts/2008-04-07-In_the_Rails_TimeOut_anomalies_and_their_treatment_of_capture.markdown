---
layout: post
title: 在Rails中捕获TimeOut异常及其处理
date: '2008-4-7'
comments: true
categories: Ruby&Rails
link: true
---
<p>把应用迁移到新的服务器上以后，发现经常有&rdquo;超时&ldquo;的错误信息，如<em>/usr/lib/ruby/1.8/timeout.rb:54:in `rbuf_fill': execution expired (Timeout::Error)</em>，恩，应该是网络不稳定或者是服务器响应太慢的结果，需要捕获下这个异常并做些处理，记录如下：</p>
<p>需要注意的是，<strong>Timeout::Error</strong>不是<strong>StandardError</strong>的子类, 而是继承至 <strong>Interrupt class</strong>，所以捕获的时候，需要格外注意，演示如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'net/pop3'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">begin</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;Net::POP3.auth_only(<span class="variable">@server</span><span>,&nbsp;</span><span class="variable">@port</span><span>,&nbsp;</span><span class="variable">@username</span><span>,&nbsp;</span><span class="variable">@password</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">rescue</span><span>&nbsp;=&gt;&nbsp;e&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;write_error_to_logfile(e)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;do_something_sensible&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
看上面的这段代码，当POP3服务器不能及时响应的时候，所触发的异常并不能被下面捕获到，原因就是上面说的，再看正确的处理代码：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'net/pop3'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">begin</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;Net::POP3.auth_only(<span class="variable">@server</span><span>,&nbsp;</span><span class="variable">@port</span><span>,&nbsp;</span><span class="variable">@username</span><span>,&nbsp;</span><span class="variable">@password</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">rescue</span><span>&nbsp;=&gt;&nbsp;e&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;write_error_to_logfile(e)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;do_something_sensible&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">rescue</span><span>&nbsp;Timeout::Error&nbsp;=&gt;&nbsp;e&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;write_error_to_logfile(e)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;do_something_sensible_for_timeout&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
这段代码可以正常工作，并按照我们的意愿来处理了。</p>
<p>&nbsp;如果您知道对方的服务器会比较慢的响应，或者你知道网络状态不好，你可以单独设置这个<strong>TimeOut</strong>的时间，代码如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'timeout'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>...&nbsp;&nbsp;</span></li>
    <li class=""><span>...&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">begin</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;timeout(60)&nbsp;<span class="keyword">do</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;resp,&nbsp;body=3Dh.get(<span class="string">'/index.html'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;puts&nbsp;body&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">rescue</span><span>&nbsp;TimeoutError&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;puts&nbsp;<span class="string">&quot;Timed&nbsp;Out&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
</p>
<p>或者这样：（来源：http://textsnippets.com/posts/show/868）
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>http&nbsp;=&nbsp;Net::HTTP.</span><span class="keyword">new</span><span>(url.host,&nbsp;url.port)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>http.read_timeout=time_out&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p><strong>参考资料：</strong></p>
<p>1.'rbuf_fill': execution expired (Timeout::Error): http://lindsaar.net/2007/12/9/rbuf_filltimeout-error</p>
<p>2.How to catch Timeout::ERROR ? : http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/170394</p>
<p>3.Ruby's Thread#raise, Thread#kill, timeout.rb, and net/protocol.rb libraries are broken: http://headius.blogspot.com/2008/02/rubys-threadraise-threadkill-timeoutrb.html</p>
<p>4.How to change the Timeout::Error threshold for open_uri : http://www.ruby-forum.com/topic/146676</p>
<p>5.http://griffin.oobleyboo.com/archive/ruby-net-http-exceptions/</p>
