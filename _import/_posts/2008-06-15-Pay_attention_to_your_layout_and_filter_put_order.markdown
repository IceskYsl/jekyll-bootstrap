---
layout: post
title: 留意你的layout和filter的摆放顺序
date: '2008-6-15'
comments: true
categories: Ruby&Rails
link: true
---
<p>前几天发现Rails的log里面老是出现一些按照ID找不到记录的错误，如下：</p>
<p><em>ActiveRecord::RecordNotFound (Couldn't find User without an ID):<br />
&nbsp;&nbsp;&nbsp; /usr/lib/ruby/gems/1.8/gems/activerecord-2.0.2/lib/active_record/base.rb:1248:in `find_from_ids'<br />
&nbsp;&nbsp;&nbsp; /usr/lib/ruby/gems/1.8/gems/activerecord-2.0.2/lib/active_record/base.rb:504:in `find'<br />
&nbsp;&nbsp;&nbsp; /app/models/right.rb:7:in `chech_right'<br />
&nbsp;&nbsp;&nbsp; /app/controllers/home_controller.rb:30:in `check_right'</em></p>
<p>奇怪了，这个是我用来做权限控制的，按照道理来说，这个如果未登录的话，应该会被before_filter定向到其他的地方去的，咋会还显示这个页面呢，原来以为Rails会丢失<strong>session</strong>中的东西，不过仔细想想可能性不大，于是仔细检查了下代码，发现问题的根源是before_filter和layout的摆放顺序有问题，竟然是这样摆放的：</p>
<blockquote><strong>&nbsp; layout &quot;back&quot; </strong><br />
&nbsp; before_filter :get_current_user<br />
&nbsp; before_filter :authorize<br />
&nbsp; before_filter :init_user<br />
&nbsp; before_filter :check_right<br />
</blockquote>
<p>看到其上面的layout竟然放在&nbsp; before_filter之前了，哦，原来如此，修改下顺序，现在为：</p>
<blockquote>&nbsp; before_filter :get_current_user<br />
&nbsp; before_filter :authorize<br />
&nbsp; before_filter :init_user<br />
&nbsp; before_filter :check_right<br />
<strong>&nbsp; layout &quot;back&quot;&nbsp;</strong></blockquote>
<p>重启服务，OK，搞定。</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
