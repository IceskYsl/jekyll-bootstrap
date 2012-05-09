--- 
layout: post
comments: true
title: How can I find out what is generating iowait on my server?
date: 2009-4-25
link: false
categories: life
---
<p>A question I&rsquo;m asked daily is &ldquo;How can I find out what is generating iowait on my server?&rdquo; Sure, you can dig through pages of lsof output, restart services, or run strace, but it can be a frustrating process. I saw a process on this blog post, and&nbsp; a guy changed the regexes to fit Red Hat and CentOS systems a bit better:<br />
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>[root</span><span class="variable">@5</span><span>-3&nbsp;~]</span><span class="comment">#&nbsp;/etc/init.d/syslog&nbsp;stop</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Shutting&nbsp;down&nbsp;kernel&nbsp;logger:&nbsp;[&nbsp;&nbsp;OK&nbsp;&nbsp;]&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Shutting&nbsp;down&nbsp;system&nbsp;logger:&nbsp;[&nbsp;&nbsp;OK&nbsp;&nbsp;]&nbsp;&nbsp;</span></li>
    <li class=""><span>[root<span class="variable">@5</span><span>-3&nbsp;~]</span><span class="comment">#&nbsp;echo&nbsp;1&nbsp;&gt;&nbsp;/proc/sys/vm/block_dump</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>[root<span class="variable">@5</span><span>-3&nbsp;~]</span><span class="comment">#&nbsp;dmesg&nbsp;|&nbsp;egrep&nbsp;&quot;READ|WRITE|dirtied&quot;&nbsp;|&nbsp;egrep&nbsp;-o&nbsp;'([a-zA-Z]*)'&nbsp;|&nbsp;sort&nbsp;|&nbsp;uniq&nbsp;-c&nbsp;|&nbsp;sort&nbsp;-rn&nbsp;|&nbsp;head</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;202&nbsp;kjournald&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16&nbsp;egrep&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9&nbsp;irqbalance&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9&nbsp;bash&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;java&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;sda&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;mailserver&nbsp;&nbsp;</span></li>
    <li class="alt"><span>[root<span class="variable">@5</span><span>-3&nbsp;~]</span><span class="comment">#&nbsp;echo&nbsp;0&nbsp;&gt;&nbsp;/proc/sys/vm/block_dump</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>[root<span class="variable">@5</span><span>-3&nbsp;~]</span><span class="comment">#&nbsp;/etc/init.d/syslog&nbsp;start</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>Starting&nbsp;system&nbsp;logger:&nbsp;[&nbsp;&nbsp;OK&nbsp;&nbsp;]&nbsp;&nbsp;</span></li>
    <li class=""><span>Starting&nbsp;kernel&nbsp;logger:&nbsp;[&nbsp;&nbsp;OK&nbsp;&nbsp;]&nbsp;&nbsp;</span></li>
</ol>
</div>
In my specific situation, it looks like <span>kjournald&nbsp; </span>is the biggest abuser of my disk.</p>
<p>Don&rsquo;t forget to set things back to their normal state when you&rsquo;re done!</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span>#&nbsp;echo&nbsp;0&nbsp;</span><span class="tag">&gt;</span><span>&nbsp;/proc/sys/vm/block_dump&nbsp;&nbsp;</span></span></li>
    <li class=""><span>#&nbsp;/etc/init.d/syslog&nbsp;start&nbsp; <br />
    </span></li>
</ol>
</div>
<p><br />
<strong>ref:</strong><br />
http://rackerhacker.com/2008/03/11/hunting-down-elusive-sources-of-iowait/<br />
http://blog.eikke.com/index.php/ikke/2007/03/22/who_s_abusing_my_sata_controller<br />
http://hi.baidu.com/dipsey/blog/item/900bbbaf3e46dcc97cd92aba.html<br />
<a href="http://www.ducea.com/2009/03/11/howto-install-iotop-on-debian-etch/">http://www.ducea.com/2009/03/11/howto-install-iotop-on-debian-etch/</a></p>
<p>&nbsp;</p>
<p><a href="http://www.cppblog.com/go-benny/archive/2008/04/23/47908.html">http://www.cppblog.com/go-benny/archive/2008/04/23/47908.html</a></p>
<p>&nbsp;</p>
