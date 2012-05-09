--- 
layout: post
comments: true
title: "Building&Scaling a Startup on Rails: 12 Things We Learned"
date: 2009-3-8
link: false
categories: life
---
<p>Garry Tan, cofounder of Posterous, lists 12 lessons for scaling that apply to more than just Rails,and i mark some word below.</p>
<div class="content">
<li>Use cloud storage for static files. <em><span style="background-color: rgb(255, 0, 0);">--S3,I do not care it 's fine in china.</span></em></li>
<li>Use HTTP Cache Control to tell the browser what it can cache.&nbsp; <em>--this is true,etag is great.</em></li>
<li>Use Sphinx for text search.&nbsp; <em>--sometimes,you do have others chose.</em></li>
<li>Use InnoDB for more crash resistant and faster writes.&nbsp; -<em>-maybe it's right.</em></li>
<li>Don't use textbook Rails ActiveRecord objects. Use New Relic to find exactly what is slow in your system. <em>--yep</em></li>
<li>Use memcache later so you find your database bottlenecks now. <em>--this is very important.</em></li>
<li>Use mongrel proctitle to find your slow queries. You are only as fast as your slowest queries. -maybe mongrel is not only chose,think about thin,ok?</li>
<li>Use asynchronous job queuing to do work in parallel.&nbsp; <em>--yes,but sometimes crontab is enough.</em></li>
<li>Use monitoring so you'll know when your site went down and why. <em>--that's it,just do it.</em></li>
<li>Learn by reading the source code, fixing problems, and submitting them back to the community.&nbsp; <em>--very userfull when you got some strange questions..</em></li>
<li>Use new plugins. Old plugins can't be trusted. -<em>-and check chang histroy carefully.</em></li>
<li>Use new information. Old information can't be trusted.&nbsp; <em>--and what's this?</em></li>
</div>
<p>go to <a href="http://axonflux.com/building-and-scaling-a-startup">http://axonflux.com/building-and-scaling-a-startup</a> for more infos.</p>
