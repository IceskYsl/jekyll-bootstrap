---
layout: post
title: 在attachment_fu中通过URL上传文件
date: '2008-10-25'
comments: true
categories: Ruby&Rails
link: true
---
<p><a href="http://github.com/technoweenie/attachment_fu/wikis">attachment_fu</a>很多人都使用过吧，使用其上传文件非常方便（<a href="http://almosteffortless.com/2007/03/25/working-with-attachment_fu/">super easy</a>），但是有没有想过通过URL来上传文件呢，比如网上的一张图片，一首歌曲等。</p>
<p>按照平时的思路，我们需要下载到本地，保存到硬盘上，打开上传页面，浏览硬盘找到要上传的文件，点击上传，看，多麻烦，是吧！如果可以实现通过URL上传，那么其过程就异常简单了，输入URL，点击上传即可。</p>
<p>已经有人提供了思路，也非常简单，多加个url属性即可，C的代码不用修改，举例如下：</p>
<p>&nbsp;</p>
<div class="codeText">
<div class="codeHead"># app/models/upload.rb</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="comment">#&nbsp;app/models/upload.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;Upload&nbsp;&lt;&nbsp;ActiveRecord::Base&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="comment">#&nbsp;...normal&nbsp;attachment_fu&nbsp;code&nbsp;(has_attachment,&nbsp;etc)...</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="comment">#&nbsp;allow&nbsp;uploads&nbsp;via&nbsp;URL</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;require&nbsp;<span class="string">'open-uri'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;attr_reader&nbsp;<span class="symbol">:url</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;url=(uri)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span><span>&nbsp;</span><span class="keyword">nil</span><span>&nbsp;</span><span class="keyword">if</span><span>&nbsp;uri.blank?&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;io&nbsp;=&nbsp;(open(URI.parse(uri))&nbsp;<span class="keyword">rescue</span><span>&nbsp;</span><span class="keyword">return</span><span>&nbsp;</span><span class="keyword">nil</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;(<span class="keyword">class</span><span>&nbsp;&lt;&lt;&nbsp;io;&nbsp;</span><span class="keyword">self</span><span>;&nbsp;</span><span class="keyword">end</span><span>;).class_eval&nbsp;</span><span class="keyword">do</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">define_method</span><span>(</span><span class="symbol">:original_filename</span><span>)&nbsp;{&nbsp;base_uri.path.split(</span><span class="string">'/'</span><span>).last&nbsp;}&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">self</span><span>.uploaded_data&nbsp;=&nbsp;io&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="comment">#&nbsp;app/controllers/uploads_controller.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">class</span><span>&nbsp;UploadsController&nbsp;&lt;&nbsp;ApplicationController&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="comment">#&nbsp;avoid&nbsp;raising&nbsp;exceptions&nbsp;for&nbsp;common&nbsp;errors&nbsp;(e.g.&nbsp;file&nbsp;not&nbsp;found)</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;rescue_from&nbsp;Errno::ENOENT,&nbsp;<span class="symbol">:with</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:url_upload_not_found</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;rescue_from&nbsp;Errno::ETIMEDOUT,&nbsp;<span class="symbol">:with</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:url_upload_not_found</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;rescue_from&nbsp;OpenURI::HTTPError,&nbsp;<span class="symbol">:with</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:url_upload_not_found</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;rescue_from&nbsp;Timeout::Error,&nbsp;<span class="symbol">:with</span><span>&nbsp;=&gt;&nbsp;</span><span class="symbol">:url_upload_not_found</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;</span><span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">@upload</span><span>&nbsp;=&nbsp;Upload.</span><span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;create&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="variable">@upload</span><span>&nbsp;=&nbsp;current_user.uploads.build(params[</span><span class="symbol">:upload</span><span>])&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;</span><span class="variable">@upload</span><span>.save&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirect_to&nbsp;files_path&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;render&nbsp;<span class="symbol">:action</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;new&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">def</span><span>&nbsp;url_upload_not_found&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;flash[<span class="symbol">:notice</span><span>]&nbsp;=&nbsp;</span><span class="string">&quot;Sorry,&nbsp;the&nbsp;URL&nbsp;you&nbsp;provided&nbsp;was&nbsp;not&nbsp;valid.&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;redirect_to&nbsp;new_upload_path&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
    <li class="alt"><span><span class="comment">#&nbsp;app/views/uploads/new.html.erb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&lt;%=&nbsp;error_messages_for&nbsp;<span class="symbol">:upload</span><span>&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&lt;%&nbsp;form_for&nbsp;<span class="variable">@upload</span><span>,&nbsp;</span><span class="symbol">:html</span><span>&nbsp;=&gt;&nbsp;{&nbsp;</span><span class="symbol">:multipart</span><span>&nbsp;=&gt;&nbsp;</span><span class="keyword">true</span><span>&nbsp;}&nbsp;</span><span class="keyword">do</span><span>&nbsp;|f|&nbsp;-%&gt;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&lt;%=&nbsp;f.file_field&nbsp;<span class="symbol">:uploaded_data</span><span>&nbsp;</span><span class="comment">#&nbsp;normal&nbsp;upload,&nbsp;or...&nbsp;%&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&lt;%=&nbsp;f.text_field&nbsp;<span class="symbol">:url</span><span>&nbsp;</span><span class="comment">#&nbsp;upload&nbsp;via&nbsp;url&nbsp;%&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&lt;%=&nbsp;submit_tag&nbsp;<span class="string">&quot;Upload&quot;</span><span>,&nbsp;</span><span class="symbol">:disable_with</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">&quot;Upload&quot;</span><span>&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&lt;%&nbsp;<span class="keyword">end</span><span>&nbsp;%&gt;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<p>发现这个人还真勤快，写了代码<a href="http://github.com/trevorturk/el-dorado/tree/master">El Dorado</a>.还做了视频演示；</p>
<p>&nbsp;</p>
<p><object width="400" height="300">	<param name="allowfullscreen" value="true" />	<param name="allowscriptaccess" value="always" />	<param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=2060363&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" />	<embed src="http://vimeo.com/moogaloop.swf?clip_id=2060363&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object><br />
<a href="http://vimeo.com/2060363?pg=embed&amp;sec=2060363">Easy Upload via URL with attachment_fu</a> from <a href="http://vimeo.com/user850172?pg=embed&amp;sec=2060363">Trevor Turk</a> on <a href="http://vimeo.com?pg=embed&amp;sec=2060363">Vimeo</a>.</p>
