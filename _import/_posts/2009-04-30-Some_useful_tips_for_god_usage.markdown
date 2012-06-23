---
layout: post
title: Some_useful_tips_for_god_usage
date: '2009-4-30'
comments: true
categories: 技术归总
tags: God Ruby&amp;Rails tips
link: true
---
<p>some days before,i&nbsp; posted a article 《<a href="http://iceskysl.1sters.com/?action=show&amp;id=364">God: 比Monit更好用的monitoring</a>》,today,i will post more useful tips for God.</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>[iceskysl</span><span class="variable">@ws_api</span><span>]</span><span class="comment">#&nbsp;god&nbsp;--help</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;Usage:&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;Starting:&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;god&nbsp;[-c&nbsp;&lt;config&nbsp;file&gt;]&nbsp;[-p&nbsp;&lt;port&gt;&nbsp;|&nbsp;-b]&nbsp;[-P&nbsp;&lt;file&gt;]&nbsp;[-l&nbsp;&lt;file&gt;]&nbsp;[-D]&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;Querying:&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;god&nbsp;&lt;command&gt;&nbsp;&lt;argument&gt;&nbsp;[-p&nbsp;&lt;port&gt;]&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;god&nbsp;&lt;command&gt;&nbsp;[-p&nbsp;&lt;port&gt;]&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;god&nbsp;-v&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;god&nbsp;-V&nbsp;(must&nbsp;be&nbsp;run&nbsp;as&nbsp;root&nbsp;to&nbsp;be&nbsp;accurate&nbsp;on&nbsp;Linux)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;Commands:&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;start&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;start&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;monitor&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;monitor&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unmonitor&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unmonitor&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;remove&nbsp;&lt;task&nbsp;<span class="keyword">or</span><span>&nbsp;group&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;remove&nbsp;task&nbsp;</span><span class="keyword">or</span><span>&nbsp;group&nbsp;from&nbsp;god&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;load&nbsp;&lt;file&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;load&nbsp;a&nbsp;config&nbsp;into&nbsp;a&nbsp;running&nbsp;god&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;log&nbsp;&lt;task&nbsp;name&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;show&nbsp;realtime&nbsp;log&nbsp;<span class="keyword">for</span><span>&nbsp;given&nbsp;task&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;show&nbsp;status&nbsp;of&nbsp;<span class="keyword">each</span><span>&nbsp;task&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;quit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop&nbsp;god&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terminate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stop&nbsp;god&nbsp;<span class="keyword">and</span><span>&nbsp;all&nbsp;tasks&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;check&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;run&nbsp;<span class="keyword">self</span><span>&nbsp;diagnostic&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;Options:&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;-c,&nbsp;--config-file&nbsp;CONFIG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Configuration&nbsp;file&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;-p,&nbsp;--port&nbsp;PORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Communications&nbsp;port&nbsp;(default&nbsp;17165)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;-b,&nbsp;--auto-bind&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Auto-bind&nbsp;to&nbsp;an&nbsp;unused&nbsp;port&nbsp;number&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;-P,&nbsp;--pid&nbsp;FILE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Where&nbsp;to&nbsp;write&nbsp;the&nbsp;PID&nbsp;file&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;-l,&nbsp;--log&nbsp;FILE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Where&nbsp;to&nbsp;write&nbsp;the&nbsp;log&nbsp;file&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;-D,&nbsp;--no-daemonize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Don't&nbsp;daemonize&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;-v,&nbsp;--version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;the&nbsp;version&nbsp;number&nbsp;<span class="keyword">and</span><span>&nbsp;exit&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;-V&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Print&nbsp;extended&nbsp;version&nbsp;<span class="keyword">and</span><span>&nbsp;build&nbsp;information&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--log-level&nbsp;LEVEL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Log&nbsp;level&nbsp;[debug|info|warn|error|fatal]&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--no-syslog&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disable&nbsp;output&nbsp;to&nbsp;syslog&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--attach&nbsp;PID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quit&nbsp;god&nbsp;<span class="keyword">when</span><span>&nbsp;the&nbsp;attached&nbsp;process&nbsp;dies&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--no-events&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disable&nbsp;the&nbsp;event&nbsp;system&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--bleakhouse&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enable&nbsp;bleakhouse&nbsp;profiling&nbsp;&nbsp;</span></li>
    <li class=""><span>[iceskysl<span class="variable">@ws_api</span><span>]</span><span class="comment">#&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
