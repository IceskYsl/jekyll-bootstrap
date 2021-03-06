---
layout: post
title: Prawn：Ruby生成PDF更简捷的选择
date: '2008-8-20'
comments: true
categories: Ruby&Rails
link: true
---
在InfoQ上看到《<a href="http://www.infoq.com/cn/news/2008/08/ruby-pdf-generation-prawn">Prawn：使用Ruby生成PDF更简捷</a>》，其说到的<strong>Prawn</strong>可以更加快捷的在Ruby中生成PDF文件。因为之前使用过很多版本的PDF生成类库都不尽如人意，有的太复杂，有的太慢，于是对这个做了测试。

<strong>1、安装</strong>

安装很简单，直接使用<em>gem install prawn</em>即可安装完成；

<strong>2、使用</strong>

比较简单，详细的参考其文档，我直接贴一段我测试用的代码，如下：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># coding: utf-8</span><span>  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="variable">$LOAD_PATH</span><span> &lt;&lt; </span><span class="builtin">File</span><span>.join(</span><span class="builtin">File</span><span>.dirname(__FILE__), </span><span class="string">'..'</span><span>, </span><span class="string">'lib'</span><span>)  </span></span></li>
	<li><span>require <span class="string">"prawn"</span><span>  </span></span></li>
	<li class="alt"><span>start = <span class="builtin">Time</span><span>.now  </span></span></li>
	<li><span>Prawn::Document.generate(<span class="string">"utf8_text_flow.pdf"</span><span>) </span><span class="keyword">do</span><span>  </span></span></li>
	<li class="alt"><span>  font <span class="string">"#{Prawn::BASEDIR}/data/fonts/simfang.ttf"</span><span>  </span></span></li>
	<li><span>  text <span class="string">"我是中文，还有数字+yingwen+898"</span><span>* 2  </span></span></li>
	<li class="alt"><span>  text <span class="string">"This is a english text, and i will be here ..."</span><span>  </span></span></li>
	<li><span>  text <span class="string">"This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,This is a long text ,"</span><span>  </span></span></li>
	<li class="alt"><span>    </span></li>
	<li><span>  font_size!(16)  </span></li>
	<li class="alt"><span>  text <span class="string">"At size 16"</span><span>  </span></span></li>
	<li><span>    </span></li>
	<li class="alt"><span>  font_size!(16)  </span></li>
	<li><span>  text <span class="string">"\nIceskYsl@1sters!"</span><span>  </span></span></li>
	<li class="alt"><span>  font_size!(10)  </span></li>
	<li><span>  text <span class="string">"不考虑安全的开发过程就是不完整的过程,而我只是个懂点安全对于互联网充满期待的程序员…"</span><span>  </span></span></li>
	<li class="alt"><span>  font_size!(12)  </span></li>
	<li><span>  text <span class="string">"更可怕的是，同质化竞争对手可以按照URL中后面这个ID来遍历您的DB中的内容，写个小爬虫把你的页面上的关键信息顺次爬下来也不是什么难事，这样的话，你就非常被动了。"</span><span>  </span></span></li>
	<li class="alt"><span>
</span></li>
	<li><span><span class="keyword">end</span><span>  </span></span></li>
	<li class="alt"><span>puts <span class="string">"Spend #{Time.now-start}s"</span><span>  </span></span></li>
	<li><span>                                  </span></li>
	<li class="alt"><span>        </span></li>
	<li><span>        </span></li>
</ol>
</div>
生成的PDF效果还是比较让人满意的，如下是效果图：

&nbsp;

<img src="http://lh4.ggpht.com/iceskysl/SKuM4hyi9VI/AAAAAAAACNQ/9scaVGvI6aI/s400/2008-08-20_111728.png" alt="" />

<strong>3、优缺点</strong>
<ul>
	<li>使用比较方便，API都比较简单；</li>
	<li>相对来水比较快，从上面代码可以看到，生成如上这份PDF需要的时候是”Spend 4.36s“；</li>
	<li>其本身支持14种内在字体，另外可以使用TTF字体文件来添加自己需要的字体；</li>
	<li>支持UTF8字体，对中文等字体支持比较好</li>
	<li>英文可以自动换行，但是我测试中文就不能自动换行了，如上图的红圈地方就是溢出的；<span style="color: #ff0000;">--已经修复</span></li>
	<li>定位方便；</li>
	<li>支持图片插入；</li>
	<li>支持表格，cell等等。</li>
</ul>
<strong>4、其他</strong>

上面说的那个Bug我已经提交给作者，详细的参考这里”<a href="http://prawn.lighthouseapp.com/projects/9398/tickets/67-chinese-text-can-not-flow-well#ticket-67-1">chinese text can not flow well </a>“，应该很快就可以修复和完善了；

让我惊奇的是其<a href="http://prawn.majesticseacreature.com/index.html">主页 </a>上竟然有 <a href="http://prawn.majesticseacreature.com/prawn-Chinese.html">中文版页面</a>，难道有国人参与？

其代码库在：http://github.com/sandal/prawn/tree/master

<strong>5、更新</strong>

上面说到的一个对中文自动换行的BUG，提交给作者后，他就修复了，现在我测试的效果非常棒，是我见过的最棒的一个PDF生成类库了，如下是效果图，可以和上面的那个比较下。

<img src="http://lh5.ggpht.com/iceskysl/SKzKMmjOXdI/AAAAAAAACNY/j2CaOzKZRGU/s400/2008-08-21_094749.png" alt="" />
