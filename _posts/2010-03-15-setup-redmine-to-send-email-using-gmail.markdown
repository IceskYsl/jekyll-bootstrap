--- 
layout: post
comments: true
title: Setup Redmine to send email using GMail
date: 2010-3-15
link: false
categories: life
---
Redmine是用Rails写的一套很不错的项目管理系统，其提供了诸多很方便实用的功能，诸如里程碑管理，BUG跟踪，代码库变更管理等等。
搭建以后在管理面板中测试邮件不通，主要原因是由于采用的Gmail的邮箱，于是找到一些解决方案，如下：
<strong>1. Install the action_mailer_optional_tls plugin</strong>
The action_mailer_optional_tls_plugin adds a TLS option to Redmine's emailing library, ActionMailer. TLS is a version of SSL which is required by GMail in order to send email.

To install this plugin, use the script/plugin command in your Redmine directory:
  ./script/plugin install git://github.com/collectiveidea/action_mailer_optional_tls.git

<strong>2. Configure your email.yml</strong>
# File: config/email.yml
production:
   delivery_method: :smtp
   smtp_settings:
     tls: true
     address: "smtp.gmail.com"
     port: 587
     domain: "www.YOURDOAMIN.com" # 'your.domain.com' for GoogleApps
     authentication: :plain
     user_name: "username@youdomain.com"
     password: "password"

<strong>3. Start up Redmine and test your Email</strong>
Next it's time to start up Redmine and to send a test email. Make sure that you start Redmine in the same mode as you configured above (e.g. production). To send a test email:
Login as an administrator
Go to the Administration panel
Go into the Settings and select the "Email notifications" tab
In the bottom right, click the link to "Send a test email"
