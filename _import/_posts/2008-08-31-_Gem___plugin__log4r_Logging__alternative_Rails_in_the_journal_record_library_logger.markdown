---
layout: post
title: ! '[Gem|plugin]log4r Logging: 替代Rails中logger的日志记录库'
date: '2008-8-31'
comments: true
categories: Ruby&Rails
link: true
---
Rail本身自带的<strong>logger</strong>虽然好用，但是还是有点太简易了，针对一些特殊的业务需求（比如需要记录一些业务日志供后续的报表系统分析、解析等）就显得有点力不从心了。这个时候可以找找其他的替代品。
<strong>1、log4r</strong>
做java的应该对这样的名字相当熟悉，大名鼎鼎的log4j在java的世界里非常流行和实用，看这个log4r的名字就可以感受到其强大的功能。
<blockquote><a href="http://log4r.sourceforge.net/index.html">Log4r</a> is a comprehensive and flexible logging library written in Ruby for use in Ruby programs. It features a hierarchical logging system of any number of levels, custom level names, logger inheritance, multiple output destinations, execution tracing, custom formatting, thread safteyness, XML and YAML configuration, and more.</blockquote>
但是截至到目前为止的其log4r-1.0.5版本中和Rails2的版本还存在一个冲突，详细的可以参考“<a href="http://dev.rubyonrails.org/ticket/3512">Ticket #3512</a>” (reopened defect)。
<blockquote>ActionView::TemplateError (Expected kind of Outputter, got NilClass) c:/ruby/lib/ruby/gems/1.8/gems/log4r-1.0.5/src/log4r/logger.rb:115:in `each' c:/ruby/lib/ruby/gems/1.8/gems/log4r-1.0.5/src/log4r/logger.rb:115:in `add' c:/ruby/lib/ruby/gems/1.8/gems/actionpack-1.11.2/lib/action_controller/benchmarking.rb:30:in `benchmark' c:/ruby/lib/ruby/gems/1.8/gems/actionpack-1.11.2/lib/action_view/partials.rb:57:in `render_partial' c:/ruby/lib/ruby/gems/1.8/gems/actionpack-1.11.2/lib/action_view/base.rb:230:in `render'</blockquote>
但是其从March 2004开始到现在都没人有维护和更新，看来需要寻找新的解决方案了。
<strong>2、Logging</strong>
<a href="http://logging.rubyforge.org/classes/Logging.html">Logging</a> is a flexible logging library for use in Ruby programs based on the design of Java‘s log4j library. It features a hierarchical logging system, custom level names, multiple output destinations per log event, custom formatting, and more.
关于Logging的详细API可以参考其doc文档，其详细的用法和注意事项，可以参考“<a href="http://wiki.rubyonrails.org/rails/pages/HowtoConfigureLogging">HowtoConfigureLogging</a>”，下面看个例子：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'logging'</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>logger = Logging::Logger[<span class="string">'example_logger'</span><span>]  </span></span></li>
	<li><span>logger.add_appenders(  </span></li>
	<li class="alt"><span>    Logging::Appender.stdout,  </span></li>
	<li><span>    Logging::Appenders::<span class="builtin">File</span><span>.</span><span class="keyword">new</span><span>(</span><span class="string">'example.log'</span><span>)  </span></span></li>
	<li class="alt"><span>)  </span></li>
	<li><span>logger.level = <span class="symbol">:info</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>logger.debug <span class="string">"this debug message will not be output by the logger"</span><span>  </span></span></li>
	<li class="alt"><span>logger.info <span class="string">"just some friendly advice"</span><span>  </span></span></li>
</ol>
</div>
<strong>参考文章：</strong>
http://wiki.rubyonrails.org/rails/pages/HowtoConfigureLogging
http://logging.rubyforge.org/
http://log4r.sourceforge.net/index.html
http://007surfing.com/index.php?hl=f5&amp;q=uggc%3A%2F%2Fapupenvyf.oybtfcbg.pbz%2F2007%2F04%2Fybt.ugzy
