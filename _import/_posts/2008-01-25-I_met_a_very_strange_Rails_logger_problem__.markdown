---
layout: post
title: 遇到一个很奇怪Rails logger的问题～
date: '2008-1-25'
comments: true
categories: Ruby&Rails
link: true
---
<p>最近<a href="http://www.itechtag.com/">技能云</a>遇到一个很奇怪的问题，每天凌晨的时候，转换日志的时候都会出现一些问题，导致应用程序无法访问，每次都是重启后才能恢复，相当怪异。</p>
<p>理了下，应该是从我使用backgroundrb任务队列以后开始的，原来是没有问题的，每天凌晨的时候会自动切换日志文件名称。</p>
<p>而我在<a href="http://iceskysl.1sters.com/?action=show&amp;id=194">backgroundrb</a>里面是定时的同步用户的Feeds用的，会调用相关的model中的方法解析RSS，入库等操作，自然这个过程中也是有日志的。</p>
<p>看到报的错误如下：</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
    <li class="alt"><span><span><strong>Logger::ShiftingError&nbsp;(Shifting&nbsp;failed.&nbsp;</strong>'/home/iceskysl/itechtag/config/../log/sql/production_2008-01-24.log.20080124'&nbsp;already&nbsp;exists.):&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/1.8/logger.rb:501:in&nbsp;`write'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/1.8/monitor.rb:238:in&nbsp;`synchronize'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/1.8/logger.rb:496:in&nbsp;`write'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/1.8/logger.rb:326:in&nbsp;`add'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/1.8/logger.rb:348:in&nbsp;`debug'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/abstract_adapter.rb:134:in&nbsp;`log_info'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/abstract_adapter.rb:127:in&nbsp;`log'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/mysql_adapter.rb:243:in&nbsp;`execute'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/mysql_adapter.rb:399:in&nbsp;`select'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/abstract/database_statements.rb:13:in&nbsp;`select_one'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/connection_adapters/abstract/database_statements.rb:19:in&nbsp;`select_value'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/calculations.rb:212:in&nbsp;`execute_simple_calculation'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/calculations.rb:121:in&nbsp;`calculate'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/calculations.rb:117:in&nbsp;`catch'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/calculations.rb:117:in&nbsp;`calculate'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/usr/lib/ruby/gems/1.8/gems/activerecord-1.15.3/lib/active_record/calculations.rb:45:in&nbsp;`count'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;/app/models/motto.rb:9:in&nbsp;`get_rand'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;/app/controllers/application.rb:35:in&nbsp;`get_rand_motto'&nbsp;&nbsp;</span></li>
</ol>
</div>
<p>看到的提示是<strong>&ldquo;Logger::ShiftingError (Shifting failed. '/home/iceskysl/itechtag</strong></p>
<p>&nbsp;</p>
<div id="1es3" class="ArwC7c ckChnd"><wbr></wbr><strong>/config/../log/sql/production</strong><wbr></wbr><strong>_2008-01-24.log.20080124' already exists.):&rdquo;<br />
</strong>看上去感觉是在1.25号凌晨的时候，将原来的日志改名为production_2008-01-24.log.20080124，而此时已经存在名字为&ldquo;production_2008-01-24.log.20080124&rdquo;的文件，导致改名失败的。<br />
但是这个&ldquo;production_2008-01-24.log.20080124&rdquo;是哪里来的呢？backgroundrb应该是没有进行改名操作的。<br />
<br />
于是乎开始google，找到有类似问题的文章如下：<br />
1、<a href="http://blog.zmok.net/articles/2007/02/14/rails-application-does-not-working-no-error-displayed-just-error-code-500">Rails application not working, no error displayed, just error code 500</a><br />
错误基本上是一样的，但是这个文章没有仔细说是什么原因，只说了：<br />
<blockquote>  And the problem was almost solved - problem with log rotation.  <br />
So, if you face the same problem, try to perform few operations in your rails console... and if you are lucky, you will find the bug.<br />
</blockquote>也就是说是日志rotation的时候的问题。<br />
2、<a href="http://maintainable.com/articles/rails_logging_tips">Rails Logging Tips</a><br />
这篇文章说了一些Rails中使用logger的技巧，没有说到这个问题，只是让我更清楚logg的机制。<br />
3、<a href="http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/147782">Strange logger rotation failure</a><br />
这个邮件列表说了基本上类似的问题，他的原因是由于配置了多个cronb，而导致的，说的比较详细。<br />
<br />
以上只是我的分析过程，而我遇到的这个问题，还有待进一步的分析和排查，有后续进展再补充。<br />
如果有遇到类似问题的朋友，还请指教一二，别让我重复造轮子，谢谢！</div>
