---
layout: post
title: 请freeze你的Rails！
date: '2007-10-22'
comments: true
categories: Ruby&Rails
link: true
---
<p>早上起了一个大早，打开电脑，打开技能云，寒～出错了，信息如下：</p>
<p>Rails application failed to start properly&quot;RewriteCond %{HTTP_REFERER} !^<a href="http://1stimes.liquidchinaware.com/.*$" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">http://1stimes.liquidchinaware<wbr></wbr>.com/.*$ </a>      [NC]</p>
<p>看来有点问题，赶紧打开log看看，没有任何错误，看来还没到这步，奇怪，感觉应该是.htaccess的问题，但是我没改过呀，copy一个好的过去，还是不行，郁闷！</p>
<p>赶紧./script/server 试试，提示找不到1.2.3版本的rails，接着rails -v 看下，我靠，咋成1.2.5了，看来是Bl自己升级了，也不通知下,囧～</p>
<p>找到问题就好办了，修改配置文件environment.rb，把rails版本改成1.2.5即可！</p>
<p>引出另外一个话题，<font color="#0000ff">需要freeze你的Rails么？</font>答案是<strong>肯定</strong>的，转另外一个老外写的一段话，如下：</p>
<p>&quot;Freezing Rails is recommended if you are using a Rails application for a business site or another production environment where stability is the most important concern (if you don't freeze your application, there is a small possibility that your application might stop working due to compatibility problems when a new version of Rails is installed on our servers).&quot;</p>
<p>方法很简单：rake rails:freeze:gems等几个命令就ok，会把rails单独拷贝到你的 vender下，而rails启动的时候先看这个目录，如果有就加载，没有的话再加载系统的。</p>
<p>至于为什么这么做，你可以参考他写的文章：http://support.tigertech.net/freeze-rails</p>
<p><strong>参考命令：</strong></p>
{% codeblock %}<a name="freezing-to-a-different">rake rails:freeze:gems<br />rake rails:freeze:edge<br /></a><a name="freezing-to-a-different">rake rails:freeze:edge TAG=rel_1-1-6<br /></a><a name="unfreezing-thawing-rails">rake rails:unfreeze</a>{% endcodeblock %}
<p>&nbsp;</p>
