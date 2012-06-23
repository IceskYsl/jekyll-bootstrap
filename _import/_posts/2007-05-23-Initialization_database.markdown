---
layout: post
title: 初始化数据库
date: '2007-5-23'
comments: true
categories: Database
link: true
---
我们使用创建表的时候，是不想想初始化一些数据呢，比如一个默认的分类什么的，可以使用migration按照下面这个来实现： &lt;code&gt;  def self.up    create_table :words do |t|      t.column :eng, :string      t.column :pl, :string    end        Word.new(:eng=&gt;'yes', :pl=&gt;'tak').save    Word.new(:eng=&gt;'no', :pl=&gt;'nie').save    Word.new(:eng=&gt;'everything', :pl=&gt;'wszystko').save  end  def self.down    drop_table :words  end&lt;/code&gt;
