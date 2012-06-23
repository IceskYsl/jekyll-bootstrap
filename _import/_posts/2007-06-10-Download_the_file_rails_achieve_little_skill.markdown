---
layout: post
title: rails实现下载文件的小技巧
date: '2007-6-10'
comments: true
categories: Ruby&Rails Security
link: true
---
<p>有的时候，如果你把需要下载的文件放在public目录或者其子目录下，是可以通过URL直接下载的，但是有的时候，你可能想把文件存放在别的目录以保证不会被爬虫或者其他恶意的人下载到（比如你写的电子书或者好的资料等等.），这个时候Rails的send_file函数就显得很好用，它每次发送4096byte，所以发送文件会很快，<br />
下面是个例子：</p>
<blockquote>send_file '/path/to.jpeg', :type =&gt; 'image/jpeg', :disposition =&gt; 'inline'<br />
</blockquote>
<p><br />
这里只是一个例子，真实的使用中，你可以把一个文件的信息存放在数据库里面，然后下载的时候就可以根据每个文件来指定上述的值了，如下：</p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;attachment&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="variable">@attachment</span><span>&nbsp;=&nbsp;Attachment.find(params[</span><span class="symbol">:id</span><span>])&nbsp;</span><span class="variable">@attachment</span><span>.update_attribute(</span><span class="symbol">:downloads</span><span>,</span><span class="variable">@attachment</span><span>.downloads+1)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>send_file&nbsp;<span class="variable">@attachment</span><span>.filepath,&nbsp;</span><span class="symbol">:type</span><span>&nbsp;=&gt;&nbsp;</span><span class="variable">@attachment</span><span>.filetype,&nbsp;</span><span class="symbol">:disposition</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'inline'</span><span> <br />
    </span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
<p>很棒，不是么～</p>
