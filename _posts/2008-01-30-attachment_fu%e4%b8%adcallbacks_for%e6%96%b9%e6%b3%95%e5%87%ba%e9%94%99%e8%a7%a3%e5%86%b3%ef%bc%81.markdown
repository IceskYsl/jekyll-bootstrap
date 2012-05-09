--- 
layout: post
comments: true
title: !binary |
  YXR0YWNobWVudF9mdeS4rWNhbGxiYWNrc19mb3Lmlrnms5Xlh7rplJnop6Pl
  hrPvvIE=

date: 2008-1-30
link: false
categories: life
---
<p>前天晚上，把&lsquo;<a href="http://www.itechtag.com/">技能云</a>&rsquo;升级到<a href="http://iceskysl.1sters.com/?action=show&amp;id=201">Rails2.02</a>版本后，只是大概的测试了下功能，把发现的问题予以修复，但是由于时间比肩紧急，没能全部覆盖到，昨天发现了不少<a href="http://code.google.com/p/itechtag/issues/list?can=1&amp;q=&amp;colspec=ID+Type+Status+Priority+Milestone+Owner+Summary&amp;cells=tiles">遗留问题</a>，都陆续的解决了，只有一个使用attachment_fu上传用户头像的地方还有些问题，下面是具体的分析和过程。</p>
<p>
<div class="codeText">
<div class="codeHead">错误日志</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>Parameters:&nbsp;{&quot;commit&quot;=</span><span class="tag">&gt;</span><span>&quot;涓婁紶..&quot;,&nbsp;&quot;action&quot;=</span><span class="tag">&gt;</span><span>&quot;upload_user_pic&quot;,&nbsp;&quot;controller&quot;=</span><span class="tag">&gt;</span><span>&quot;user&quot;,&nbsp;&quot;asset&quot;=</span><span class="tag">&gt;</span><span>{&quot;uploaded_data&quot;=</span><span class="tag">&gt;</span><span>#</span><span class="tag">&lt;</span><span class="tag-name">ActionController::UploadedStringIO:0xb6435ee8</span><span class="tag">&gt;</span><span>,&nbsp;&quot;user_id&quot;=</span><span class="tag">&gt;</span><span>&quot;1&quot;}}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Error:undefined&nbsp;method&nbsp;`callbacks_for'&nbsp;for&nbsp;#<span class="tag">&lt;</span><span class="tag-name">Asset:0xb643149c</span><span class="tag">&gt;</span><span>銆傘&euro;?&nbsp;&nbsp;</span></span></li>
</ol>
</div>
从上面的作物日志可以看到，是调用<span>callbacks_for的时候出的问题，而我当时使用的</span>attachment_fu是比较老的版本，作者在后面更新过一次，于是：</p>
<p>1、首先更新版本，发现依然无法使用，还是类似的错误</p>
<p>2、在COR上<a href="http://chinaonrails.com/topic/view/1268.html">发个帖子</a>，大家都说自己的rmagick没有问题，奇怪的很。</p>
<p>3、Google下，找到有人遇到类似问题，如下：</p>
<ul>
    <li><a href="http://www.railsforum.com/viewtopic.php?pid=51607">attachment_fu: undefined method 'callbacks_for': updated</a></li>
    <li><a href="http://www.railsforum.ru/showthread.php?p=25">Побился attachment_fu</a></li>
</ul>
<p>而上面两个地址都给了另外一个页面的链接地址<a href="http://blog.methodmissing.com/2008/1/19/edge-callback-refactorings-attachment_fu/">&ldquo;Edge callback refactorings &amp;&amp; attachment_fu&quot;</a> ,看来找到问题了，在其页面上说到：
<div class="codeText">
<div class="codeHead">引用</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>Edge&nbsp;changeset&nbsp;8664&nbsp;introduces&nbsp;ActiveSupport::Callbacks.&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>This&nbsp;currently&nbsp;breaks&nbsp;attachment_fu's&nbsp;callback&nbsp;internals&nbsp;and&nbsp;may&nbsp;affect&nbsp;other&nbsp;plugins&nbsp;as&nbsp;well&nbsp;...&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>哦，原来是Rails中的改动影响了这个插件，
<div class="codeText">
<div class="codeHead">改动message说明</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>Extract&nbsp;ActiveSupport::Callbacks&nbsp;from&nbsp;Active&nbsp;Record,&nbsp;test&nbsp;case&nbsp;setup&nbsp;and&nbsp;teardown,&nbsp;and&nbsp;ActionController::Dispatcher.&nbsp;Closes&nbsp;#10727.&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>详细的你可以参考<a href="http://dev.rubyonrails.org/changeset/8664">这个页面</a>，我就不多说了，下面主要说说怎么解决。</p>
<p>按照上面给出的俄那个页面上的方法，做如下处理，将下面这段代码中的三个方法copy到attachment_fu中的attachment_fu.rb 中，覆盖其原来的<span><span>callback_with_args方法。</span></span></p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">module</span><span>&nbsp;Technoweenie&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">module</span><span>&nbsp;AttachmentFu&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">module</span><span>&nbsp;InstanceMethods&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">self</span><span>.included(&nbsp;base&nbsp;)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;base.define_callbacks&nbsp;*[<span class="symbol">:after_resize</span><span>,&nbsp;</span><span class="symbol">:after_attachment_saved</span><span>,&nbsp;</span><span class="symbol">:before_thumbnail_saved</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;callback_with_args(method,&nbsp;arg&nbsp;=&nbsp;</span><span class="keyword">self</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notify(method)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result&nbsp;=&nbsp;run_callbacks(method,&nbsp;{&nbsp;<span class="symbol">:object</span><span>&nbsp;=&gt;&nbsp;arg&nbsp;})&nbsp;{&nbsp;|result,&nbsp;object|&nbsp;result&nbsp;==&nbsp;</span><span class="keyword">false</span><span>&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;result&nbsp;!=&nbsp;</span><span class="keyword">false</span><span>&nbsp;&amp;&amp;&nbsp;respond_to_without_attributes?(method)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result&nbsp;=&nbsp;send(method)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;result&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;run_callbacks(kind,&nbsp;options&nbsp;=&nbsp;{},&nbsp;&amp;block)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.reverse_merge!(&nbsp;<span class="symbol">:object</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">self</span><span>&nbsp;)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;::ActiveSupport::Callbacks::Callback.run(<span class="keyword">self</span><span>.</span><span class="keyword">class</span><span>.send(</span><span class="string">&quot;#{kind}_callback_chain&quot;</span><span>),&nbsp;options[</span><span class="symbol">:object</span><span>],&nbsp;options,&nbsp;&amp;block)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
而后，需要确认下您的图片存放目录是可读写的，且其attachment_fu的申明需要指明图片处理器的名字，如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>has_attachment&nbsp;&nbsp;</span><span class="symbol">:storage</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:file_system</span><span>,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="symbol">:max_size</span><span>&nbsp;=&gt;&nbsp;1.megabytes,&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="symbol">:size</span><span>&nbsp;=&gt;&nbsp;1..1.megabyte,&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="symbol">:content_type</span><span>&nbsp;=&gt;&nbsp;&nbsp;</span><span class="symbol">:image</span><span>,&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="symbol">:processor</span><span>&nbsp;=&gt;&nbsp;:MiniMagick,&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="symbol">:thumbnails</span><span>&nbsp;=&gt;&nbsp;{&nbsp;</span><span class="symbol">:main</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'100x100&gt;'</span><span>,&nbsp;</span><span class="symbol">:thumb</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'60x60&gt;'</span><span>,&nbsp;</span><span class="symbol">:tiny</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'40x40&gt;'</span><span>&nbsp;},&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="symbol">:path_prefix</span><span>=&gt;</span><span class="string">'public/upload/user_pics'</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>其他应该就没什么问题了，到此完毕。</p>
