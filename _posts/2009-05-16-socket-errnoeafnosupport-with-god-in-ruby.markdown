--- 
layout: post
comments: true
title: Socket Errno::EAFNOSUPPORT with God in ruby
date: 2009-5-16
link: false
categories: life
---
<p>when i start god.sh,then give some error msg like this:</p>
<p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>I&nbsp;[2009-05-16&nbsp;21:25:41]&nbsp;&nbsp;INFO:&nbsp;Using&nbsp;pid&nbsp;file&nbsp;directory:&nbsp;/var/run/god&nbsp;&nbsp;</span></span></li>
    <li class=""><span>/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:850:in&nbsp;`initialize':&nbsp;Address&nbsp;family&nbsp;not&nbsp;supported&nbsp;by&nbsp;protocol&nbsp;-&nbsp;socket(2)&nbsp;(Errno::EAFNOSUPPORT)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:850:in&nbsp;`open'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:850:in&nbsp;`open_server_inaddr_any'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:863:in&nbsp;`open_server'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:759:in&nbsp;`open_server'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:757:in&nbsp;`each'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:757:in&nbsp;`open_server'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:1340:in&nbsp;`initialize'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:1628:in&nbsp;`new'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/1.8/drb/drb.rb:1628:in&nbsp;`start_service'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god/socket.rb:78:in&nbsp;`start'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god/socket.rb:43:in&nbsp;`initialize'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god.rb:607:in&nbsp;`new'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god.rb:607:in&nbsp;`start'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god.rb:633:in&nbsp;`at_exit'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god.rb:666&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/usr/local/ruby/lib/ruby/gems/1.8/gems/god-0.7.13/bin/../lib/god/cli/run.rb:87&nbsp;&nbsp;</span></li>
</ol>
</div>
ok,then i find some userful messsage,like here:</p>
<p style="background-color: rgb(255, 0, 0);"><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: 'times new roman'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: Verdana; font-size: 14px;" class="Apple-style-span">Errno::EAFNOSUPPORT - the specified<span class="Apple-converted-space">&nbsp;</span><em>sockaddr</em><span class="Apple-converted-space">&nbsp;</span>isnot a valid address for the family of the calling<span class="Apple-converted-space">&nbsp;</span><tt>socket</tt></span></span></p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: 'times new roman'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="font-family: Verdana; font-size: 14px;" class="Apple-style-span"><tt>and here, i notice where is the problen,the god find hostname,name map it to ip address,then create some sockets on the ip,and the error point is here,so i nano my /etc/hosts file,and add map for hostname and 127.0.0.1,that's it!<br />
</tt></span></span></p>
