---
layout: post
title: 遭遇ActionController::InvalidAuthenticityToken
date: '2008-5-21'
comments: true
categories: Ruby&Rails
link: true
---
<p>一直没有自己亲自试试客户端直接POST一些数据到rails应用上,今天正好遇到这个需求,原以为会很简单的,在应用中加个action响应,再组合一个hash数据Post到这个action上就好了,赶紧试试,却遭遇<strong>ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken)</strong>错误,唉,貌似有点不对哦.</p>
<p>Google下,找到</p>
