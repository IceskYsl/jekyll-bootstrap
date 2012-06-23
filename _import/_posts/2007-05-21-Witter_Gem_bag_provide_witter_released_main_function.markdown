---
layout: post
title: witter发布Gem包提供witter主要功能
date: '2007-5-21'
comments: true
categories: Ruby&Rails
link: true
---
witter越来越火了，这个提供IM服务的应用，越来越受到大家的关注，越来越多的人加入其中，昨天台湾的一个朋友还说对witter的这个IM功能很感兴趣，想了解是怎么实现的，呵呵～witter通过网络或者SMS（短消息）使得你和自己的朋友取得及时沟通。你有没有考虑过给自己的WebApp加上这样的功能呢，现在借助witter发布的Gem包，可以很方便的实现这个功能了，更多说明请到http://www.rubyinside.com/twitter-gem-twitterize-your-ruby-application-498.html查看，我这里稍微说下用法，如下：# to post an update to twitter$ twitter post &quot;posting from the twitter gem&quot;# to see you and your friends timeline$ twitter timeline命令行接口很简单，支持YAML配置，也支持Ruby的API：twit.update('me got dizzy this time')# Show your friends' statustwit.timeline(:friends).each do |s|  puts s.text, s.user.nameendUse RubyGems as usual to install it:gem install twitter --include-dependenciesps：One note, the gem uses hpricot to parse the xml and there is an annoying bug that reared it's head in the 0.5+ versions (it doesn't like xml elements named text). That said, be sure to sudo gem install hpricot --source http://code.whytheluckystiff.net -v 0.4.86 and uninstall any hpricot versions 0.5+.
