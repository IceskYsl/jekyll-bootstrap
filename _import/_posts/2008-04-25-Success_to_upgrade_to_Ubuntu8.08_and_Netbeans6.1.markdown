---
layout: post
title: 成功升级到Ubuntu8.08和Netbeans6.1
date: '2008-4-25'
comments: true
categories: Ruby&Rails
link: true
---
<p>正如前面的这篇文章说的,Ubuntu8.04和NB6.1都发布了,我自然得抓紧升级了,正好今天调班在家休息,一觉睡到12点多,起来开始升级,先把重要的资料备份到另外一台电脑上,然后按照google出来的资料升级,我是用命令行升级的.</p>
<p>1.修改源地址</p>
<p>我以前的源很乱,正好这次一并清理下,把以前的 710的时候的源备份下,然后测了下google出来的那些源,选了个台湾的最快,(后来升级的时候发现这个源上有几个包当时下载不了,后来又加了一组上海电信的源)</p>
<p>sudo gedit /etc/apt/sources.list</p>
<p>
<div class="codeText">
<div class="codeHead">这是我使用的源</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>deb&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></span></li>
    <li class=""><span>deb-src&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-updates&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb-src&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-updates&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-backports&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb-src&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-backports&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-security&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb-src&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-security&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-proposed&nbsp;main&nbsp;multiverse&nbsp;restricted&nbsp;universe&nbsp;&nbsp;</span></li>
    <li class=""><span>deb-src&nbsp;http://ubuntu.csie.ntu.edu.tw/ubuntu/&nbsp;hardy-proposed&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>deb&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb-src&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-updates&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb-src&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-updates&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-backports&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb-src&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-backports&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-security&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb-src&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-security&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
    <li class=""><span>deb&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-proposed&nbsp;main&nbsp;multiverse&nbsp;restricted&nbsp;universe&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb-src&nbsp;http://mirror.vmmatrix.net/ubuntu/&nbsp;hardy-proposed&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>deb&nbsp;http://archive.ubuntu.org.cn/ubuntu-cn/&nbsp;hardy&nbsp;main&nbsp;restricted&nbsp;universe&nbsp;multiverse&nbsp;&nbsp;</span></li>
</ol>
</div>
其他的请参考:http://hi.baidu.com/jmlover/blog/item/3b2e3bf3cd0e0b54352accd9.html</p>
<p>2.执行升级命令</p>
<p>sudo apt-get update</p>
<p>sudo apt-get&nbsp; upgrade</p>
<p>3.修复相关问题</p>
<p>由于我是使用Xfce的,所以最开始升级的时候忘记升级相应的xfce了,导致后来启动的时候,没有UI界面,并遇到了scree not found的问题;然后修复了小企鹅输入法的方块问题,并做了些美化.</p>
<p>这些问题google都是可以找到答案的,我也没具体记是咋整的,呵呵,反正是可以解决的.</p>
<p>4.安装了NB6.1版本</p>
<p>差不多搞了一下午,,中途睡了一觉,遇到一些问题都解决了,呵呵,但没感觉到8.04的有啥不一样的地方,哈哈..</p>
<p>&nbsp;</p>
