---
layout: post
title: Gravatars,图片标识服务-多小的Idea都可以做成.
date: '2008-6-27'
comments: true
categories: 视觉观察 Ruby&Rails
tags: Gravatars
link: true
---
这个世界有意思，多大的idea都可以做成网站，以前看过缩址的网站，现在有看到一个省份标识的网站，<a href="http://gravatar.com/"> Gravatars</a>，看他的介绍：
<blockquote>A gravatar, or <strong>g</strong>lobally <strong>r</strong>ecognized <strong>avatar</strong>, is quite simply an avatar image that follows you from weblog to weblog appearing beside your name when you comment on gravatar enabled sites. Avatars help identify your posts on web forums, so why not on weblogs?</blockquote>
看明白了么，就是一个你输入自己的Email，然后上传自己的图片标识，然后在其他支持 Gravatars的网站（blog居多）中发表评论的时候输入自己的Email地址，就可以在Gravatars上找到其对应的图片来显示了。

这确实是个不错的Idea，相当简单，但是也做得有声有色的，有点意思。

使用也很方便，其在“<a href="http://en.gravatar.com/site/implement/url">How the URL is constructed</a>”上介绍了其URL的组成，中可以这么使用（来源<a href="http://overhrd.com/?p=28">Gravatars on Rails</a>）：

<!--more-->

1、首先在{% codeblock %}application_helper.rb中增加一个helper方法{% endcodeblock %}
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'digest/md5'</span><span>    </span></span></li>
	<li><span><span class="comment">#增加一个Helper方法  </span><span>  </span></span></li>
	<li class="alt"><span><span class="keyword">def</span><span> gravatar_url_for(email, options = {})        </span></span></li>
	<li><span>   url_for({ <span class="symbol">:gravatar_id</span><span> =&gt; Digest::MD5.hexdigest(email), </span><span class="symbol">:host</span><span> =&gt; </span><span class="string">'www.gravatar.com'</span><span>,          </span></span></li>
	<li class="alt"><span>            <span class="symbol">:protocol</span><span> =&gt; </span><span class="string">'http://'</span><span>, </span><span class="symbol">:only_path</span><span> =&gt; </span><span class="keyword">false</span><span>, </span><span class="symbol">:controller</span><span> =&gt; </span><span class="string">'avatar.php'</span><span>        </span></span></li>
	<li><span>       }.merge(options))      </span></li>
	<li class="alt"><span><span class="keyword">end</span><span>    </span></span></li>
</ol>
</div>
&nbsp;

2、然后就可以在view里面直接使用了
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span class="comment"># plain old gravatar url    </span><span>  </span></span></li>
	<li><span>&lt;%= gravatar_url_for <span class="string">'iceskysl@gmail.com'</span><span> %&gt;        </span></span></li>
	<li class="alt"><span>    </span></li>
	<li><span><span class="comment"># gravatar url with a rating threshold     </span><span>  </span></span></li>
	<li class="alt"><span>&lt;%= gravatar_url_for <span class="string">'iceskysl@gmail.com'</span><span>, { </span><span class="symbol">:rating</span><span> =&gt; </span><span class="string">'R'</span><span> } %&gt;        </span></span></li>
	<li><span>    </span></li>
	<li class="alt"><span><span class="comment"># show the avatar     </span><span>  </span></span></li>
	<li><span>&lt;%= image_tag(gravatar_url_for <span class="string">'iceskysl@gmail.com'</span><span>)%&gt;       </span></span></li>
	<li class="alt"><span>    </span></li>
	<li><span><span class="comment"># show the avatar with size specified, in case it's served slowly    </span><span>  </span></span></li>
	<li class="alt"><span>&lt;%= image_tag(gravatar_url_for('iceskysl<span class="variable">@gmail</span><span>.com</span><span class="string">'), { :width =&gt; 80, :height =&gt; 80 }) %&gt;     </span> </span></li>
	<li><span><span class="string"> </span> </span></li>
	<li class="alt"><span><span class="string"># link the avatar to some/url   </span> </span></li>
	<li><span><span class="string">&lt;%= link_to(image_tag(gravatar_url_for '</span><span>iceskysl</span><span class="variable">@gmail</span><span>.com</span><span class="string">'), '</span><span>some/url')%&gt;    </span></span></li>
</ol>
</div>
PS：果然不出所料，还有Gem可以使用" <a href="http://avatar.rubyforge.org/">Ruby Avatar Gem</a>"

&nbsp;
