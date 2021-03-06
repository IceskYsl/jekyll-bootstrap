---
layout: post
title: 留神你的session文件～
date: '2007-10-25'
comments: true
categories: Ruby&Rails
link: true
---
<p>早上6点半起床，打开电脑，打开技能云，一切正常，开始写Gtalk的发送消息的ruby代码，很顺利，全部搞定，准备关机的时候，刷新了下技能云，显示启动错误！</p>
<p>晕，哪里出问题了呢？我刚才没有更新代码上去呀，看来是系统的问题，SSH上去，看日志没有任何有用的信息，调试一把，可以启动，难道是 sessions的问题（我的session还是保存在文件系统里面的），转到tmp/sessions下wc -l 了一下，寒，7W多个文件，恐怖，貌似我忘记清理了，直接rm * （保存密码的人别骂我哈），显示参数过长，郁闷，看来文件数太多了，文件貌似也没有什么规律，总不能一个一个删吧（傻瓜才这个干），于是寻找解决办法。</p>
<p>Google到这段代码，试了下可以正常工作，共享给大家：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'find'</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>namespace&nbsp;<span class="symbol">:tmp</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;namespace&nbsp;<span class="symbol">:sessions</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;desc&nbsp;<span class="string">'Clear&nbsp;expired&nbsp;sessions'</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;task&nbsp;<span class="symbol">:clear_expired</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:environment</span><span>&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctime&nbsp;=&nbsp;(ENV[<span class="string">'ctime'</span><span>]&nbsp;||&nbsp;120).to_i&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;atime&nbsp;=&nbsp;(ENV[<span class="string">'atime'</span><span>]&nbsp;|| 20).to_i&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Find.find(RAILS_ROOT&nbsp;+&nbsp;<span class="string">&quot;/tmp/sessions/&quot;</span><span>)&nbsp;</span><span class="keyword">do</span><span>&nbsp;|path|&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;FileTest.directory?(path)&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;</span><span class="builtin">File</span><span>.basename(path)[0]&nbsp;==&nbsp;?.&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Find.prune&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">next</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="builtin">File</span><span>.delete(path)&nbsp;</span><span class="keyword">if</span><span>&nbsp;</span><span class="builtin">File</span><span>.ctime(path)&nbsp;&lt;&nbsp;ctime.minutes.ago&nbsp;</span><span class="keyword">or</span><span>&nbsp;</span><span class="builtin">File</span><span>.atime(path)&nbsp;&lt;&nbsp;atime.minutes.ago&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
按照作者给出的用法，如下：</p>
<p>It can be run with 2 optional parameters: &ldquo;atime&rdquo;, which defines the time in minutes that will be compared against the last access time of a session file and &ldquo;ctime&rdquo; which defines the time in minutes that will be compared against the creation time of a session file. The default values are: ctime = 120 (minutes) and atime = 20 (miuntes) which means that the session files not accessed in the last 20 minutes and created earlier than 2 hours ago will be removed when the script runs.</p>
<p>保存到你的lib/tasks目录下，然后用rake -T就可以看到这个rake命令，可以接受两个参数，举个例子，如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>rake&nbsp;tmp</span><span class="symbol">:sessions</span><span class="symbol">:clear_expired</span><span>&nbsp;atime=15&nbsp;ctime=60&nbsp;&nbsp;</span></span></li>
</ol>
</div>
另外，还google到一段直接配置的脚本，如下：</p>
<p>Here's a cron-only one liner which, every 30 min, removes all session files that haven't been accessed in 4 hours.  10,40 * * * * /usr/bin/find /u/apps/*/current/tmp/sessions -name &quot;ruby_sess*&quot; -amin +240 -exec rm {} \;</p>
<p>如果你有更优雅的方法，请分享给我，谢谢～</p>
<p>参考地址：<br />
http://www.taknado.com/2007/7/25/rake-task-to-clear-expired-session-files</p>
