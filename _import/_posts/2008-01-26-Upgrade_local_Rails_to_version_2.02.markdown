---
layout: post
title: 升级本地Rails到2.02版本
date: '2008-1-26'
comments: true
categories: Ruby&Rails
link: true
---
<p>Rails2版本出来已经有一段时间了，一直没来得及细看，也没有时间把以前写的几个APP升级到Rails2,今天突然心血来潮，就把本地的Rails升级到Rails2.02版本了。</p>
<p>并最先把<a href="http://www.1sters.net/">1.s.t</a>的系统升级调试过了，途中遇到几个小问题，记录如下：</p>
<p><strong>1、升级Rails2.02的时候遇到的</strong></p>
<p>升级前，版本如下：</p>
<blockquote><font face="Courier New">iceskysl@IceskYsl:~$ gem -v</font><br />
<font face="Courier New">0.93</font><br />
<font face="Courier New">iceskysl@IceskYsl:~$ rails -v</font><br />
<font face="Courier New">Rails 1.2.5</font><br />
<font face="Courier New">iceskysl@IceskYsl:~$ ruby -v</font><br />
<font face="Courier New">ruby 1.8.6 (2007-03-13 patchlevel 0) [i686-linux]</font><br />
</blockquote>
<p>升级命令如下：</p>
<p>
<div class="codeText">
<div class="codeHead">Shell代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>iceskysl</span><span class="variable">@IceskYsl</span><span>:~$&nbsp;gem&nbsp;update&nbsp;--system&nbsp;&nbsp;</span></span></li>
    <li class=""><span>iceskysl<span class="variable">@IceskYsl</span><span>:~$&nbsp;gem&nbsp;update&nbsp;rails&nbsp;--include-dependencies&nbsp;&nbsp;&nbsp;</span></span></li>
</ol>
</div>
升级完，看下版本<br />
<font face="Courier New">iceskysl@IceskYsl:~$ </font>gem -v: 1.0.1<br />
<font face="Courier New">iceskysl@IceskYsl:~$ </font><font face="Courier New">rails -v</font></p>
<p><font face="Courier New">出现rubygems.rb:379:in `report_activate_error': RubyG<br />
em version error: activesupport(1.4.2 not = 2.0.2) (Gem::LoadError)错误，看来有点问题。</font></p>
<p><font face="Courier New">紧接着执行：</font><font face="Courier New">gem update activesupport即可。</font></p>
<p><strong><font face="Courier New">2、出现View的问题</font></strong></p>
<p><font face="Courier New">
<div class="codeText">
<div class="codeHead"><font>XML/RHTML代码</font></div>
<ol start="1" class="dp-xml"><font>
    <li class="alt"><span><span class="tag">&lt;</span><span>%=link_to&nbsp;h(@topic.title),group_topic_path(</span><span class="attribute">:group_id</span><span>&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;@topic.group,&nbsp;</span><span class="attribute">:id</span><span>&nbsp;=</span><span class="tag">&gt;</span><span>&nbsp;@topic),{</span><span class="attribute">:class</span><span>=</span><span class="tag">&gt;</span><span>&quot;notify_title&quot;}%</span><span class="tag">&gt;</span><span>&nbsp;&nbsp;</span></span></li>
    </font></ol>
    </div>
    必须是</font><font face="Courier New"><font><span><span>group_topic_path这样的，不能象Rails1.2.5时候</span></span></font></font><font face="Courier New"><font><span><span>topic_path这样的，其他类似。</span></span></font></font></p>
    <p><font face="Courier New"><font><span><span>3、插件问题</span></span></font></font></p>
    <p><font face="Courier New"><font><span><span>类似auto_complete_for这个不在包含在Rails核心中，而是以插件的发布，需要安装一下，如下：</span></span></font></font></p>
    <p><font face="Courier New"><font><span><span>
    <div class="codeText">
    <div class="codeHead">SHELL代码</div>
    <ol start="1" class="dp-xml">
        <li class="alt"><span><span>iceskysl@IceskYsl:/opt/devroot/1sters.net$&nbsp;./script/plugin&nbsp;&nbsp;install&nbsp;http://dev.rubyonrails.org/svn/rails/plugins/auto_complete/&nbsp;&nbsp;</span></span></li>
    </ol>
    </div>
    还没发现其他问题，貌似没想像的那么多问题，可能是我代码写的比较好吧,:)<br />
    </span></span></font></font></p>
