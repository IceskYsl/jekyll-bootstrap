---
layout: post
title: 郁闷的事情，Blue上的XMPP4R竟然连不出来..
date: '2007-9-17'
comments: true
categories: Ruby&Rails
link: true
---
<p>本来已经突破最后一个难题以为搞定了这个XMOO4R的使用，在本地测试很顺利，无奈的是在bluehost上就是不成功，开始因为上面没有安装XMPP4R，后来突破了这个后，还是不行，错误如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>Processing&nbsp;PeopleController</span><span class="comment">#notify_in_gtalk&nbsp;(for&nbsp;121.35.109.40&nbsp;at&nbsp;2007-09-17&nbsp;09:02:42)&nbsp;[GET]</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;Session&nbsp;ID:&nbsp;192fbe2f031b846cbcba5fad37f32228&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;Parameters:&nbsp;{<span class="string">&quot;action&quot;</span><span>=&gt;</span><span class="string">&quot;notify_in_gtalk&quot;</span><span>,&nbsp;</span><span class="string">&quot;controller&quot;</span><span>=&gt;</span><span class="string">&quot;people&quot;</span><span>}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;SQL&nbsp;(0.000151)&nbsp;&nbsp;&nbsp;SET&nbsp;NAMES&nbsp;<span class="string">'utf8'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;SQL&nbsp;(0.000047)&nbsp;&nbsp;&nbsp;SET&nbsp;SQL_AUTO_IS_NULL=0&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;SQL&nbsp;(0.000000)&nbsp;&nbsp;&nbsp;Mysql::Error:&nbsp;Query&nbsp;was&nbsp;empty:&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Errno::ETIMEDOUT&nbsp;(Connection&nbsp;timed&nbsp;out&nbsp;-&nbsp;connect(2)):&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/connection.rb:53<span class="symbol">:in</span><span>&nbsp;`initialize</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/connection.rb:53:in&nbsp;`new'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/connection.rb:53<span class="symbol">:in</span><span>&nbsp;`connect</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/client.rb:73:in&nbsp;`connect'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/client.rb:60<span class="symbol">:in</span><span>&nbsp;`connect</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/client.rb:58:in&nbsp;`each'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/home/liquidch/ruby/gems/gems/xmpp4r-0.3/lib/xmpp4r/client.rb:58<span class="symbol">:in</span><span>&nbsp;`connect</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/vendor/plugins/xmpp4r-simple-0.8.7/lib/xmpp4r-simple.rb:390:in&nbsp;`connect!'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/vendor/plugins/xmpp4r-simple-0.8.7/lib/xmpp4r-simple.rb:322<span class="symbol">:in</span><span>&nbsp;`client</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/vendor/plugins/xmpp4r-simple-0.8.7/lib/xmpp4r-simple.rb:331:in&nbsp;`send!'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/vendor/plugins/xmpp4r-simple-0.8.7/lib/xmpp4r-simple.rb:147<span class="symbol">:in</span><span>&nbsp;`status</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/vendor/plugins/xmpp4r-simple-0.8.7/lib/xmpp4r-simple.rb:90:in&nbsp;`initialize'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/app/controllers/people_controller.rb:122<span class="symbol">:in</span><span>&nbsp;`</span><span class="keyword">new</span><span class="string">'</span>&nbsp;</span></li>
    <li class="alt"><span><span class="string">&nbsp;&nbsp;&nbsp;&nbsp;/app/controllers/people_controller.rb:122:in&nbsp;`notify_in_gtalk'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems&nbsp;&nbsp;</span></li>
</ol>
</div>
真是郁闷，我估计是BH上的限制，明天发个mail问问，但愿可以搞定，好想有一台自己的服务器哦。。</p>
