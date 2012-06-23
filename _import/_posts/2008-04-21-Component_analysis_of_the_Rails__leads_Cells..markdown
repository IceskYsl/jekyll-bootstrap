---
layout: post
title: Rails之Component探析,引出Cells。
date: '2008-4-21'
comments: true
categories: Ruby&Rails
link: true
---
<p>由于打算将我的第一个开源项目<a href="http://iceskysl.1sters.com/?action=show&amp;id=257">1stlog重构和完善</a>，看了下以前的实现方式，除了用到了很对rails2不支持的方法和插件外（正在着手修改），还用到了Rails中的<strong>component</strong>的。而这正是被很多railser们告诫要小心的地方，甚至有人说component是<strong>evil</strong>的，新版1stlog发布在即，我得好好了解下component为什么evil。</p>
<p><strong>一、为什么当时选择component</strong></p>
<p>选择component是根据当时的设计需求来的，1stlog设计的时候是作为一个只有基本blog功能的大框架，而其他的一些个性化功能，需要由其他开发人员或者爱好者来按照一定的规范开发和编写，当时认为，使用component时自简单有效的策略，您可以参考我当时编写&rdquo;<a href="http://1stlog.googlecode.com/files/1stlog%E6%8F%92%E4%BB%B6%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97.doc">1stlog插件开发指南</a>&ldquo;。</p>
<p><strong>二、为什么说component是邪恶的</strong></p>
<p>有人说Rails中的component是邪恶的，千万不要使用，原因呢，还真不清楚，看到<a href="http://glu.ttono.us/articles/2006/08/30/guide-things-you-shouldnt-be-doing-in-rails">有人这么写</a>：
<div class="codeText">
<div class="codeHead"><span><span>Using&nbsp;Components&nbsp; <br />
</span></span></div>
<span> </span>
<ol start="1" class="dp-xml">
    <li class="alt"><span>Components&nbsp;don&rsquo;t&nbsp;belong&nbsp;in&nbsp;Rails.&nbsp;Don&rsquo;t&nbsp;use&nbsp;them.&nbsp;They&nbsp;weren&rsquo;t&nbsp;an <br />
    </span></li>
    <li class="alt"><span>extraction.&nbsp;They&nbsp;weren&rsquo;t&nbsp;well&nbsp;planned.&nbsp;When&nbsp;you&nbsp;want&nbsp;to&nbsp;use&nbsp;a <br />
    </span></li>
    <li class="alt"><span>component&nbsp;it&nbsp;is&nbsp;probably&nbsp;because&nbsp;you&nbsp;misunderstand&nbsp;them&nbsp;or <br />
    </span></li>
    <li class="alt"><span>really&nbsp;want&nbsp;a&nbsp;partial.&nbsp;Rethink&nbsp;what&nbsp;you&rsquo;re&nbsp;doing. <br />
    </span></li>
    <li class="alt"><span>The&nbsp;rest&nbsp;of&nbsp;the&nbsp;Rails&nbsp;world&nbsp;has&nbsp;written&nbsp;off&nbsp;components&nbsp;for&nbsp;a <br />
    </span></li>
    <li class="alt"><span>reason&nbsp;and&nbsp;they&rsquo;ll&nbsp;probably&nbsp;be&nbsp;deprecated&nbsp;by&nbsp;2.0.&nbsp;Resist.&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>也有人拿typo中使用component导致响应很迟钝的数据说明，可以参考&ldquo;<a href="http://railsexpress.de/blog/articles/2005/11/18/components-may-not-be-evil-but-they-sure-can-be-slow">Components may not be evil, but they sure can be slow</a>&rdquo;，再看看Rails的DHH咋说的呢？哦，他说&rdquo;<a href="http://weblog.rubyonrails.org/2005/11/11/why-engines-and-components-are-not-evil-but-distracting/">Why engines and components are not evil but distracting</a>&ldquo;</p>
<p>这么看来，component并不邪恶了，只是慢一点，有些小问题罢了。</p>
<p><strong>三、还用不用？</strong></p>
<p>竟然大家都持谨慎态度，那么我们还用不用呢？用！但是或许得换个方式用。此话怎么讲？因为有一个既可以实现component功能，又不evil的东西出现了，那就是<a href="http://rubyforge.org/projects/cells/">Cells</a>，何谓Cells？还是看他的自白好了：</p>
<p><img src="http://cells.rubyforge.org/RailsCells_files/cells_logo.jpg" alt="" /></p>
<blockquote>
<p>A rails plugin to push things towards component-oriented architecture. Controller logic and views are encapsulated in lightweight cells and can be rendered like render_component.</p>
</blockquote>
<p>哦，看来是个好东西，还想多了解点，看看这些文章吧，&quot;<a href="http://kurt.karmalab.org/articles/2008/02/13/bringing-components-back-into-rails-with-cells">Cells: Bringing Components Back Into Rails 3</a>&quot;或者中文简要版本&rdquo;<a href="http://chinaonrails.com/topic/view/1318/1.html">插件Cells：把模块化带入Rails 应用中，组件导向轻量级的开发</a>&ldquo;，还可以看看道喜的简介&rdquo;<a href="http://www.lycom.de/past/2008/2/14/component-2008-02-14/#comments">Rails框架：组件理念是否重返Rails框架</a>&ldquo;，或者看看中文的一个简单那的例子&rdquo;<a href="http://usurffx-gmail-com.javaeye.com/blog/176186">有人用过cell么？</a>&ldquo;，如果想更深入的了解，可以看看&rdquo;<a href="https://groups.google.com/group/ruby-component-web-frameworks">Ruby Component Web Frameworks</a>&ldquo;</p>
<p><strong>四、还有更好的？</strong></p>
<p>我是不知道了，您要是知道的话，还请告诉我。</p>
<p><strong>参考资料：</strong></p>
<p>1、http://glu.ttono.us/articles/2006/08/30/guide-things-you-shouldnt-be-doing-in-rails</p>
<p>2、http://usurffx-gmail-com.javaeye.com/blog/176186</p>
<p>3、https://groups.google.com/group/ruby-component-web-frameworks</p>
<p>4、http://chinaonrails.com/topic/view/1318/1.html</p>
<p>5、http://www.lycom.de/past/2008/2/14/component-2008-02-14/#comments</p>
<p>6、http://railsexpress.de/blog/articles/2005/11/18/components-may-not-be-evil-but-they-sure-can-be-slow</p>
<p>7、http://weblog.rubyonrails.org/2005/11/11/why-engines-and-components-are-not-evil-but-distracting/</p>
<p>8、http://rubyforge.org/projects/cells/</p>
