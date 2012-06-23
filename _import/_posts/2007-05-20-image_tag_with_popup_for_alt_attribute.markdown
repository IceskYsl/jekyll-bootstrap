---
layout: post
title: image_tag_with_popup_for_alt_attribute
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
Firefox doesn't display a popup for the alt attribute for images. While this is according to spec, it's slightly annoying to put the same text in both the alt and the title. Put the following in your ApplicationHelper to copy the alt to the title for every image. Please don't tell me how wrong this is. I don't care.module ApplicationHelper  def image_tag(location, options)    options[:title] ||= options[:alt]    super(location, options)  endend
