---
layout: post
title: 保证上传文件名字的唯一性
date: '2007-5-20'
comments: true
categories: Ruby&Rails
link: true
---
上传文件是都需要用到的功能，可以用以下代码实现：src_filename = params[:file][:name] if !src_filename.original_filename.empty?   hashed_name = Digest::SHA1.hexdigest(Time.now.to_s)   filename = &quot;#{RAILS_ROOT}/public/attachments/&quot; + hashed_name + &quot;_&quot; + src_filename.original_filename   if File.open(filename, 'w'){ |f| f.write(src_filename.read) }       attachment = Attachment.new      attachment.name = src_filename.original_filename      attachment.hashed_name = hashed_name      attachment.size = src_filename.size      comment.attachments &lt;&lt; attachment   end  end 当然，还有做一些后缀校验等。。。
