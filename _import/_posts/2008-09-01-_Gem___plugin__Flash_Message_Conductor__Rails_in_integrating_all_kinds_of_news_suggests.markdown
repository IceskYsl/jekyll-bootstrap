---
layout: post
title: ! '[Gem|plugin]Flash Message Conductor :在Rails中整合各类消息提示'
date: '2008-9-1'
comments: true
categories: Ruby&Rails
link: true
---
Rails中特有的falsh消息提示机制非常好用，其三种消息（error，message，notice）针对不同的应用场景提示用户，非常方便。
但是由于其三种消息提示的含义不一样，UI制作人员经常会使用不同的CSS来展示（比如error的就用红色，notice就用黄色等等），这样就存在一个问题，当在一个共用页面上需要展示几种可能的消息时，就不是很好处理，这个时候，对通用型的UI是个挑战。

如果能把三种消息自动区分，使用各种的样式表，该多方便！确实，已经有人这么做了， <a href="http://www.robbyonrails.com/articles/2008/08/29/flash-message-conductor">Robby</a>给出了一个plugin，“<a href="http://github.com/planetargon/flash-message-conductor/tree/master">Flash Message Conductor</a>”，看其介绍：
{% codeblock %}A simple pattern for managing flash messages in your Ruby on Rails application.

<strong>1、安装</strong>script/plugin install git://github.com/planetargon/flash-message-conductor.git<strong>2、使用</strong>{% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># Controller helpers</span><span>  </span></span></li>
	<li><span>add_message( <span class="string">'foo'</span><span> )  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>is the equivalent of  </span></li>
	<li class="alt"><span>flash[<span class="symbol">:message</span><span>] = </span><span class="string">'foo'</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Controller helpers included:  </span></li>
	<li><span>add_message( message )   </span></li>
	<li class="alt"><span>add_notice( message )  </span></li>
	<li><span>add_error( message )  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="comment"># View helpers</span><span>  </span></span></li>
	<li class="alt"><span>&lt;%= render_flash_messages %&gt;  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>produces:  </span></li>
	<li><span>&lt;div id=<span class="string">"flash_messages"</span><span>&gt;  </span></span></li>
	<li class="alt"><span>  &lt;p <span class="keyword">class</span><span>=</span><span class="string">"message"</span><span>&gt;You have successfully done XYZ...&lt;/p&gt;  </span></span></li>
	<li><span>&lt;/div&gt;  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="comment"># or... if you set an error</span><span>  </span></span></li>
	<li class="alt"><span>&lt;div id=<span class="string">"flash_messages"</span><span>&gt;  </span></span></li>
	<li><span>  &lt;p <span class="keyword">class</span><span>=</span><span class="string">"error"</span><span>&gt;Oops! Something went bonkers!&lt;/p&gt;  </span></span></li>
	<li class="alt"><span>&lt;/div&gt;  </span></li>
</ol>
</div>
{% codeblock %}
详细信息，参考上面给出的Github上的地址查看，谢谢！{% endcodeblock %}
