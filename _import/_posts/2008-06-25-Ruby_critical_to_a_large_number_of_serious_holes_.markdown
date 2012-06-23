---
layout: post
title: Ruby暴出大量严重漏洞!
date: '2008-6-25'
comments: true
categories: Security
tags: ruby 安全 漏洞
link: true
---
Drew Yao at Apple uncovered a handful of nasty security vulnerabilities affecting all current versions of Ruby. The details are still under wraps because an attacker can DoS you or possibly execute arbitrary code—holy crap! Better upgrade sooner than later.

According to the <a href="http://www.ruby-lang.org/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/">official Ruby security advisory</a>, the vulnerable Rubies are:

* 1.8.4 and earlier
* 1.8.5-p230 and earlier
* 1.8.6-p229 and earlier
* 1.8.7-p21 and earlier

Those of us running Ruby 1.8.4 or earlier must upgrade to 1.8.5 or later for a fix. Those on 1.8.5-7 can grab the latest patchlevel release for a fix.

(Please note: Ruby 1.8.7 breaks backward compatibility and is only compatible with Rails 2.1 and later, so don’t go overboard!)
虽然暂时还没看到具体的细节公布出来，也没看到0day放出来，但是从其描述上不难看出，这些bug是ruby一致以来都有的，或许还有更多的bug，ruby走向成熟，离不开这样的检验。
