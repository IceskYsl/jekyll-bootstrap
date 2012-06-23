---
layout: post
title: Paperclip，按日期划分目录方法
date: '2010-4-27'
comments: true
categories: Ruby&Rails
link: true
---
一个项目用到了图片上传，不想自己写处理过程了，于是就找找可以使用的插件，看到了<a href="http://www.thoughtbot.com/projects/paperclip" target="_blank">Paperclip</a>，大概了看了下代码和使用介绍，比较简洁。

装上测试了下，整个过程比较顺利，很快就集成了需要的功能，但是具体到我的需求 上，花了点时间，我的需求也比较常见，就是大量的图片不能就存在一个文件夹下（否则这么多的小文件会带来很多的隐患），于是看代码找找其是否支持分目录的方案，我直接基本上都是按时间来分成诸如"2010/0428/"这样的目录，但是找了一圈，发现其提供了timestamp的一个变量，但是其结果比较糟糕，文件夹中还会根据当代的locale出现一些等下，不太合适；

然后看到其提供了一个：id_partition的参数，其意思是：
<blockquote># Returns the id of the instance in a split path form. e.g. returns

# 000/001/234 for an id of 1234.</blockquote>
<div id="_mcePaste">和我预期的差不多，如果决定这个数字还不够，可以修改其代码，如下：</div>
<div>
<div>def id_partition attachment, style_name</div>
<div>("%09d" % attachment.instance.id).scan(/\d{3}/).join("/")</div>
<div>end</div>
<div>你可以再加3位（这下应该足够了，千亿级别的了），分成四个等级</div>
<div>
<div>def id_partition attachment, style_name</div>
<div>("%12d" % attachment.instance.id).scan(/\d{3}/).join("/")</div>
<div>end</div>
</div>
<div></div>
<div>然后我们可以按照这个方式专辑实现安装日期类分目录的，代码如下：</div>
<div>
<div># Returns the timestamp of the instance in a split path form. e.g. returns</div>
<div># 2010/0428 for an id of 2010.04.28</div>
<div>def timestamp_partition attachment, style_name</div>
<div>attachment.instance_read(:updated_at).strftime("%Y/%m%d/")</div>
<div># ("%09d" % attachment.instance.id).scan(/\d{3}/).join("/")</div>
<div>end</div>
</div>
<div>然后给model加上：</div>
<div>
<div>has_attached_file :logo, :styles =&gt; {:thumb =&gt; '64x64&gt;', :small =&gt; "150x150&gt;" },</div>
<div>:url =&gt; "/upload/:class/:attachment/:timestamp_partition/:id/:style/:basename.:extension",</div>
<div>:path =&gt; ":rails_root/upload/:class/:attachment/:timestamp_partition/:id/:style/:basename.:extension"</div>
<div></div>
</div>
<div>其得到的结果类似：</div>
</div>
<div>[paperclip] Saving attachments.</div>
<div id="_mcePaste">[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/original/me.jpg</div>
<div id="_mcePaste">[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/thumb/me.jpg</div>
<div id="_mcePaste">[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/small/me.jpg</div>
[paperclip] Saving attachments.[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/original/me.jpg[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/thumb/me.jpg[paperclip] saving /svnroot/eoe/dev/rails/eoemarket/eoeMarket/upload/shops/logos/2010/0428//5/small/me.jpg

参考：

http://jimneath.org/2008/04/17/paperclip-attaching-files-in-rails/

http://cn.asciicasts.com/episodes/134-paperclip

http://github.com/thoughtbot/paperclip

http://gist.github.com/165072
