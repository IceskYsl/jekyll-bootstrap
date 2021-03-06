---
layout: post
title: 使用Merb处理Rails中大文件上传难题
date: '2008-8-29'
comments: true
categories: Ruby&Rails
link: true
---
做Rails的应该知道，在Rails中处理大文件上传是很头疼的事情，比如你允许用户上传图片，那么其有的时候分辨率高的文件有1-2M的大小，这个时候rails的上传处理是很慢的，也不难理解，看段经典的上传代码：
<div class="codeText">
<div class="codeHead">Rails代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">def</span><span> upload  </span></span></li>
	<li><span>  <span class="builtin">File</span><span>.open(RAILS_ROOT+"/uploads/</span><span class="comment">#{params[:file].original_filename}.#{next_count}”, “w”) { |f| f.write(params[:file].read) }</span><span>  </span></span></li>
	<li class="alt"><span>  render <span class="symbol">:action</span><span> =&gt; ‘index’  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
加上Rails是单线程的，这个时候处理大的IO非常慢，慢的后果是什么？拖死你的服务器，比如你使用mongrel，开了10个进程在跑，这个时候，用户上传一个文件要花2分钟，就会占着这个进程不放，导致其他的请求无法响应（好怀念weblogic的队列机制），所以你的系统抛给用户的可能就是503，504之类的错误。
有人推荐，这个情况下可以使用<a href="http://merbivore.com/index.html">merb</a>，这东西也不会很陌生，从rails大红大紫后，其一直在后面追赶，其基本特性就是线程安全的，所以对一个请求可以多线程处理，会加快处理速度，看段类似处理上传的代码：
<div class="codeText">
<div class="codeHead">Merb代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">def</span><span> upload  </span></span></li>
	<li><span>  FileUtils.mv params[<span class="symbol">:file</span><span>][</span><span class="symbol">:tempfile</span><span>].path, MERB_ROOT+”/uploads/</span><span class="comment">#{params[:file][:filename]}.#{next_count}”</span><span>  </span></span></li>
	<li class="alt"><span>  render <span class="symbol">:action</span><span> =&gt; ‘index’  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
详细的测试比较，请参考“<a href="http://www.mikeperham.com/2007/10/02/file-uploads-in-merb-versus-rails/">File Uploads in Merb versus Rails</a>”这里文章，其结论差不多是这样的“<em>Merb’s average response time is 16 ms while Rails’s average is 205 ms (over 10x faster), yet the throughput is 3000 vs 2000 req/min (only 50% greater).</em>”，针对其throughput提高不多的情况，merb的人给出的方案是add":use_mutex: false"in merb.yml，其原因说因为AR是非线程安全的才需要这个选项，设置成fasle后可以大大的提高性能。

<strong>参考文章：</strong>
<ul>
	<li><a href="http://www.mikeperham.com/2007/10/02/file-uploads-in-merb-versus-rails/">File Uploads in Merb versus Rails</a></li>
	<li><a href="http://rubyforge.org/pipermail/mongrel-users/2006-November/002265.html">[Mongrel] Uploading Large (100mb+) files</a></li>
	<li><a href="http://depixelate.com/2007/5/31/taking-merb-for-a-spin">Taking Merb for a Spin</a></li>
	<li><a href="http://devblog.rorcraft.com/2008/8/25/uploading-large-files-to-rails-with-merb">Uploading large files to Rails with Merb</a></li>
</ul>
