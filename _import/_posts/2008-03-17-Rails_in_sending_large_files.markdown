---
layout: post
title: 在Rails中发送大文件
date: '2008-3-17'
comments: true
categories: Ruby&Rails
link: true
---
<p>有个需求是需要在程序里生成压缩文件，并通过浏览器下载，在rails中发送文件的方式有2中，分别是send_data和send_file,两者还是有些区别的，详细的可以参考Rails的API文档（http://api.rubyonrails.com/classes/ActionController/Streaming.html），这里简单的记录2个方式，如下：</p>
{% codeblock %}<strong>send_file '/path/to.zip'</strong>{% endcodeblock %}
<blockquote>（Sends the file by streaming it <strong>4096 </strong>bytes at a time. This way the whole<br />
file doesn&lsquo;t need to be read into memory at once. This makes it<br />
feasible to send even large files.）<br />
</blockquote>
{% codeblock %}恩，我的需求差不多也是这样的，需要发送的文件比较大，大概在10M左右的大小，按照上<br />面的这个说明，15M的文件差不多需要下载一分钟（理论速度，和实际的网速还是有关系的）；<br />挺方便了。<br />参考：<br />http://api.rubyonrails.com/classes/ActionController/Streaming.html<br />http://www.javaeye.com/post/219997{% endcodeblock %}
