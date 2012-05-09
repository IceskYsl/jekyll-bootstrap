--- 
layout: post
comments: true
title: YAML Configuration File
date: "2007-12-28"
link: false
categories: life
---
<p>&nbsp;</p>
<p>Application configuration shouldn't be spread throughout your code base. Instead a much better place to put it is an external YAML file. See how to do that in this episode.</p>
<div class="CodeRay">
<div class="code">
{% codeblock %}<span class="c">[code]<br /># config/initializers/load_config.rb</span><br /><span class="co">APP_CONFIG</span> = <span class="co">YAML</span>.load_file(<span class="s"><span class="dl">&quot;</span><span class="il"><span class="idl">#{</span><span class="co">RAILS_ROOT</span><span class="idl">}</span></span><span class="k">/config/config.yml</span><span class="dl">&quot;</span></span>)[<span class="co">RAILS_ENV</span>]<br /><br /><span class="c"># application.rb</span><br /><span class="r">def</span> <span class="fu">authenticate</span><br />  <span class="r">if</span> <span class="co">APP_CONFIG</span>[<span class="s"><span class="dl">'</span><span class="k">perform_authentication</span><span class="dl">'</span></span>]<br />    authenticate_or_request_with_http_basic <span class="r">do</span> |username, password|<br />      username == <span class="co">APP_CONFIG</span>[<span class="s"><span class="dl">'</span><span class="k">username</span><span class="dl">'</span></span>] &amp;&amp; password == <span class="co">APP_CONFIG</span>[<span class="s"><span class="dl">'</span><span class="k">password</span><span class="dl">'</span></span>]<br />    <span class="r">end</span><br />  <span class="r">end</span><br /><span class="r">end<br /></span><span class="c">[/code]</span><br /><span class="r">---<br /></span><span class="c">[code]</span><br /># config/config.yml<br />development:<br />  perform_authentication: false<br /><br />test:<br />  perform_authentication: false<br /><br />production:<br />  perform_authentication: true<br />  username: admin<br />  password: secret<br /><span class="c">[/code]</span><br />来源：http://railscasts.com/episodes/85{% endcodeblock %}
</div>
</div>
