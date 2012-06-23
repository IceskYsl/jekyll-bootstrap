---
layout: post
title: expire_list_cache_in_cache_fu
date: '2010-3-25'
comments: true
categories: Ruby&Rails
tags: cache_fu expire rails
link: true
---
cache_fu在过期单个记录的时候很方便，但是对以那些列表分页的就有点弱了，没法过滤以制定前缀的key来过滤，所以变通下，需要用过loop来过滤，如下是个例子：

{% codeblock %}#expire_list_cache
  def expire_caches
    Song.expire_cache(self.id)
    ApkFile.expire_cache(self.main_apk_file_id) if self.main_apk_file_id
    AppStat.expire_cache("app_stat#{self.id}")
    0.upto(PAGES) do |page|
      SongScreenshot.expire_cache("song_screenshots#{self.id}#{page}#{PER_PAGE}")
      Song.expire_cache("list_items_status_state:11#{"updated_at desc"}#{page}#{PER_PAGE}")
      Song.expire_cache("list_items_in_category_status_state:#{self.category_id}11#{"updated_at desc"}#{page}#{PER_PAGE}")
      Song.expire_cache("items_in_autthor:#{self.author_id}11#{"updated_at desc"}#{page}#{PER_PAGE}")
    end
  end{% endcodeblock %}
