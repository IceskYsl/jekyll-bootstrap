---
layout: post
title: 在rails中实现跟踪记录每个用户的最近十条记录
date: '2007-7-4'
comments: true
categories: Ruby&Rails
link: true
---
有的时候，你可能想显示给每个用户他最近浏览的页面，这个时候的一个很自然的想法就是使用数据库来存放，但是这样如果你的用户足够的多，而且页面的读取数据库又很频繁的话，就会对性能造成很大的影响，换个思路，我们可以在session里面存取，示范代码如下：&lt;code&gt;class ApplicationController &lt; ActionController::Base	before_filter :add_to_history	before_filter :page_title	###def add_to_history    session[:history] ||= []##    if File.exists?(&quot;#{RAILS_ROOT}/app/views/#{self.controller_name}/#{self.action_name}.rhtml&quot;) &amp;&amp; session[:history].empty? || session[:history].first['uri'] != @request.request_uri        session[:history].unshift({ 'uri' =&gt; @request.request_uri, 'name' =&gt; page_title })        session[:history].pop while session[:history].length &gt; 11    endend######## This bit came from Peter Cooper's snippets source and was moved into the application controller:###	def page_title		case self.controller_name			when 'tag' 				title = &quot;Tags &amp;raquo; &quot; + @params[:tags].join(&quot; &amp;gt; &quot;)			when 'user'				title = &quot;Users &amp;raquo; #{@params[:user]}&quot;	 			when 'features'					case self.action_name						when 'show' then title = &quot;Feature &amp;raquo; #{Feature.find(@params[:id]).title}&quot;						else title = APP_CONFIG[&quot;default_title&quot;]					end			else 				title = APP_CONFIG[&quot;default_title&quot;] + self.controller_name + &quot;:&quot; + self.action_name		end	end	helper_method :page_title###...end&lt;/code&gt;然后在页面上就可以这样显示了：&lt;code&gt;&lt;h4&gt;User History&lt;/h4&gt;&lt;% for cur in session[:history][0..9] -%&gt;  &lt;p&gt;&lt;a href=&quot;&lt;%= cur[&quot;url&quot;] %&gt;&quot;&gt;&lt;%= cur[&quot;name&quot;] %&gt;&lt;/a&gt;&lt;/p&gt;&lt;% end -%&gt;&lt;/code&gt;
