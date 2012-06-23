---
layout: post
title: Get_POSSIBLE_BREAK-IN_ATTEMPT_msg_when_i_ssh_to_s_server
date: '2009-6-19'
comments: true
categories: 技术归总 Mac&*UNIX
link: true
---
<p>when i ssh to a server,i get some message like this：</p>
<p>Address 192.168.5.12 maps to localhost, but this does not map back to the address - POSSIBLE BREAKIN ATTEMPT!</p>
<p><strong>Solution：</strong></p>
<p>Modify the &quot;/etc/ssh/ssh_config&quot; file at localhost</p>
<p>&nbsp;GSSAPIAuthentication no</p>
<p>exp：</p>
<p>ssh 192.168.1.110时报错上述错，本地是192.168.1.20 ，则修改本地192.168.1.20中的/etc/ssh/ssh_config，把参数GSSAPIAuthentication no修改就可以了。。或者修改服务器端192.168.1.110上的/etc/ssh/sshd_config ，把参数GSSAPIAuthentication no改了也可以。要注意的是/etc/ssh/ssh_config和/etc/ssh/sshd_confg的区别。</p>
