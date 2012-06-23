---
layout: post
title: 使用gnuplot配合AB绘制性能测试结果图
date: '2008-9-8'
comments: true
categories: Tips
link: true
---
Apache的<strong>AB</strong>可以用来做一些性能测试，使用<em><strong>-g</strong></em>参数其结果可以输出到文件，然后使用gnuplot可以绘制相关图片，以更直观的显示。
<div class="codeText">
<div class="codeHead">ab -h</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>$ ab -h  </span></span></li>
	<li><span>Usage: ab [options] [http://]hostname[:port]/path  </span></li>
	<li class="alt"><span>Options are:  </span></li>
	<li><span>    -n requests     Number of requests to perform  </span></li>
	<li class="alt"><span>    -c concurrency  Number of multiple requests to make  </span></li>
	<li><span>    -t timelimit    Seconds to max. wait for responses  </span></li>
	<li class="alt"><span>    -p postfile     File containing data to POST  </span></li>
	<li><span>    -T content-type Content-type header for POSTing  </span></li>
	<li class="alt"><span>    -v verbosity    How much troubleshooting info to print  </span></li>
	<li><span>    -w              Print out results in HTML tables  </span></li>
	<li class="alt"><span>    -i              Use HEAD instead of GET  </span></li>
	<li><span>    -x attributes   String to insert as table attributes  </span></li>
	<li class="alt"><span>    -y attributes   String to insert as tr attributes  </span></li>
	<li><span>    -z attributes   String to insert as td or th attributes  </span></li>
	<li class="alt"><span>    -C attribute    Add cookie, eg. '<span class="attribute">Apache</span><span>=</span><span class="attribute-value">1234</span><span>. (repeatable)  </span></span></li>
	<li><span>    -H attribute    Add Arbitrary header line, eg. 'Accept-Encoding: gzip'  </span></li>
	<li class="alt"><span>                    Inserted after all normal header lines. (repeatable)  </span></li>
	<li><span>    -A attribute    Add Basic WWW Authentication, the attributes  </span></li>
	<li class="alt"><span>                    are a colon separated username and password.  </span></li>
	<li><span>    -P attribute    Add Basic Proxy Authentication, the attributes  </span></li>
	<li class="alt"><span>                    are a colon separated username and password.  </span></li>
	<li><span>    -X proxy:port   Proxyserver and port number to use  </span></li>
	<li class="alt"><span>    -V              Print version number and exit  </span></li>
	<li><span>    -k              Use HTTP KeepAlive feature  </span></li>
	<li class="alt"><span>    -d              Do not show percentiles served table.  </span></li>
	<li><span>    -S              Do not show confidence estimators and warnings.  </span></li>
	<li class="alt"><span>    -g filename     Output collected data to gnuplot format file.  </span></li>
	<li><span>    -e filename     Output CSV file with percentages served  </span></li>
	<li class="alt"><span>    -h              Display usage information (this message)  </span></li>
</ol>
</div>
&nbsp;
<div id="nrr1" style="margin-top: 0px; margin-bottom: 0px;">$ab -g http_benchmark.txt -n 1000 -c 100 http://1stlog.1sters.com/</div>
<div id="hsfd1" style="margin-top: 0px; margin-bottom: 0px;">
<div class="codeText">
<div class="codeHead">http_benchmark.txt</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>$ more http_benchmark.txt  </span></span></li>
	<li><span>starttime       seconds ctime   dtime   ttime   wait  </span></li>
	<li class="alt"><span>Mon Sep 08 11:15:52 2008        1220843752427648        516     94524   95040   94521  </span></li>
	<li><span>Mon Sep 08 11:15:52 2008        1220843752944235        525     94500   95025   93995  </span></li>
	<li class="alt"><span>Mon Sep 08 11:15:53 2008        1220843753469652        520     94491   95011   93475  </span></li>
	<li><span>Mon Sep 08 11:15:53 2008        1220843753990129        514     94478   94992   92960  </span></li>
	<li class="alt"><span>Mon Sep 08 11:15:54 2008        1220843754505018        511     94471   94982   92449  </span></li>
	<li><span>Mon Sep 08 11:15:55 2008        1220843755016428        523     100439  100962  91925  </span></li>
</ol>
</div>
</div>
<div id="uav2" style="margin-top: 0px; margin-bottom: 0px;">
{% codeblock %}1sters@iceskysl:~&gt; gnuplotset terminal pngset output "http_benchmark.png"set xlabel "request"set ylabel "ms"plot "http_benchmark.txt" using 7 with lines title "ctime", \ "http_benchmark.txt" using 8 with lines title "dtime", \ "http_benchmark.txt" using 9 with lines title "ttime", \"http_benchmark.txt" using 10 with lines title "wait"

结果类似：{% endcodeblock %}
<img src="http://www.lotto-kim.net/var/ezwebin_site/storage/images/media/images/http_benchmark/1702-1-eng-GB/http_benchmark.png" alt="" />
<pre id="nj1y"><strong>参考文档：</strong>http://www.gnuplot.info/download.htmlhttp://www.ibm.com/developerworks/cn/linux/l-gnuplot/index.htmlhttp://www.lotto-kim.net/eng/blog/using_gnuplot_to_show_results_from_ab{% endcodeblock %}
</div>
&nbsp;
