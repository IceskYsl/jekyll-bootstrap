---
layout: post
title: install_and_configuration__vsftpd_ftp_service_on_Ubuntu_Linux
date: '2008-6-17'
comments: true
categories: Ruby&Rails
link: true
---
<p><span style="color: rgb(255, 0, 0);">Q</span>. How do I install Ubuntu ftp service or server?</p>
<p><span style="color: rgb(0, 153, 0);">A.</span> Ubuntu Linux comes with various ftp servers to setup FTP service such as:<br />
=&gt; <strong>proftpd</strong> - Versatile, virtual-hosting FTP daemon</p>
<p>=&gt; <strong>vsftpd</strong> - The Very Secure FTP Daemon</p>
<p>=&gt; <strong>ftpd</strong> - FTP server</p>
<p>=&gt; <strong>wu-ftpd</strong> - powerful and widely used FTP server</p>
<p>=&gt; <strong>wzdftpd</strong> - A portable, modular, small and efficient ftp server</p>
<p>=&gt; <strong>pure-ftpd</strong> - Pure-FTPd FTP server</p>
<p>其中vsftpd相当优秀，其配置简单方便，且非常安全，如下是其主页上的说明：</p>
<p>vsftpd is the Very Secure File Transfer Protocol Daemon. The server can be launched via a super-server such as inetd or xinetd. Alternatively, vsftpd can be launched in standalone mode, in which case vsftpd itself will listen on the network.</p>
<p>=&gt; Default ftp port : <strong>21</strong><br />
=&gt; Default configuration file : <strong>/etc/vsftpd.conf</strong></p>
<p><strong>Q：如何安装vsftpd</strong></p>
<p><strong>很简单，即可搞，如下：<br />
</strong></p>
### Step # 1: Install vsftpd
<p>Type apt-get command to install vsftpd<br />
<strong>{% codeblock %}$ sudo apt-get install vsftpd{% endcodeblock %}</strong><br />
Output:</p>
<blockquote>
{% codeblock %}Password:<br />Reading package lists... Done<br />Building dependency tree<br />Reading state information... Done<br />The following NEW packages will be installed:<br />  vsftpd<br />0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.<br />Need to get 121kB of archives.<br />After unpacking 438kB of additional disk space will be used.<br />Get:1 http://us.archive.ubuntu.com edgy/main vsftpd 2.0.4-0ubuntu5 [121kB]<br />Fetched 121kB in 0s (246kB/s)<br />Selecting previously deselected package vsftpd.<br />(Reading database ... 31396 files and directories currently installed.)<br />Unpacking vsftpd (from .../vsftpd_2.0.4-0ubuntu5_amd64.deb) ...<br />Setting up vsftpd (2.0.4-0ubuntu5) ...<br />Adding system user `ftp' with uid 106...<br />Adding new user `ftp' (106) with group `nogroup'.<br />Not creating home directory `/home/ftp'.<br /> * Starting FTP server: vsftpd{% endcodeblock %}
</blockquote>
### Step # 2: Configure /etc/vsftpd.conf
<p>The default vsftpd configuration file is /etc/vsftpd.conf. You need to edit this file using text editor such as vi:<br />
<strong>{% codeblock %}$ sudo vi /etc/vsftpd.conf{% endcodeblock %}</strong></p>
<p>Add the following line (uncomment line) to the vsftpd configuration file:<br />
<strong>{% codeblock %}local_enable=YES{% endcodeblock %}</strong><br />
Above config directive will allow local users to log in via ftp</p>
<p>If you would like to allow users to upload file, add the following to the file:<br />
<strong>{% codeblock %}write_enable=YES{% endcodeblock %}</strong></p>
<p>For security you may restrict local users to their home directories. Add the following to the file:<br />
<strong>{% codeblock %}chroot_local_user=YES{% endcodeblock %}</strong></p>
<p>Save and close the file.</p>
### Step # 3: Restart vsftpd
<p>To restart vsftpd type the command :<br />
<strong>{% codeblock %}$ sudo /etc/init.d/vsftpd restart{% endcodeblock %}</strong><br />
Output:</p>
{% codeblock %}* Stopping FTP server: vsftpd                                                                                       [ ok ]<br /> * Starting FTP server: vsftpd                                                                                       [ ok ]<br /><br />add following rules to your iptables script. Assuming that default<br />incoming policy is drop. If protocol is TCP and destination port is 21<br />(ftp):<br /><br /><em>{% codeblock %}iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT{% endcodeblock %}</em><br /><br />See - <a href="http://www.cyberciti.biz/faq/iptables-open-ftp-port-21/">How do I open open ftp port 21 using iptables</a> for more information.{% endcodeblock %}
<p>There are a large number of other configuration options available for vsftpd that can be used to fine tune ftp server. Read vsftpd.conf man page by typing following command:<br />
<strong>{% codeblock %}$ man vsftpd.conf{% endcodeblock %}</strong></p>
{% codeblock %}参考文档：<br />1、http://www.cyberciti.biz/faq/ubuntu-vsftpd-ftp-service-server/<br />2、http://school.cfan.com.cn/system/unix/2008-06-16/1213603744d188509.shtml{% endcodeblock %}