1.DYNAMICALLY LOADING CONFIG FILES INTO AN ALREADY RUNNING GOD</p>
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: 'times new roman'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span"><span style="color: rgb(72, 72, 72); font-family: 'Trebuchet MS'; font-size: 13px; line-height: 19px;" class="Apple-style-span">
<p style="margin: 0px 0px 1em; font-size: 13px;">God allows you to load or reload configurations into an already running instance. There are a few things to consider when doing this:</p>
<ul style="margin: 0px 0px 1em; font-size: 13px;">
    <li style="margin: 0px; font-size: 13px;">Existng Watches with the same<span class="Apple-converted-space">&nbsp;</span><code style="margin: 0px; font-size: 1.2em;">name{% endcodeblock %}<span class="Apple-converted-space">&nbsp;</span>as the incoming Watches will be overidden by the new config.</li>
    <li style="margin: 0px; font-size: 13px;">All paths must be either absolute or relative to the path from which god was started.</li>
</ul>
<p style="margin: 0px 0px 1em; font-size: 13px;">To load a config into a running god, issue the following command:</p>
<pre style="border: 1px solid rgb(204, 204, 204); margin: 1em 0px; padding: 1em; font-size: 10px; line-height: 1.3; background-color: rgb(239, 239, 239);">$ sudo god load path/to/config.god<br /># god load /data/www/api/config/config_thin_api.god{% endcodeblock %}
<p style="margin: 0px 0px 1em; font-size: 13px;">Config files that are loaded dynamically can contain anything that a normal config file contains, however, global options such as<span class="Apple-converted-space">&nbsp;</span><code style="margin: 0px; font-size: 1.2em;">God.pid_file_directory{% endcodeblock %}<span class="Apple-converted-space">&nbsp;</span>blocks will be ignored (and produce a warning in the logs).</p>
</span></span></p>
<p><strong>2.show logs</strong></p>
<p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>[iceskysl@ws_api]#&nbsp;god&nbsp;log&nbsp;thin-thin-7514&nbsp;&nbsp;</span></span></li>
    <li class=""><span>I,&nbsp;[2009-04-28T08:24:16.705870&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;moved&nbsp;'up'&nbsp;to&nbsp;'up'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>I,&nbsp;[2009-04-28T08:24:16.706346&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;[trigger]&nbsp;process&nbsp;is&nbsp;not&nbsp;running&nbsp;(ProcessRunning)&nbsp;&nbsp;</span></li>
    <li class=""><span>I,&nbsp;[2009-04-28T08:24:16.888477&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;sent&nbsp;email&nbsp;to&nbsp;iceskysl@gmail.com&nbsp;(Email)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>I,&nbsp;[2009-04-28T08:24:16.888642&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;move&nbsp;'up'&nbsp;to&nbsp;'start'&nbsp;&nbsp;</span></li>
    <li class=""><span>I,&nbsp;[2009-04-28T08:24:16.888976&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;before_start:&nbsp;no&nbsp;pid&nbsp;file&nbsp;to&nbsp;delete&nbsp;(CleanPidFile)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>I,&nbsp;[2009-04-28T08:24:16.889109&nbsp;#23174]&nbsp;&nbsp;INFO&nbsp;--&nbsp;:&nbsp;thin-thin-7514&nbsp;start:&nbsp;thin&nbsp;start&nbsp;-C&nbsp;/data/www/web/current/config/thin.yml&nbsp;-o&nbsp;7514&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>resource links:</p>
<p><a href="http://god.rubyforge.org/">http://god.rubyforge.org/</a></p>
<p>&nbsp;</p>
