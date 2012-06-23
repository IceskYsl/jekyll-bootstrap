---
layout: post
title: ! 'CsrfKiller: 看CSRF还怎么乐的起来'
date: '2008-5-22'
comments: true
categories: Ruby&Rails
link: true
---
<p>前面一篇文章《<a href="http://iceskysl.1sters.com/?action=show&amp;id=286">CSRF: 不要低估了我的危害和攻击能力</a>》说到了<strong>CSRF</strong>是相当恐怖的，前面也说了，在Rails2中可以设置安全码来进一步的防止，另外，今天给大家分享一个插件，是<a href="http://svn.techno-weenie.net/projects/plugins/csrf_killer/">csrf_killer</a>，详细的介绍请参考<a href="http://svn.techno-weenie.net/projects/plugins/csrf_killer/README">README</a>。</p>
{% codeblock %}<strong>CsrfKiller</strong><br />==========<br /><br />This plugin helps protect against possible CSRF attacks.  If you don't know what a Cross Site Request Forgery attack is, check these links:<br /><br />* http://isc.sans.org/diary.html?storyid=1750<br />* http://en.wikipedia.org/wiki/Cross-site_request_forgery<br /><br />This plugin works by extending all forms created with #form_tag (including #form_for, #form_remote_tag, and #remote_form_for) by adding<br />a token unique to each session id.  It also adds a filter that checks all non-GET requests for the existence of this token.  This should<br />ensure that all non-GET actions have been correctly submitted from a form on your site.{% endcodeblock %}
