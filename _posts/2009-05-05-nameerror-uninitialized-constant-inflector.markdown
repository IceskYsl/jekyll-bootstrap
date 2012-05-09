--- 
layout: post
comments: true
title: "NameError: uninitialized constant Inflector"
date: 2009-5-5
link: false
categories: life
---
<p>If you have recently updated to Rails 2.2.2, you may encounter this error when you want to start your application:<br />
<br />
<font color="#ff0000"><em>/.gem/ruby/1.8/gems/activesupport-2.2.2/lib/active_support/dependencies.rb:445:in<br />
`load_missing_constant': uninitialized constant Inflector (NameError)</em></font><br />
<br />
the usage of Inflector class is changed a bit. You can see the difference when you compare the inflections.rb files. Path of the file is yourApp/config/initializers/inflections.rb<br />
<br />
<div class="codeText">
<div class="codeHead"><strong><span><span>inflections.rb&nbsp;(Rails&nbsp;2.1.0)</span></span></strong></div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>&nbsp; <br />
    </span></span></li>
    <li class=""><span>&nbsp;Inflector.inflections&nbsp;<span class="keyword">do</span><span>&nbsp;|inflect|&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;.&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;.&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;.&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
<br />
<div class="codeText">
<div class="codeHead"><strong>inflections.rb (Rails 2.2.2)</strong></div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>ActiveSupport::Inflector.inflections&nbsp;</span><span class="keyword">do</span><span>&nbsp;|inflect|&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;.&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;.&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;.&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
</ol>
</div>
the situation changing <strong>Inflector </strong>to <strong>ActiveSupport::Inflector </strong>was enough to solve the problem.</p>
