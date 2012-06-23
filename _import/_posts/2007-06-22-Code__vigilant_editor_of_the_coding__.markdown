---
layout: post
title: 乱码,警惕编辑器的编码～
date: '2007-6-22'
comments: true
categories: Tips
link: true
---
今天没什么事情，写个小的问题分析系统，在数据库初始化的时候，用了&lt;code&gt;  def self.up    create_table :priorities do |t|    t.column :name, :string, :default =&gt; &quot;&quot;    t.column :desc, :string, :default =&gt; &quot;&quot;    end    Priority.new(:name=&gt;&quot;一级&quot;,:desc=&gt;&quot;很紧急,4-8小时完成&quot;).save    Priority.new(:name=&gt;&quot;二级&quot;,:desc=&gt;&quot;紧急,8-24小时完成&quot;).save    Priority.new(:name=&gt;&quot;三级&quot;,:desc=&gt;&quot;一般,24－48小时完成&quot;).save    Priority.new(:name=&gt;&quot;四级&quot;,:desc=&gt;&quot;不紧急,48小时以上&quot;).save    Priority.new(:name=&gt;&quot;不详&quot;,:desc=&gt;&quot;不详&quot;).save  end&lt;/code&gt;遇到下列错误bq. ./db/migrate//003_create_priorities.rb:10: Invalid char `\274' in expression./db/migrate//003_create_priorities.rb:10: Invalid char `\266' in expression./db/migrate//003_create_priorities.rb:10: Invalid char `\262' in expression./db/migrate//003_create_priorities.rb:10: Invalid char `\273' in expression./db/migrate//003_create_priorities.rb:10: Invalid char `\275' in expression./db/migrate//003_create_priorities.rb:10: syntax error, unexpected tIDENTIFIER, expecting kEND  Priority.new(:name=&gt;&quot;四级&quot;,:desc=&gt;&quot;不紧急，48小时以上&quot;).save真是ft，感觉是编码的问题，我数据库用的是UTF-8呀，我在environment.rb也加了$KCODE = 'u' require 'jcode'了呀，我在application.rb也写了:configure_charsets了下，我在数据库配置文件也加了encoding: utf8了呀。这个问题搞得我一肚子火，最后想到了，还有一处编码需要注意，那就是文件的编码，也就是把radrails的editor默认字符集改成utf-8。寒～真是ft，大家遇到类似问题千万记住呀，需要检查下面几个地方～ # 数据库编码 # application.rb # environment.rb # database.yml
