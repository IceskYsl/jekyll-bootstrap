---
layout: post
title: rails multi database,在Rails中一次连接多个数据库
date: '2010-3-6'
comments: true
categories: Database Ruby&Rails
tags: multi rails
link: true
---
有很多插件可以做这个事情，例如<a href="http://github.com/remi/use_db">use_db</a> ,<a href="http://magicmodels.rubyforge.org/magic_multi_connections/">magic_multi_connections</a>等等，但是也有更简单得方法，如下，2步就好了

1. 设置database的config
extradb_production:
adapter:     mysql
host:        localhost
username:    root
password:    blabla
database:    extradb_prod
2. 在相关得 Model 利用 estabilish_connection 去做连接即可
class lala &lt; ActiveRecord::Base
establish_connection :extradb_production
end
