--- 
layout: post
comments: true
title: !binary |
  5ZyoUmFpbHPkuK3pm4bmiJBOZ2lueCB1cGxvYWQgbW9kdWxl6Kej5Yaz5LiK
  5Lyg5aSn5paH5Lu26Zq+6aKY

date: "2008-11-29"
link: false
categories: life
---
<p>做web开发的都知道用户上传大文件（比如照片，MP3等）需求有如下难题：<br />
<strong>1、文件的存储 </strong>-这个不难，买个NAS，规划好目录结构，在mount下就可以了；</p>
<p><strong>2、上传速度&nbsp;</strong> --这个问题受限与用户带宽、服务器带宽以及服务器的处理时间，用户带宽无法控制，服务器端的带宽需要监控下，只要未达到上限，也不存在问题；还存在的一个问题就是服务器的处理。</p>
<p><strong>3、服务端处理</strong> --这个处理包括请求的接收，文件的校验、存放等，如果文件比较大，在Rails中或许就存在一些问题，请求到web服务器，如<a href="http://www.nginx.ru/">Nginx</a>后，达到其设定的缓存大小就发给后端的Rails，这样就会占一个链接直到处理完毕，而后端的thin或者其他的app服务器一共就那么点并发，导致上传比较频繁的时候，压力很大。</p>
<p>一个比较不错的解决方案是使用Nginx的<a href="http://www.grid.net.ru/nginx/upload.en.html">upload module</a>，其用C编写的，其处理完上传后，将文件存在在设定的临时目录中，然后将文件路径和你设定的一次哦参数透传给后端的Rails；再用Rails处理一些基本的信息，返回处理结果就可以了，如此一个请求的处理时间也就10ms的样子，开2个thin就可以承受很大的压力了。</p>
<p>这个实现还是挺简单，需要注意的upload module非默认的Nginx的module，需要另外下载和编译进去，另外还要注意文件存放的临时文件名可能出现同名的现象，在存取的时候需要留意下。</p>
<p>
<div class="codeText">
<div class="codeHead">Example configuration</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>server&nbsp;{&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;client_max_body_size&nbsp;100m;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;listen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Upload&nbsp;form&nbsp;should&nbsp;be&nbsp;submitted&nbsp;to&nbsp;this&nbsp;location&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;/upload&nbsp;{&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Pass&nbsp;altered&nbsp;request&nbsp;body&nbsp;to&nbsp;this&nbsp;location&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_pass&nbsp;&nbsp;&nbsp;/test;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Store&nbsp;files&nbsp;to&nbsp;this&nbsp;directory&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;The&nbsp;directory&nbsp;is&nbsp;hashed,&nbsp;subdirectories&nbsp;0&nbsp;1&nbsp;2&nbsp;3&nbsp;4&nbsp;5&nbsp;6&nbsp;7&nbsp;8&nbsp;9&nbsp;should&nbsp;exist&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_store&nbsp;/tmp&nbsp;1;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Allow&nbsp;uploaded&nbsp;files&nbsp;to&nbsp;be&nbsp;read&nbsp;only&nbsp;by&nbsp;user&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_store_access&nbsp;user:r;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Set&nbsp;specified&nbsp;fields&nbsp;in&nbsp;request&nbsp;body&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_set_form_field&nbsp;$upload_field_name.name&nbsp;&quot;$upload_file_name&quot;;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_set_form_field&nbsp;$upload_field_name.content_type&nbsp;&quot;$upload_content_type&quot;;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_set_form_field&nbsp;$upload_field_name.path&nbsp;&quot;$upload_tmp_path&quot;;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Inform&nbsp;backend&nbsp;about&nbsp;hash&nbsp;and&nbsp;size&nbsp;of&nbsp;a&nbsp;file&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_aggregate_form_field&nbsp;&quot;$upload_field_name.md5&quot;&nbsp;&quot;$upload_file_md5&quot;;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_aggregate_form_field&nbsp;&quot;$upload_field_name.size&quot;&nbsp;&quot;$upload_file_size&quot;;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_pass_form_field&nbsp;&quot;^submit$|^description$&quot;;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;upload_cleanup&nbsp;400&nbsp;404&nbsp;499&nbsp;500-505;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;Pass&nbsp;altered&nbsp;request&nbsp;body&nbsp;to&nbsp;a&nbsp;backend&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;/test&nbsp;{&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;internal;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;proxy_pass&nbsp;&nbsp;&nbsp;http://localhost:8080;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</span></li>
    <li class=""><span>}&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
</ol>
</div>
有类型需求的可以留意下，我们现在用的很爽。</p>
