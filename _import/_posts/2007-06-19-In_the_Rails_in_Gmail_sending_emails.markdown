---
layout: post
title: 在Rails中用Gmail发送邮件
date: '2007-6-19'
comments: true
categories: Ruby&Rails
tags: Gmail
link: true
---
在rails中配置发送邮件还是比较简单的，但是由于rails还不支持TLS，也就是说默认的情况下是不可以通过gmail来发送邮件的，还好，老外改写了一个类库，使得我们可以使用gmail来发送了。步骤如下：1、把附件smtp_tls.rb放在你的/lib/smtp_tls.rb下。2.然后在你的environment.rb中添加require ‘smtp_tls’3.配置邮件服务器&lt;code&gt;ActionMailer::Base.server_settings = {:address =&gt; &quot;smtp.gmail.com&quot;,:port =&gt; &quot;587&quot;,:domain =&gt; &quot;localhost.localdomain&quot;,:authentication =&gt; :plain,:user_name =&gt; &quot;someusername&quot;,:password =&gt; &quot;somepassword&quot;}&lt;/code&gt;需要注意的是，该版本只支持ruby1.8.4及其以上版本。参考：http://blog.pomozov.info/posts/how-to-send-actionmailer-mails-to-gmailcom.html
