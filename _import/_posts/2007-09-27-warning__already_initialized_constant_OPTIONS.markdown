---
layout: post
title: warning__already_initialized_constant_OPTIONS
date: '2007-9-27'
comments: true
categories: Ruby&Rails
link: true
---
<p>着手开发1stlog Ver 1.1版本，把代码整理了一下，带到公司跑不起来，看了下Ruby版本，是1.8.4的，难道是版本太老，卸掉重新装个1.8.6的版本，接着装rails，<font>mongrel和</font><font>mongrel_service等。</font></p>
<p>
<div class="codeText">
<div class="codeHead">安装套件</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>gem&nbsp;install&nbsp;rails&nbsp;&ndash;y&nbsp;&nbsp;</span></span></li>
    <li class=""><span>gem&nbsp;install&nbsp;mongrel&nbsp;&ndash;y&nbsp;&nbsp;</span></li>
    <li class="alt"><span>gem&nbsp;install&nbsp;mongrel_service&nbsp;-y&nbsp;&nbsp;</span></li>
</ol>
</div>
可是<u>ruby ./script/server</u>启动后，还是报错，如下：</p>
<div><font>
<div class="codeText">
<div class="codeHead"><font>XML/HTML代码</font></div>
<ol start="1" class="dp-xml"><font>
    <li class="alt"><span><span>=</span><span class="tag">&gt;</span><span>&nbsp;Booting&nbsp;Mongrel&nbsp;(use&nbsp;'script/server&nbsp;webrick'&nbsp;to&nbsp;force&nbsp;WEBrick)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>=<span class="tag">&gt;</span><span>&nbsp;Rails&nbsp;application&nbsp;starting&nbsp;on&nbsp;http://</span><span class="attribute">0.0.0.0:3000</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>=<span class="tag">&gt;</span><span>&nbsp;Call&nbsp;with&nbsp;-d&nbsp;to&nbsp;</span><span class="attribute">detach</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>=<span class="tag">&gt;</span><span>&nbsp;Ctrl-C&nbsp;to&nbsp;shutdown&nbsp;server&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>**&nbsp;Starting&nbsp;Mongrel&nbsp;listening&nbsp;at&nbsp;0.0.0.0:3000&nbsp;&nbsp;</span></li>
    <li class=""><span>**&nbsp;Starting&nbsp;Rails&nbsp;with&nbsp;development&nbsp;environment...&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Exiting&nbsp;&nbsp;</span></li>
    <li class=""><span>/opt/local/lib/ruby/gems/1.8/gems/rails-1.2.3/lib/commands/servers/mongrel.rb:15:&nbsp;warning:&nbsp;already&nbsp;initialized&nbsp;constant&nbsp;OPTIONS&nbsp;&nbsp;</span></li>
    <li class="alt"><span>/opt/local/lib/ruby/gems/1.8/gems/rails-1.2.3/lib/commands/servers/mongrel.rb:18:&nbsp;undefined&nbsp;method&nbsp;`options'&nbsp;for&nbsp;[]:Array&nbsp;(NoMethodError)&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/vendor_ruby/1.8/rubygems/custom_require.rb:32:in&nbsp;`gem_original_require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/vendor_ruby/1.8/rubygems/custom_require.rb:32:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:342:in&nbsp;`new_constants_in'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/rails-1.2.3/lib/commands/server.rb:39&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/vendor_ruby/1.8/rubygems/custom_require.rb:27:in&nbsp;`gem_original_require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/vendor_ruby/1.8/rubygems/custom_require.rb:27:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:342:in&nbsp;`new_constants_in'&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;/opt/local/lib/ruby/gems/1.8/gems/activesupport-1.4.2/lib/active_support/dependencies.rb:495:in&nbsp;`require'&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from&nbsp;script/server:3&nbsp;&nbsp;</span></li>
    </font></ol>
    </div>
    十分之不解，于是卸掉</font><font><font><span>mongrel，重新安装下，还是不行，google到<a href="http://www.dansketcher.com/2007/05/07/warning-already-initialized-constant-options/">这篇文章</a>：情况几乎差不多，他说是缺少app中使用的gem，恩，很有可能，打开我的environment.rb，看到require 'redcloth',哦，原来如此。<br />
    装上这个gem后一切正常，接着看到一个修复方法，如下：<br />
    </span></font></font>
    <div class="codeText">
    <div class="codeHead">Ruby代码</div>
    <ol start="1" class="dp-rb">
        <li class="alt"><span><span>&ldquo;require&nbsp;&lsquo;nonexistingfile&rsquo;&rdquo;.&nbsp; <br />
        </span></span></li>
    </ol>
    </div>
    但是加上这句保证可启动，但是其中遇到需要使用gem的时候，肯定还是不行的。</div>
