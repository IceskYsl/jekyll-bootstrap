---
layout: post
title: 在Rails中定期清理垃圾数据
date: '2007-12-8'
comments: true
categories: Ruby&Rails
link: true
---
<p>linux上用来清除长时不用的session的cron命令：<br />
$RAILS_APP_DIR/script/runner 'ActiveRecord::Base.connection.delete(&quot;DELETE FROM sessions WHERE updated_at &lt; now() - INTERVAL 1 HOUR&quot;)<br />
<br />
参考：<br />
http://rubyasylum.com/articles/2006/06/04/cron-job-tips-for-rails<br />
http://www.cslog.cn/articles/search?q=sessions</p>
