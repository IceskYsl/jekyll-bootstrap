---
layout: post
title: acts_as_taggable_on_steroids 与 will_paginate 的整合分页
date: '2010-3-24'
comments: true
categories: Ruby&Rails
tags: acts_as_taggable_on_steroids ruby will_paginate
link: true
---
用了acts_as_taggable_on_steroid和will_paginate插件，发现不能分页，查找解决办法，如下得最方便：
options = Product.find_options_for_find_tagged_with(params[:tag_name],:order => "updated_at DESC").merge(:page => params[:page] ||1,:per_page =>20 )
@products = Product.paginate(options)
