--- 
layout: post
comments: true
title: !binary |
  Q29ubmVjdGlvbiByZWZ1c2VkOiBTbGljZUhvc3TkuIpTU0jnmbvlvZXpl67p
  opg=

date: 2008-8-20
link: false
categories: life
---
N久前买的slicehost上一个VPN，上面跑了一个mysql，和mongrel，好久没SSH上去了，今天SSH的时候老是被拒绝<em>“port 22: Connection refused”</em>，真是怪异，开始以为是我把sshd的端口改了，赶紧使用web console连上去看看，先{% codeblock %}nano /etc/ssh/sshd_config看到的端口还是22，并没有修改。{% endcodeblock %}

{% codeblock %}接着看是不是限制了登录，发现也没有，再检查iptables发现也没有阻拦22端口，怪异哦。最后使用netstat -antp看下端口，发现没有22,寒，难道sshd没启动，赶紧启动下：{% endcodeblock %}<strong><span class="f15 b0">/etc/init.d/ssh start</span></strong>

然后再查下端口，有了：
<pre class="term"><span class="f15 b0">root@iceskysl:/var/log# /etc/init.d/ssh start</span><span class="f7 b0">                                                                             </span><span class="f15 b0"> * Starting OpenBSD Secure Shell server sshd       </span><span class="f7 b0">                      </span><span class="f15 b0">[ OK ] </span><span class="f7 b0">                                        </span><span class="f15 b0">root@iceskysl:/var/log# netstat -antp</span><span class="f7 b0">                                                                                     </span><span class="f15 b0">Active Internet connections (servers and established)</span><span class="f7 b0">                                                                   </span><span class="f15 b0">Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name</span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 127.0.0.1:9000          0.0.0.0:*               LISTEN      6427/ruby1.8    </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 127.0.0.1:9001          0.0.0.0:*               LISTEN      6430/ruby1.8    </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      8985/mysqld     </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      8561/nginx      </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 127.0.0.1:7000          0.0.0.0:*               LISTEN      9191/ruby1.8    </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 127.0.0.1:7001          0.0.0.0:*               LISTEN      9194/ruby1.8    </span><span class="f7 b0">                        </span><span class="f15 b0">tcp        0      0 0.0.0.0:25              0.0.0.0:*               LISTEN      3266/master     </span><span class="f7 b0">                        </span><span class="f15 b0">tcp6       0      0 :::22                   :::*                    LISTEN      15682/sshd      </span><span class="f7 b0">                        </span><span class="f15 b0">root@iceskysl:/var/log# </span><span class="f7 b1"> </span><span class="f7 b0">  再试试，可以SSH连上去了，真够折腾的。幸好slicehost还有个web console，要不然咋整？ 紧接着做下iptables，限制下登录。                                                          </span>{% endcodeblock %}
