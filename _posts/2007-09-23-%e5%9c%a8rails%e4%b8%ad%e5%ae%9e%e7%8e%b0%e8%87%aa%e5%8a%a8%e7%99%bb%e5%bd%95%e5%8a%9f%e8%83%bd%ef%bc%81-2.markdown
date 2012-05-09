--- 
layout: post
comments: true
title: !binary |
  5ZyoUmFpbHPkuK3lrp7njrDoh6rliqjnmbvlvZXlip/og73vvIE=

date: 2007-9-23
link: false
categories: life
---
<p>做WEB开发的都知道log的重要性，开发过java的肯定知道<u>log4j</u>等日志记录工具，使用起来非常方便的；RoR下发开发自然也少不了日志的应用，刚刚开始的那会把日志都写到一个文件里，很恐怖的说，后来查了些资料，可以看到ROR默认的log是可以分级别的，记录如下：<br />
<br />
<strong>日志级别（Log Level）</strong><br />
Rails可以通过选择不同的log lever来控制log文件的输出，可以使用的log lever有<u>:debug, :info, :warn,:error, :fatal.</u><br />
<strong>:debug</strong> level提供最详细的log, 可以将每一条sql都记录下来。<br />
<strong>:info&nbsp;</strong> level是production环境下的默认设置，不会写出sql的执行情况，但也会很详细，如果是ActiveMailer，它会记录下每封信的内容，Log文件内容就是快速增长。<br />
为了避免Log把空间塞满的情况发生，要注意定期清除Log，另外是选择:warn level等log level, 只记录重要的信息.<br />
<br />
<strong>设置方法：</strong><br />
在/config/environment.rb文件中可以设置以下选项<br />
config.log_level = :debug<br />
如果只希望在production环境下，输入少量的log,<br />
则只需要在config/environments/production.rb中增加一项（我就是这样设置的）<br />
config.log_level = :warn</p>
