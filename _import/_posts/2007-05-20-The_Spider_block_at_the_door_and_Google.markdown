---
layout: post
title: 把Google等Spider挡在门外
date: '2007-5-20'
comments: true
categories: Security Tips
link: true
---
有的时候，您可能不想GOOGLE或者其他的网络蜘蛛（Spider）造访您的站点（比如一个私密的同学录或者个人财富系统等），您可以在ApplicationController 里面加入如下这个方法：class ApplicationController &lt; ActionController::Base  before_filter :disable_link_prefetching  private    def disable_link_prefetching      if request.env[&quot;HTTP_X_MOZ&quot;] == &quot;prefetch&quot;         logger.debug &quot;prefetch detected: sending 403 Forbidden&quot;         render_nothing &quot;403 Forbidden&quot;         return false      end    endend其他Spider的防范可以参考这个来实现，就是提取请求来源的参数标志，然后加以阻挡就可以了。
