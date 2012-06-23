---
layout: post
title: SuperRedCloth介绍～
date: '2007-5-22'
comments: true
categories: Ruby&Rails
link: true
---
SuperRedCloth项目就是开发中的RedCloth，也就是RedCloth 4。目标是尽可能地增强RedCloth：   1. 令到RedCloth比原来小2/3   2. 一般情况下将会快10倍以上   3. 消除Textile格式中的二义性安装：$ gem install superredcloth --source http://code.whytheluckystiff.net使用：1.首先在helpers/application_helper.rb 中覆盖textilize方法（这个方法在Rails 1.2中使用的是RedCloth），我们覆盖它，如下：&lt;code&gt;  def textilize(text)    require_library_or_gem &quot;superredcloth&quot; unless Object.const_defined?(:SuperRedCloth)    if text.blank?      &quot;&quot;    else      textilized = SuperRedCloth.new(text)      textilized.to_html    end  end # def textilize&lt;/code&gt;2.然后在VIEW可以直接使用，如：&lt;code&gt;&lt;%= textilize @page.body %&gt;&lt;/code&gt;官方主页：http://code.whytheluckystiff.net/redcloth/wiki/SuperRedCloth
