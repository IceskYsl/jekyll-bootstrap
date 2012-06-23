---
layout: post
title: 在crontab中调用rake task定时跑job
date: '2008-10-25'
comments: true
categories: Mac&*UNIX
link: true
---
在Rails中可以使用很大插件来实现后台定时JOB，但是最环保的应该是使用crontab来调用rake，也很简单，基本上分成如下几步：

in the root of my app i have notify_answerers.sh
{% codeblock %}#!/bin/shexport PATH='/usr/local/ruby/bin':$PATH  cd /opt/dev/Monier/usr/local/ruby/bin/rake  nginx:fetch_status  RAILS_ENV=production{% endcodeblock %}
in myapp/lib/tasks i have myapp.rake
{% codeblock %}namespace :nginx do  desc "Notify answerers of new questions"  task :fetch_status =&gt; :environment do    Nginx.find(:all).each do |nginx|      puts "nginx=#{nginx.name}"      nginx.do_fetch_nginx_status_job      nginx.update_attribute(:updated_at,Time.now)    end  endend{% endcodeblock %}
In my cron file i have:
{% codeblock %}*/2 * * * * /bin/sh /opt/dev/Monier/lib/crontabs/fetch_nginx_status.sh{% endcodeblock %}
(use "crotab -e" on the server to edit this file)
