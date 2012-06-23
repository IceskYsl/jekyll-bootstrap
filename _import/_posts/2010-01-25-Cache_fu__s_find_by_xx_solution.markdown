---
layout: post
title: cache_fu's find_by_xx解决办法
date: '2010-1-25'
comments: true
categories: Ruby&Rails
tags: cache_fu find_by
link: true
---
在项目里用了memcached和cache_fu，其默认的 get_cache(id)还是非常方便的，但是对于另外一个用的比较多的find_by_xx这样的，貌似没看到有现成的方法可以使用。
看到其提供了caches方法，其可以接收参数with参数，那么就可以直接利用了，方法如下
<blockquote>@client =Client.caches(:find_by_api_key,:with => api_key)</blockquote>

如果监控下日志，你会发现如下的日志：
<blockquote>Processing Android::Wallpapers::V3::PhotoController#share (for 192.168.1.103 at 2010-01-25 16:33:53) [GET]
  Parameters: {"api_key"=>"T3yQ0zcNmhpBwWUbfxeAmA", "id"=>"20", "user_id"=>"1"}
==> Got Client:find_by_api_key:T3yQ0zcNmhpBwWUbfxeAmA from cache. (0.00081)
  Client Columns (1.7ms)   SHOW FIELDS FROM `clients`
  Client Load Scrooged (0.3ms)   SELECT `clients`.`id` FROM `clients` WHERE (`clients`.`api_key` = 'T3yQ0zcNmhpBwWUbfxeAmA') LIMIT 1
==> Set Client:find_by_api_key:T3yQ0zcNmhpBwWUbfxeAmA to cache. (0.00352)
</blockquote>

很明显，非常方便！
