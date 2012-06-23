---
layout: post
title: ! '初识oauth: 为API访问授权提供一个开放的标准'
date: '2008-10-16'
comments: true
categories: Tips
tags: oauth
link: true
---
最近在准备一些API设计开发工作，初步了解了下<a href="http://rubyforge.org/projects/oauth/">oauth</a>，OAuth是由Blaine Cook、Chris Messina、Larry Halff 及David Recordon共同发起的，目的在于为API访问授权提供一个开放的标准。
oauth目前看来进展比较顺利，可以看到其有<a href="http://code.google.com/p/oauth/">主流语言的lib</a>（Java、C#、Objective-C、Perl、PHP及Ruby语言），目前支持oauth的API有twitter，douban等应用。

<a href="http://oauth.net/">OAuth</a> is the great new standard allowing your users to use your application to talk to their accounts on other applications. I won’t go more into it here as it’s pretty well covered on the <a href="http://oauth.net/">OAuth</a> site.
<strong>
OAuth’s Goal</strong>
Website X can access your protected data at API Y
<ul>
	<li>All without sharing your password off-site</li>
	<li>especially when there isn’t one like with OpenID</li>
</ul>
其基本流程为：
<ol>
	<li>Register your consumer application with the OAuth compliant service to receive your Consumer Credentials (This is only done once)</li>
	<li>You initiate the OAuth Token exchange process for a user by requesting a <a href="http://code.google.com/p/oauth-plugin/wiki/RequestToken">RequestToken</a> from the Service</li>
	<li>You store the <a href="http://code.google.com/p/oauth-plugin/wiki/RequestToken">RequestToken</a> in your database or in the users session object</li>
	<li>You redirect your user to the service providers authorize_url with the RequestToken’s key appended</li>
	<li>Your user is asked by the service provider to authorize your RequestToken</li>
	<li>Your user clicks yes and is redirected to your CallBack <span class="caps">URL</span></li>
	<li>Your callback action exchanges the <a href="http://code.google.com/p/oauth-plugin/wiki/RequestToken">RequestToken</a> for an <a href="http://code.google.com/p/oauth-plugin/wiki/AccessToken">AccessToken</a></li>
	<li>Now you can access your users data by performing http requests signed by your consumer credentials and the AccessToken.</li>
	<li>????</li>
	<li><span class="caps">PROFIT</span>!!!</li>
</ol>
如果你想了解，请参考如下文档，如果你有经验，请分享，谢谢！
<strong>
参考文档：</strong>
<ul>
	<li><a href="http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby">Developing OAuth clients in Ruby </a></li>
	<li><a href="http://stakeventures.com/articles/2007/11/26/how-to-turn-your-rails-site-into-an-oauth-provider">How to turn your rails site into an OAuth Provider </a></li>
	<li><a href="http://www.infoq.com/cn/news/2008/06/oauth_spring">OAuth不断获得动力 </a></li>
	<li><a href="http://github.com/pelle/oauth-plugin/tree/master"><span id="repository_description">Rails plugin for OAuth</span></a></li>
	<li><a href="http://github.com/pelle/oauth/tree/master"><span id="repository_description">OAuth implementation for Ruby</span></a></li>
	<li><span id="repository_description"><a href="http://www.douban.com/service/apidoc/auth">豆瓣 API 认证授权说明</a></span></li>
	<li><span id="repository_description"><a href="http://assets.en.oreilly.com/1/event/3/The%20%22How%22%20of%20OAuth%20Presentation%201.ppt">The How of OAuth --这个PPT挺不错</a>
</span></li>
</ul>
