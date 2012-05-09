--- 
layout: post
comments: true
title: !binary |
  5ZyoUnVieeS4reiwg+eUqOezu+e7n+eahHNoZWxs5ZG95Luk55qE5byC5bi4

date: 2008-4-8
link: false
categories: life
---
<p>最近有点蹊跷,老是遇到一些莫名其妙的问题,呵呵,折腾吧.今天要说的问题是,在ruby中调用系统(*UNIX)中的shell命令来做些事情,本来没啥难度的事情,我却遇到了一个费解的问题.</p>
<p><strong>问题描述:</strong></p>
<p>由于需要给用户打包下载一系列的文件(图片),为了方便,我在ruby中调用系统的rar来打包需要下载的资源,然后再send_file下载下去,但是这里却遇到了奇怪的问题,调用系统命令的那句出现问题.</p>
<p>关于在RUby中调用系统的shell,大家可以参考如下文章( 6 Ways to Run Shell Commands in Ruby: http://pasadenarb.com/2007/03/ruby-shell-commands.html#comment-1886),我就不多废话了.直接看我的相关代码,如下:</p>
<p>
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>local_dir_name=1207667932_2&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger.info(<span class="string">&quot;rar&nbsp;a&nbsp;#{local_dir_name}&nbsp;#{local_dir_name}&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>oo=&nbsp;%x{rar&nbsp;a&nbsp;<span class="comment">#{local_dir_name}&nbsp;#{local_dir_name}}</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>logger.info(<span class="string">&quot;oo=#{oo}&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
上面的那个变量是按照时间取的唯一标识.这里使用的 %x{}(`)来获取执行的结果,以方便查看及问题定位,在本地机器(Ubuntu 7.10)上,一切正常,输出如下:
<div class="codeText">
<div class="codeHead">本地输出日志</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>rar&nbsp;a&nbsp;1207667932_2&nbsp;1207667932_2&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="attribute">oo</span><span>=&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="attribute-value">RAR</span><span>&nbsp;3.70&nbsp;beta&nbsp;1&nbsp;Copyright&nbsp;(c)&nbsp;1993-2007&nbsp;Alexander&nbsp;Roshal&nbsp;8&nbsp;Jan&nbsp;2007&nbsp;&nbsp;</span></span></li>
    <li class=""><span>Shareware&nbsp;version&nbsp;Type&nbsp;RAR&nbsp;-?&nbsp;for&nbsp;help&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>Evaluation&nbsp;copy.&nbsp;Please&nbsp;register.&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>Creating&nbsp;archive&nbsp;1207667932_2.rar&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>Adding&nbsp;1207667932_2/datas.csv&nbsp;OK&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Adding&nbsp;1207667932_2/images&nbsp;OK&nbsp;&nbsp;</span></li>
    <li class=""><span>Adding&nbsp;1207667932_2&nbsp;OK&nbsp;&nbsp;</span></li>
    <li class="alt"><span>Done&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>但是在服务器上 (这里使用的是DH的PS服务器),其不能正常运行,如下:</p>
<p>
<div class="codeText">
<div class="codeHead">服务器输出日志</div>
<ol start="1" class="dp-xml">
    <li class="alt"><span><span>rar&nbsp;a&nbsp;1207666290_2&nbsp;1207666290_2&nbsp;&nbsp;</span></span></li>
    <li class=""><span><span class="attribute">oo</span><span>=&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span><span class="attribute-value">Program</span><span>&nbsp;aborted&nbsp;&nbsp;</span></span></li>
</ol>
</div>
可以看到,如上发生了异常,但是原因无法得知.</p>
<p><strong>问题分析:</strong></p>
<p>奇怪的很,查了下环境,没啥不一样的呀,唯一发现不一样的是rar的版本不咋一致,DH上的rar版本比较老,分别如下:
<div class="codeText">
<div class="codeHead">RAR的版本信息</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>Localhost&nbsp;rar&nbsp;version&nbsp;is&nbsp;:&nbsp;&nbsp;</span></span></li>
    <li class=""><span>RAR&nbsp;3.70&nbsp;beta&nbsp;1&nbsp;Copyright&nbsp;(c)&nbsp;1993-2007&nbsp;Alexander&nbsp;Roshal&nbsp;8&nbsp;Jan&nbsp;2007&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;</span></li>
    <li class=""><span>DH's&nbsp;rar&nbsp;version&nbsp;is&nbsp;:&nbsp;&nbsp;</span></li>
    <li class="alt"><span>[iceskysl]$&nbsp;rar&nbsp;&nbsp;</span></li>
    <li class=""><span>&nbsp;&nbsp;</span></li>
    <li class="alt"><span>RAR&nbsp;3.30&nbsp;Copyright&nbsp;(c)&nbsp;1993-2004&nbsp;Eugene&nbsp;Roshal&nbsp;22&nbsp;Jan&nbsp;2004&nbsp;&nbsp;</span></li>
</ol>
</div>
</p>
<p>这难道会是原因,还真搞不清?难道DH上对进程啥的有特殊要求,还是其他的啥原因呢?有知道的朋友,请赐教,多谢了.</p>
<p>参考文章:http://pasadenarb.com/2007/03/ruby-shell-commands.html#comment-1886</p>
