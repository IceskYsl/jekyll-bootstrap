--- 
layout: post
comments: true
title: "Rails: How to use helper inside a controller & model"
date: 2008-7-10
link: false
categories: life
---
前几天一个朋友问我如何在Controller中使用helper，我当时说helper是view层的东西，C层没法使用，当时有点忙，虽然知道这个说法也过得去，但是一棍子打死的说法肯定不对。

今天另外一个朋友问我如何在Model里面使用helper，我开始也说没法使用，并说以前我都是直接在model里面在copy一遍helper的东西。然后还是觉得应该是可以使用的，于是google到一篇tips，但是其访问不了了，还好使用google caceh还是看到了其内容，现在记录如下：

This is an easy to <strong style="color: black; background-color: #ffff66;">use</strong> any helpers that rails provides in any other place besides views and view helpers
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># create a new file inside lib/ and call it helpers.rb</span><span>  </span></span></li>
	<li><span><span class="comment"># paste the following:</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="keyword">def</span><span> help  </span></span></li>
	<li class="alt"><span>    Helper.instance  </span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>   </span></li>
	<li><span><span class="keyword">class</span><span> Helper  </span></span></li>
	<li class="alt"><span>    include Singleton  </span></li>
	<li><span>    <span class="comment"># look inside ActionView::Helpers to include any other helpers that you might need</span><span>  </span></span></li>
	<li class="alt"><span>    include ActionView::Helpers::DateHelper  </span></li>
	<li><span>    include ActionView::Helpers::TextHelper  </span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
	<li><span>   </span></li>
	<li class="alt"><span><span class="comment"># then in any model or controller:</span><span>  </span></span></li>
	<li><span>require <span class="string">'lib/helpers'</span><span>  </span></span></li>
	<li class="alt"><span>   </span></li>
	<li><span><span class="comment"># to use:</span><span>  </span></span></li>
	<li class="alt"><span><span class="comment"># help.name_of_helper</span><span>  </span></span></li>
	<li><span><span class="comment"># EX: help.pluralize 10, "person"</span><span>  </span></span></li>
</ol>
</div>
然后又找到一篇类似的文档：http://snippets.dzone.com/posts/show/1799，摘个方法如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">def</span><span> check_for_max_donkeys  </span></span></li>
	<li><span>  <span class="keyword">if</span><span> Donkey.find_fit_donkeys.size == APP_SETTINGS[</span><span class="string">'max_fit_donkeys'</span><span>]  </span></span></li>
	<li class="alt"><span>    flash_error <span class="string">"The maximum of #{help.pluralize(APP_SETTINGS['max_fit_donkeys'], 'donkey')} has been reached."</span><span>  </span></span></li>
	<li><span>    redirect_to_index  </span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
PS：Don't use the method name "helper" because Rails already uses that. Just "help" works fine.
