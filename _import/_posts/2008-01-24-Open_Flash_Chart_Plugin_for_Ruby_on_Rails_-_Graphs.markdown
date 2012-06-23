---
layout: post
title: Open_Flash_Chart_Plugin_for_Ruby_on_Rails_-_Graphs
date: '2008-1-24'
comments: true
categories: Ruby&Rails
link: true
---
<p>刚刚写完上一篇文章<a href="http://www.itechtag.com/groups/32/posts/104">Open flash chart 生成动态有一些交互效果的图表</a> ,因为其实用PHP做为例子来演示的，偶还想用RubyOnRails来改写一把，down下他的zip包，发现有两个ruby的类库，一个是作者自己写的，比较简陋；而另外一个是<a href="http://pullmonkey.com/">pullmonkey</a> 写的，看了下代码和readme，发现他已经用RoR实现了。 去他的网站上看看，果然又有更新，看下其效果，相当不错。 <img alt="" src="http://lh3.google.com/iceskysl/R5f5pShC_dI/AAAAAAAABPo/sQlP8UpCwxk/chart.png" /></p>
<p><img alt="" src="http://lh4.google.com/iceskysl/R5f5pihC_eI/AAAAAAAABPw/hCjTNlrOBeI/chart2.png" /></p>
<p><img alt="" src="http://lh4.google.com/iceskysl/R5f6SihC_fI/AAAAAAAABP4/oJBjhWFnXvY/chart3.png" /></p>
<blockquote>
<p>I ported the php code for open flash chart to ruby and so far it has worked quite well with Rails. Just ported the latest 1.9.6 version &ndash; see the many graph examples below. To install and use the open flash chart plugin for Rails do the following:</p>
</blockquote>
<ol>
    <li>script/plugin install <a href="http://svn.pullmonkey.com/plugins/trunk/open_flash_chart/">http://svn.pullmonkey.com/plugins/trunk/open_flash_chart/</a></li>
    <li>Move the open_flash_chart.swf file into your <span class="caps">RAILS</span>_ROOT/public directory</li>
    <li>Create a controller and a view as in my examples below.</li>
</ol>
<p>可以在<a href="http://pullmonkey.com/projects/open_flash_chart">http://pullmonkey.com/projects/open_flash_chart</a>  查看详细的代码和示例。</p>
<p>看一段3D bar的代码，如下：{% codeblock %}<br />
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;view&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="variable">@graph</span><span>&nbsp;=&nbsp;open_flash_chart_object(500,250,&nbsp;</span><span class="string">'/projects/open_flash_chart/bar_3d'</span><span>,&nbsp;</span><span class="keyword">false</span><span>,&nbsp;</span><span class="string">'/projects/'</span><span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;bar_3d&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_red&nbsp;=&nbsp;Bar3d.<span class="keyword">new</span><span>(75,&nbsp;</span><span class="string">'#D54C78'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_red.key(<span class="string">'2006'</span><span>,&nbsp;10)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_blue&nbsp;=&nbsp;Bar3d.<span class="keyword">new</span><span>(75,&nbsp;</span><span class="string">'#3334AD'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_blue.key(<span class="string">'2007'</span><span>,&nbsp;10)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.times&nbsp;<span class="keyword">do</span><span>&nbsp;|t|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_red.data&nbsp;&lt;&lt;&nbsp;rand(3)&nbsp;+&nbsp;2&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar_blue.data&nbsp;&lt;&lt;&nbsp;rand(4)&nbsp;+&nbsp;5&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g&nbsp;=&nbsp;Graph.<span class="keyword">new</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.title(<span class="string">&quot;3D&nbsp;Bar&nbsp;Chart&quot;</span><span>,&nbsp;</span><span class="string">&quot;{font-size:20px;&nbsp;color:&nbsp;#FFFFFF;&nbsp;margin:&nbsp;5px;background-color:&nbsp;#505050;&nbsp;padding:5px;&nbsp;padding-left:&nbsp;20px;&nbsp;padding-right:&nbsp;20px;}&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.data_sets&nbsp;&lt;&lt;&nbsp;bar_red&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.data_sets&nbsp;&lt;&lt;&nbsp;bar_blue&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_x_axis_3d(12)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_x_axis_color(<span class="string">'#ffffff'</span><span>,&nbsp;</span><span class="string">'#fDB5C7'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_y_axis_color(<span class="string">'#ffffff'</span><span>,&nbsp;</span><span class="string">'#fDB5C7'</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_x_labels(%w(Jan&nbsp;Feb&nbsp;Mar&nbsp;Apr&nbsp;May&nbsp;Jun&nbsp;Jul&nbsp;Aug&nbsp;Sep&nbsp;Oct))&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_y_max(10)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_y_label_steps(5)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;g.set_y_legend(<span class="string">&quot;OPEN&nbsp;FLASH&nbsp;CHART&quot;</span><span>,&nbsp;12,&nbsp;</span><span class="string">&quot;#736AFF&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;render&nbsp;<span class="symbol">:text</span><span>&nbsp;=&gt;&nbsp;g.render&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
{% endcodeblock %}</p>
