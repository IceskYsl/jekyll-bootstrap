---
layout: post
title: 增加iTechTag的XSS防护功能
date: '2008-2-13'
comments: true
categories: Ruby&Rails
link: true
---
<p>XSS目前越来越疯狂，虽然Rails提供了<strong>h()</strong>辅助方法用来防护，但是万一忘记了，就有可能被XSS了，技能云开发的时间比较零碎，没有全部考虑、过滤，比较危险，今天采用xss_terminate用来搞定。</p>
<p>安装方法：<br />
script/plugin install http://xssterminate.googlecode.com/svn/trunk/xss_terminate</p>
