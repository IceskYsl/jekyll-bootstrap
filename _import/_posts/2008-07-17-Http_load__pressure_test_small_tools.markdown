---
layout: post
title: http_load:压力测试小工具
date: '2008-7-17'
comments: true
categories: Mac&*UNIX Tips
link: true
---
命令行工具<a href="http://www.acme.com/software/http_load/">http_load</a>看上去和<a href="http://www.ooso.net/?tag=apache">apache</a>的ab很相似，用来做网站的压力测试。其主要用法为：

<span style="text-decoration: underline;">1.http_load -parallel 5 -fetches 1000 urls.txt
2.http_load -rate 2 -seconds 300 urls.txt</span>
例子只是个参考，参数其实可以自由组合，参数之间的选择并没有什么限制。比如你写成http_load -parallel 5 -seconds 300 urls.txt也是可以的。我们把参数给大家简单说明一下。
-parallel 简写-p ：含义是并发的用户进程数。
-fetches 简写-f ：含义是总计的访问次数
-rate    简写-p ：含义是每秒的访问频率
-seconds简写-s ：含义是总计的访问时间

url 是你要访问的网址名，参数可以是单个的网址也可以使包含网址的文件。文件格式如下
<blockquote>http://iceskysl.1sters.com/?action=show&amp;id=336
http://iceskysl.1sters.com/?action=show&amp;id=335
http://iceskysl.1sters.com/?action=show&amp;id=332
http://iceskysl.1sters.com/?action=show&amp;id=32</blockquote>
参数了解了，我们来看运行一条命令来看看它的返回结果

命令：% <strong><em>./http_load -rate 5 -seconds 10 urls</em></strong>
说明执行了一个持续时间10秒的测试，每秒的频率为5。
<blockquote>49 fetches, 2 max parallel, 289884 bytes, in 10.0148 seconds
5916 mean bytes/connection
4.89274 fetches/sec, 28945.5 bytes/sec
msecs/connect: 28.8932 mean, 44.243 max, 24.488 min
msecs/first-response: 63.5362 mean, 81.624 max, 57.803 min
HTTP response codes:
code 200 -- 49</blockquote>
<strong>结果分析：</strong>
1．49 fetches, 2 max parallel, 289884 bytes, in 10.0148 seconds
说明在上面的测试中运行了49个请求，最大的并发进程数是2，总计传输的数据是289884bytes，运行的时间是10.0148秒
2．5916 mean bytes/connection
说明每一连接平均传输的数据量289884/49=5916
3．4.89274 fetches/sec, 28945.5 bytes/sec
说明每秒的响应请求为4.89274，每秒传递的数据为28945.5 bytes/sec
4．msecs/connect: 28.8932 mean, 44.243 max, 24.488 min
说明每连接的平均响应时间是28.8932 msecs，最大的响应时间44.243 msecs，最小的响应时间24.488 msecs
5．msecs/first-response: 63.5362 mean, 81.624 max, 57.803 min
6、HTTP response codes: code 200 -- 49

说明打开响应页面的类型，如果403的类型过多，那可能要注意是否系统遇到了瓶颈。
特殊说明：这里，我们一般会关注到的指标是fetches/sec、msecs/connect
他们分别对应的常用性能指标参数
Qpt-每秒响应用户数和response time，每连接响应用户时间。
测试的结果主要也是看这两个值。当然仅有这两个指标并不能完成对性能的分析，我们还需要对服务器的cpu、men进行分析，才能得出结论

参考文档：

http://www.ooso.net/index.php/archives/219

http://www.acme.com/software/http_load/
