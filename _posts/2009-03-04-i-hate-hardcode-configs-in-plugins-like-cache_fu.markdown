--- 
layout: post
comments: true
title: I hate hardcode configs in plugins like cache_fu
date: 2009-3-4
link: false
categories: life
---
<p>I store user sessions in memcache,and then i want do share theres sessions with sub domains,but i notice some strange things when i put session&nbsp; into memcached,there are:<br />
1. In my older website(rails 2.0),It genenrated sessions key for memcached as #{namespace}-#{RAILS_ENV}:&quot;session:#{id}&quot;;<br />
2.In my newer website(reails 2.3),It generated seesions key for memcached just as &quot;#{namespace}:#{id}&quot;;<br />
<br />
so,i can not get the same seesion datas with diff session keys. i do have spend lots of&nbsp; time for sove this , i do have some userfull dis,<br />
<br />
1. In rails2.3 ,it's vendor memcache-client-1.5.0.5 in ruby\lib\ruby\gems\1.8\gems\activesupport-2.3.0\lib\active_support\vendor;<br />
2. you can config namespace in you environment.rb file like &quot;&nbsp; ActionController::Base.session_options[:namespace] = 'session'&quot;<br />
3. In rails2.0,when you use memcached,you will use cached_fu&nbsp; and act_as_cache plugins,and you may have a config file in your config dir named memcached.yml, and in this file,you can config defaults,production,test and developer..with lots of filed,like namespace,servers etc..<br />
4. you will notice it generate memcached key as mentioned above.<br />
<br />
I track it,and got this:</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;setup_memcache(config)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;config[<span class="symbol">:namespace</span><span>]&nbsp;&lt;&lt;&nbsp;</span><span class="string">&quot;-#{RAILS_ENV}&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;silence_warnings&nbsp;<span class="keyword">do</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="builtin">Object</span><span>.const_set&nbsp;:CACHE,&nbsp;memcache_klass.</span><span class="keyword">new</span><span>(config)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;CACHE.servers&nbsp;=&nbsp;<span class="builtin">Array</span><span>(config.delete(</span><span class="symbol">:servers</span><span>))&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;setup_session_store&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;config[</span><span class="symbol">:sessions</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;setup_fragment_store!&nbsp;<span class="keyword">if</span><span>&nbsp;config[</span><span class="symbol">:fragments</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;setup_fast_hash!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;config[</span><span class="symbol">:fast_hash</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;setup_fastest_hash!&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;config[</span><span class="symbol">:fastest_hash</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;CACHE&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>shit,it append RAILS_ENV to namespace with &quot;-&quot;,that's it...I hate some hardcode config in plugin,blalal....</p>
<p>some userfull link resources...</p>
<ul>
    <li><a href="http://errtheblog.com/posts/22-sessions-n-such">http://errtheblog.com/posts/22-sessions-n-such</a></li>
    <li><a href="http://www.raecoo.com/2008/10/25/rails-store-format-in-memcache/">http://www.raecoo.com/2008/10/25/rails-store-format-in-memcache/</a></li>
    <li><a href="http://www.scribd.com/doc/2203398/Scaling-Rails-with-memcached">http://www.scribd.com/doc/2203398/Scaling-Rails-with-memcached</a></li>
    <li><a href="http://railscasts.com/episodes/115-caching-in-rails-2-1">http://railscasts.com/episodes/115-caching-in-rails-2-1</a></li>
</ul>
