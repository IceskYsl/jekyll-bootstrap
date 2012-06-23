---
layout: post
title: 采用Ruby提取MP3的metadata信息
date: '2008-10-5'
comments: true
categories: Ruby&Rails
link: true
---
昨天有幸认识了<a href="http://www.trb.cn/wordpress/index.php/my-profile/">terry</a>，看到其blog上有篇文章”<a href="http://www.trb.cn/wordpress/index.php/2008/08/28/661/">消费者对音乐内容Metadata的需求</a>“，其中写到”<em>音乐Metadata是所有数字音乐服务的根基，它的完备性也将直接影响服务的可扩展性。</em>“，最基础也是应用最普遍的是”<em>2.音乐目录元数据，例如歌曲名、专辑名、词曲作者等直接描述音乐作品的信息。这些信息通常会直接体现在各种数字音乐服务上。</em>“。其给出一份消费者对metadata需求的调查研究，如下：
<img src="http://www.trb.cn/wordpress/upload/Metadata_CCC0/20080828_143216.jpg" alt="" />
今天突然来了兴趣，分析一首歌曲，找到其对应的metadata信息，经过资料查找和分析，目前已经基本完成，主要是读取MP3文件的ID3信息（ID3v1，ID3v1.1以及ID3v2），ID3v1的信息比较好读取，下面会给出一段ruby代码，ID3v2比较复杂，也有比较成熟的开源库，这里就不详细说了，我写在GoogleDoc里了，有感兴趣的可以自行研究或者找我要。
下面是一段读取MP3歌曲的ID3v1.1信息的代码和运算结果：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="keyword">class</span><span> ID3  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="comment">#初始化genre列表信息</span><span>  </span></span></li>
	<li><span>  genre_list = &lt;&lt;-GENRES  </span></li>
	<li class="alt"><span>Blues  </span></li>
	<li><span>Classic Rock  </span></li>
	<li class="alt"><span>...省略其他的genre...  </span></li>
	<li><span>  GENRES  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>  GENRE_LIST = genre_list.split(<span class="string">"\n"</span><span>)  </span></span></li>
	<li class="alt"><span>  TAGS = [ <span class="symbol">:title</span><span>, </span><span class="symbol">:artist</span><span>, </span><span class="symbol">:album</span><span>, </span><span class="symbol">:year</span><span>, </span><span class="symbol">:comment</span><span>, </span><span class="symbol">:track</span><span>, </span><span class="symbol">:genre</span><span> ]  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>  attr_accessor *TAGS  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>  <span class="keyword">def</span><span> initialize(filename)  </span></span></li>
	<li><span>    id3 = <span class="builtin">File</span><span>.open(filename) </span><span class="keyword">do</span><span> |mp3|  </span></span></li>
	<li class="alt"><span>      mp3.seek(-128, <span class="builtin">IO</span><span>::SEEK_END)  </span></span></li>
	<li><span>      mp3.read  </span></li>
	<li class="alt"><span>    <span class="keyword">end</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>    <span class="keyword">raise</span><span> </span><span class="string">"No ID3 tags"</span><span> </span><span class="keyword">if</span><span> (id3 !~ /^TAG/ || id3 ~= /^TAG0{125}/)  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>    <span class="variable">@title</span><span>, </span><span class="variable">@artist</span><span>, </span><span class="variable">@album</span><span>, </span><span class="variable">@year</span><span>, </span><span class="variable">@comment</span><span>, </span><span class="variable">@genre</span><span> = id3.unpack(</span><span class="string">'xxxA30A30A30A4A30C1'</span><span>)  </span></span></li>
	<li><span>    <span class="variable">@comment</span><span>, </span><span class="variable">@track</span><span> = </span><span class="variable">@comment</span><span>.unpack(</span><span class="string">'Z*@28C1'</span><span>) </span><span class="keyword">if</span><span> </span><span class="variable">@comment</span><span> =~ /\0.$/  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span>    <span class="variable">@genre</span><span> = GENRE_LIST[</span><span class="variable">@genre</span><span>]  </span></span></li>
	<li class="alt"><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="keyword">if</span><span> __FILE__ == </span><span class="variable">$0</span><span>  </span></span></li>
	<li class="alt"><span>  id3 = ID3.<span class="keyword">new</span><span>(ARGV.shift)  </span></span></li>
	<li><span>  ID3::TAGS.<span class="keyword">each</span><span> </span><span class="keyword">do</span><span> |tag|  </span></span></li>
	<li class="alt"><span>    puts <span class="string">"#{tag.to_s.capitalize.rjust(8)}: #{id3.send(tag)}"</span><span>  </span></span></li>
	<li><span>  <span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
其运算的结果差不多是这样的：
<div class="codeText">
<div class="codeHead">算的结果</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>F:\IceskYsl&gt;ruby id3_tags.rb ../06.mp3  </span></span></li>
	<li><span>   Title: What I've Done  </span></li>
	<li class="alt"><span>  Artist: Linkin Park  </span></li>
	<li><span>   Album: Minutes To Midnight  </span></li>
	<li class="alt"><span>    Year: 2007  </span></li>
	<li><span> Comment: http://www.HiHiCD.com  </span></li>
	<li class="alt"><span>   Track: 0  </span></li>
	<li><span>   Genre: Metal  </span></li>
</ol>
</div>
发现这是个有意思的事情，呵呵。

参考文章：
http://www.trb.cn/wordpress/index.php/2008/08/28/661/
