--- 
layout: post
comments: true
title: "acts_as_taggable_on_steroids \xE4\xB8\x8E will_paginate \xE7\x9A\x84\xE6\x95\xB4\xE5\x90\x88\xE5\x88\x86\xE9\xA1\xB5"
date: 2010-3-24
link: false
categories: life
---
用了acts_as_taggable_on_steroid和will_paginate插件，发现不能分页，查找解决办法，如下得最方便：
options = Product.find_options_for_find_tagged_with(params[:tag_name],:order => "updated_at DESC").merge(:page => params[:page] ||1,:per_page =>20 )
@products = Product.paginate(options)
