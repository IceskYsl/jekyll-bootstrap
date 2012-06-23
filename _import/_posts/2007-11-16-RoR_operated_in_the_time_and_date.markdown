---
layout: post
title: RoR中操作时间和日期
date: '2007-11-16'
comments: true
categories: Ruby&Rails
link: true
---
<p>time = Date.today<br />
<br />
puts &quot;Date.today:&quot; + time.to_s<br />
<br />
puts &quot;----&quot;*20<br />
puts&nbsp;&nbsp; &quot;time.cwday():&quot; + time.cwday().to_s&nbsp;&nbsp; <br />
puts&nbsp;&nbsp; &quot;time.cweek():&quot; + time.cweek().to_s&nbsp;&nbsp; <br />
puts&nbsp;&nbsp; &quot;time.cwyear():&quot; + time.cwyear().to_s&nbsp;&nbsp; <br />
puts&nbsp;&nbsp; &quot;time.mon() :&quot; + time.mon().to_s&nbsp;&nbsp; <br />
puts&nbsp;&nbsp; &quot;time.day():&quot; + time.day().to_s&nbsp;&nbsp; <br />
puts &quot;----&quot;*20<br />
<br />
===<br />
selected_mon = params[:mon].to_date.mon()<br />
@tasks = Task.find(:all, :conditions =&gt;[ &quot;MONTH(created_at) = ?&quot;,selected_mon])&nbsp;</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;File&nbsp;src/rails-1.2.3/activesupport/lib/active_support/core_ext/string/conversions.rb,&nbsp;line&nbsp;13</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;to_date&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::Date.<span class="keyword">new</span><span>(*ParseDate.parsedate(</span><span class="keyword">self</span><span>)[0..2])&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
</p>
<p>&nbsp;参考：http://fanqiang.chinaunix.net/a2/b1/20010705/150000802.html</p>
