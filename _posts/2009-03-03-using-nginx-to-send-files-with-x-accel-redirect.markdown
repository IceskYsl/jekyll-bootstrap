--- 
layout: post
comments: true
title: Using nginx to send files with X-Accel-Redirect
date: 2009-3-3
link: false
categories: life
---
<p>In my case, I need do send big files to users, yes, you can do it with nginx,just like others static files,but i need some control for the request action,The delivery of a static file which depends on an application header is known as the X-Sendfile feature.<br />
Lighttpd has this feature and there is a mod_xsendfile for Apache2.<br />
Nginx also has this feature, but implemented a little bit differently. In Nginx this feature is called X-Accel-Redirect.<br />
There are two main differences:</p>
<ol>
    <li>The header must contain a URI</li>
    <li>The location should be defined as internal; to prevent the client going directly to the URI</li>
</ol>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>location&nbsp;/files&nbsp;{&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;/var/www;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;internal;&nbsp;&nbsp;</span></li>
    <li class=""><span>}&nbsp;&nbsp;</span></li>
</ol>
</div>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>//&nbsp;Get&nbsp;requested&nbsp;file&nbsp;name&nbsp;&nbsp;</span></span></li>
    <li class=""><span>path&nbsp;=&nbsp;<span class="variable">@params</span><span>[</span><span class="string">&quot;path&quot;</span><span>]&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span><span class="comment">#&nbsp;...</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="comment">#&nbsp;Perform&nbsp;any&nbsp;required&nbsp;security&nbsp;checks,&nbsp;validation&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="comment">#&nbsp;and/or&nbsp;stats&nbsp;accounting</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="comment">#&nbsp;...</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span><span class="comment">#&nbsp;And&nbsp;redirect&nbsp;user&nbsp;to&nbsp;internal&nbsp;location</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>response.headers[<span class="string">'X-Accel-Redirect'</span><span>]&nbsp;=&nbsp;</span><span class="string">&quot;/files/&quot;</span><span>&nbsp;+&nbsp;path&nbsp;&nbsp;</span></span></li>
</ol>
</div>
</p>
<p>some userfull link resource come here:</p>
<ul>
    <li><a href="http://blog.kovyrin.net/2006/11/01/nginx-x-accel-redirect-php-rails/">http://blog.kovyrin.net/2006/11/01/nginx-x-accel-redirect-php-rails/</a></li>
    <li><a href="http://wiki.codemongers.com/NginxXSendfile">http://wiki.codemongers.com/NginxXSendfile</a></li>
    <li><a href="http://www.motionstandingstill.com/using-nginx-to-send-files-with-x-accel-redirect/2008-09-03/">http://www.motionstandingstill.com/using-nginx-to-send-files-with-x-accel-redirect/2008-09-03/</a></li>
</ul>
<p>&nbsp;</p>
