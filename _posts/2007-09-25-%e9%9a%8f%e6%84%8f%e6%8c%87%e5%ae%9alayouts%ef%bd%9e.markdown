--- 
layout: post
comments: true
title: !binary |
  6ZqP5oSP5oyH5a6aTGF5b3V0c++9ng==

date: 2007-9-25
link: false
categories: life
---
<p>很多时候，我们会使用global layouts, controller layouts, shared layouts, dynamic layouts and action layouts.另外，我们还可以用如下方法的layouts，看例子：</p>
<p>
<div class="codeText">
<div class="codeHead">layouts示例代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span class="comment">#&nbsp;projects_controller.rb</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>layout&nbsp;<span class="symbol">:user_layout</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="keyword">def</span><span>&nbsp;index&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;<span class="variable">@projects</span><span>&nbsp;=&nbsp;Project.find(</span><span class="symbol">:all</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;render&nbsp;<span class="symbol">:layout</span><span>&nbsp;=&gt;&nbsp;</span><span class="string">'projects'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>protected&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="keyword">def</span><span>&nbsp;user_layout&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">if</span><span>&nbsp;current_user.admin?&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">&quot;admin&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">else</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="string">&quot;application&quot;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;<span class="keyword">end</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="keyword">end</span><span>&nbsp; <br />
    </span></span></li>
</ol>
</div>
</p>
