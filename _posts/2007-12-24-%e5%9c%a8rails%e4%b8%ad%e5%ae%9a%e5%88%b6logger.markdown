--- 
layout: post
comments: true
title: !binary |
  5ZyoUmFpbHPkuK3lrprliLZsb2dnZXI=

date: "2007-12-24"
link: false
categories: life
---
<p>需要定制一些log格式等，都说rails的log比较简单，但是其基本功能还是满足了的，例如如下技巧等。</p>
<p>控制日志文件大小，保留10个历史文件，文件大小最大为1024000字节：</p>
<div align="left">
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>logger&nbsp;=&nbsp;Logger.</span><span class="keyword">new</span><span>('foo.log',&nbsp;10,&nbsp;1024000)&nbsp; <br />
    </span></span></li>
</ol>
每日/星期/月一个日志文件<br />
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>logger&nbsp;=&nbsp;Logger.</span><span class="keyword">new</span><span>('foo.log',&nbsp;'daily')&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger&nbsp;=&nbsp;Logger.<span class="keyword">new</span><span>('foo.log',&nbsp;'weekly')&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>logger&nbsp;=&nbsp;Logger.<span class="keyword">new</span><span>('foo.log',&nbsp;'monthly')&nbsp; <br />
    </span></span></li>
</ol>
<span><span>而后就可以这么用了。<br />
</span></span>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>logger.fatal&nbsp;{&nbsp;</span><span class="string">&quot;Argument&nbsp;'foo'&nbsp;not&nbsp;given.&quot;</span><span>&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger.error&nbsp;<span class="string">&quot;Argument&nbsp;#{&nbsp;@foo&nbsp;}&nbsp;mismatch.&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>logger.info('initialize')&nbsp;{&nbsp;<span class="string">&quot;Initializing...&quot;</span><span>&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger.add(Logger::FATAL)&nbsp;{&nbsp;'Fatal&nbsp;error!'&nbsp;} <br />
    </span></li>
</ol>
<span><strong>其他：按日期来分开存储web日志文件和sql日志</strong><br />
</span>
<p><strong>1、简单做法</strong> <br />
首先，在log/目录下新建sql文件夹，sql文件夹用来保存sql日志 <br />
接着，修改config\environment.rb代码,需注意代码顺序。</p>
<p><span style="color: blue;">#web访问日志 <br />
RAILS_DEFAULT_LOGGER = Logger.new(&quot;#{RAILS_ROOT}/log/#{RAILS_ENV}_#{Date.today.to_s}.log&quot;, &quot;daily&quot;)</span></p>
<p>#rails的初始化 <br />
Rails::Initializer.run do |config| <br />
#... <br />
end</p>
<p>#sql日志 <br />
ActiveRecord::Base.logger = Logger.new(&quot;#{RAILS_ROOT}/log/sql/#{RAILS_ENV}_#{Date.today.to_s}.log&quot;, &quot;daily&quot;)</p>
<p>2、使用unix的cron做定时转存。</p>
</div>
