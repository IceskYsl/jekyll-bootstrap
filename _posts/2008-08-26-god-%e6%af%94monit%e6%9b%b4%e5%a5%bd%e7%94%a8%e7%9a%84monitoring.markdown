--- 
layout: post
comments: true
title: !binary |
  R29kOiDmr5RNb25pdOabtOWlveeUqOeahG1vbml0b3Jpbmc=

date: 2008-8-26
link: false
categories: life
---
<a href="http://god.rubyforge.org/">God</a>是一个使用Ruby写成的用于监视任务运行状态的可扩展框架，它的配置脚本采用Ruby来编写。因此，比起它的前辈<a href="http://www.tildeslash.com/monit/">Monit</a>，God更为简单，灵活且易于扩展（尤其对于Ruby使用者），你可以很轻易的添加一些自定义规则。
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>MINIONS = [  </span></span></li>
	<li><span>  { <span class="symbol">:rails_root</span><span> =&gt; </span><span class="string">"/home/mycoolapp/staging/current"</span><span>,  </span></span></li>
	<li class="alt"><span>    <span class="symbol">:mongrel_ports</span><span> =&gt; [4001,4002,4003,4004,4005],  </span></span></li>
	<li><span>    <span class="symbol">:uid</span><span> =&gt; </span><span class="string">'mycoolapp'</span><span>,  </span></span></li>
	<li class="alt"><span>    <span class="symbol">:gid</span><span> =&gt; </span><span class="string">'mycoolapp'</span><span>,  </span></span></li>
	<li><span>    <span class="symbol">:pid_path</span><span> =&gt; </span><span class="string">'/home/mycoolapp/staging/shared/tmp/pids'</span><span> }  </span></span></li>
	<li class="alt"><span>]  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>MINIONS.<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |minion|  </span></span></li>
	<li><span>  minion[<span class="symbol">:mongrel_ports</span><span>].</span><span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |port|  </span></span></li>
	<li class="alt"><span>    God.watch <span class="keyword">do</span><span> |w|  </span></span></li>
	<li><span>      w.name = <span class="string">"mongrel-#{port}"</span><span>  </span></span></li>
	<li class="alt"><span>      w.uid = minion[<span class="symbol">:uid</span><span>]  </span></span></li>
	<li><span>      w.gid = minion[<span class="symbol">:gid</span><span>]  </span></span></li>
	<li class="alt"><span>      w.interval = 30.seconds <span class="comment"># default      </span><span>  </span></span></li>
	<li><span>      w.start = <span class="string">"mongrel_rails start -c #{minion[:rails_root]} -p #{port} \</span> </span></li>
	<li class="alt"><span><span class="string">        -P #{minion[:pid_path]}/mongrel.#{port}.pid -e production -d"</span><span>  </span></span></li>
	<li><span>      w.stop = <span class="string">"mongrel_rails stop -P #{minion[:pid_path]}/mongrel.#{port}.pid"</span><span>  </span></span></li>
	<li class="alt"><span>      w.restart = <span class="string">"mongrel_rails restart -P #{minion[:pid_path]}/mongrel.#{port}.pid"</span><span>  </span></span></li>
	<li><span>      w.start_grace = 10.seconds  </span></li>
	<li class="alt"><span>      w.restart_grace = 10.seconds  </span></li>
	<li><span>      w.pid_file = <span class="string">"#{minion[:pid_path]}/mongrel.#{port}.pid"</span><span>  </span></span></li>
	<li class="alt"><span>      </span></li>
	<li><span>      w.behavior(<span class="symbol">:clean_pid_file</span><span>)  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>      w.start_if <span class="keyword">do</span><span> |start|  </span></span></li>
	<li class="alt"><span>        start.condition(<span class="symbol">:process_running</span><span>) </span><span class="keyword">do</span><span> |c|  </span></span></li>
	<li><span>          c.interval = 5.seconds  </span></li>
	<li class="alt"><span>          c.running = <span class="keyword">false</span><span>  </span></span></li>
	<li><span>        <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>      <span class="keyword">end</span><span>  </span></span></li>
	<li><span>      </span></li>
	<li class="alt"><span>      w.restart_if <span class="keyword">do</span><span> |restart|  </span></span></li>
	<li><span>        restart.condition(<span class="symbol">:memory_usage</span><span>) </span><span class="keyword">do</span><span> |c|  </span></span></li>
	<li class="alt"><span>          c.above = 150.megabytes  </span></li>
	<li><span>          c.times = [3, 5] <span class="comment"># 3 out of 5 intervals</span><span>  </span></span></li>
	<li class="alt"><span>        <span class="keyword">end</span><span>  </span></span></li>
	<li><span>      </span></li>
	<li class="alt"><span>        restart.condition(<span class="symbol">:cpu_usage</span><span>) </span><span class="keyword">do</span><span> |c|  </span></span></li>
	<li><span>          c.above = 50.percent  </span></li>
	<li class="alt"><span>          c.times = 5  </span></li>
	<li><span>        <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>      <span class="keyword">end</span><span>  </span></span></li>
	<li><span>      </span></li>
	<li class="alt"><span>      <span class="comment"># lifecycle</span><span>  </span></span></li>
	<li><span>      w.lifecycle <span class="keyword">do</span><span> |on|  </span></span></li>
	<li class="alt"><span>        on.condition(<span class="symbol">:flapping</span><span>) </span><span class="keyword">do</span><span> |c|  </span></span></li>
	<li><span>          c.to_state = [<span class="symbol">:start</span><span>, </span><span class="symbol">:restart</span><span>]  </span></span></li>
	<li class="alt"><span>          c.times = 5  </span></li>
	<li><span>          c.within = 5.minute  </span></li>
	<li class="alt"><span>          c.transition = <span class="symbol">:unmonitored</span><span>  </span></span></li>
	<li><span>          c.retry_in = 10.minutes  </span></li>
	<li class="alt"><span>          c.retry_times = 5  </span></li>
	<li><span>          c.retry_within = 2.hours  </span></li>
	<li class="alt"><span>        <span class="keyword">end</span><span>  </span></span></li>
	<li><span>      <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
要了解更多资料，请参考如下文档:
http://god.rubyforge.org/
http://ihower.idv.tw/blog/archives/1762
http://ezinearticles.com/?Why-Rails-Developers-Need-God&amp;id=845672
http://www.letrails.cn/archives/46
