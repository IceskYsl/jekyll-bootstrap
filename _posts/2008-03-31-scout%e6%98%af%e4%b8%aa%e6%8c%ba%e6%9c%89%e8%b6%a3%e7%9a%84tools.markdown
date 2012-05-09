--- 
layout: post
comments: true
title: !binary |
  U2NvdXTmmK/kuKrmjLrmnInotqPnmoR0b29scw==

date: 2008-3-31
link: false
categories: life
---
<p>Scout是Highgroove Studios写的一个很有趣的应用，他提供了一个大的框架，使得其他人可以以插件（集成）的方式实现他的方法（run），进而按照他预定的格式，将采集到的数据发送到其中央服务器，进而可以存储，并以报表的形式展示出来。</p>
<p>我大概了看了下起实现方式，和插件的编写方式，其实也挺简单的，其原理也就是在*unix上可以采用crob之类的做定时调度，采集数据（可以使用系统的一些命令，比如ps,top)等等，再把数据组合成他预定义的格式就可以了。</p>
<p>看个插件的代码以及我的注释，就很清楚了：</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;TODO:&nbsp;use&nbsp;alternate&nbsp;process&nbsp;open&nbsp;to&nbsp;catch&nbsp;STDOUT,&nbsp;STDERR&nbsp;for&nbsp;those&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#&nbsp;processes&nbsp;that&nbsp;use</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="comment">#分析:&nbsp;IceskYsl@1sters!(http://iceskysl.1sters.com)</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#这个插件实现的是，定时监控指定的进程，需要的时候重启，并生成报告</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;KeepProcessRunning&nbsp;&lt;&nbsp;Scout::Plugin&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;run&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#预定义返回的数据格式</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;report&nbsp;=&nbsp;{<span class="symbol">:report</span><span>&nbsp;=&gt;&nbsp;{},&nbsp;</span><span class="symbol">:alerts</span><span>&nbsp;=&gt;&nbsp;[],&nbsp;</span><span class="symbol">:memory</span><span>&nbsp;=&gt;&nbsp;{}}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#取需要监控的进程的名字和重启进程的命令</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;process_to_monitor&nbsp;=&nbsp;<span class="variable">@options</span><span>[</span><span class="symbol">:process_name</span><span>]&nbsp;||&nbsp;</span><span class="string">&quot;&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;restart_action&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="variable">@options</span><span>[</span><span class="symbol">:restart_action</span><span>]&nbsp;||&nbsp;process_to_monitor&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#&nbsp;Search&nbsp;all&nbsp;running&nbsp;processes&nbsp;for&nbsp;the&nbsp;process&nbsp;(do&nbsp;not&nbsp;match&nbsp;the&nbsp;grep&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#&nbsp;process&nbsp;nor&nbsp;the&nbsp;locally&nbsp;running&nbsp;scout&nbsp;client).</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#这就是调用系统的ps命令，并grep，看是否有指定的进程存在</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;ps_output&nbsp;=&nbsp;`ps&nbsp;auxww&nbsp;|&nbsp;grep&nbsp;<span class="string">&quot;#{process_to_monitor}&quot;</span><span>&nbsp;|&nbsp;grep&nbsp;-v&nbsp;</span><span class="string">&quot;grep&quot;</span><span>&nbsp;|&nbsp;grep&nbsp;-v&nbsp;</span><span class="string">&quot;scout&quot;</span><span>`&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#如果不存在，则根据上面给的重启命令来重启</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">unless</span><span>&nbsp;process_match&nbsp;=&nbsp;ps_output.to_a.first&nbsp;&nbsp;</span><span class="comment">#&nbsp;process&nbsp;not&nbsp;found</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#&nbsp;attempt&nbsp;to&nbsp;restart&nbsp;the&nbsp;process</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart_output&nbsp;=&nbsp;`<span class="comment">#{restart_action}`</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;report[<span class="symbol">:alerts</span><span>]&nbsp;&lt;&lt;&nbsp;{</span><span class="symbol">:subject</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;#{process_to_monitor}&nbsp;is&nbsp;not&nbsp;running.&nbsp;Restart&nbsp;reported:&nbsp;#{restart_output}&quot;</span><span>}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;</span><span class="comment">#&nbsp;process&nbsp;is&nbsp;running</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#&nbsp;if&nbsp;we&nbsp;wanted&nbsp;to&nbsp;parse&nbsp;fields&nbsp;we&nbsp;could:</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#&nbsp;fields&nbsp;=&nbsp;process_match.downcase.split</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;report[<span class="symbol">:report</span><span>][process_to_monitor]&nbsp;=&nbsp;1&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment">#返回报告</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;report&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">rescue</span><span>&nbsp;</span><span class="builtin">Exception</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;<span class="symbol">:error</span><span>&nbsp;=&gt;&nbsp;{&nbsp;</span><span class="symbol">:subject</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;Could&nbsp;not&nbsp;keep&nbsp;the&nbsp;process&nbsp;running.&quot;</span><span>,&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:body</span><span>&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;</span><span class="string">&quot;An&nbsp;exception&nbsp;was&nbsp;thrown:&nbsp;&nbsp;#{$!.message}&quot;</span><span>&nbsp;}&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>他采取的&ldquo;Client Key&rdquo;来做唯一性校验，也就是说，你必须获得这个&ldquo;Client Key&rdquo;，而这个将来可以成为其卖点（可行的方法是分级售卖，比如多少钱的帐号可以监控几个服务器之类的）。</p>
<p>仔细一想，这个Idea还真不赖，呵呵～</p>
<p><strong>其他的参考资料：</strong></p>
<p>1、Scout主页：http://scoutapp.com/</p>
<p>2、插件编写手册：http://scoutapp.com/plugin_urls/static/creating_a_plugin</p>
<p>3、rubyinside的报道：http://www.rubyinside.com/scout-a-ruby-powered-web-monitoring-and-reporting-service-825.html</p>
