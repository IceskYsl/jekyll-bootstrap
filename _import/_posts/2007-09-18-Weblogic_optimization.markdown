---
layout: post
title: weblogic性能调优
date: '2007-9-18'
comments: true
categories: Ruby&Rails
link: true
---
<p>注：在下面做的介绍都是以Weblogic8.1为例的，其它版本的Weblogic可能会有些许不同。<br />
<br />
<strong>1) 设置JAVA参数；</strong><br />
a) 编辑Weblogic Server启动脚本文件；<br />
BEA_HOME\user_projects\domains\domain-name\startWebLogic.cmd(startWebLogic.sh on Unix)&nbsp; <br />
BEA_HOME\user_projects\domains\domain-name\startManagedWebLogic.cmd(startManagedWebLogic.sh on Unix) --这个是做集群的时候用的<br />
b) 编辑set JAVA_OPTIONS命令，如：set JAVA_OPTIONS=-Xms256m &ndash;Xmx256m；<br />
（在UNIX下把<em>MEM_ARGS=&quot;-Xms1024m -Xmx1024m -Xmn128m&quot;</em>加到上述两个.sh文件中即可）<br />
c) 保存，重启即可。<br />
注：在WebLogic中，为了获得更好的性能，BEA公司推荐最小Java堆等于最大Java堆。<br />
（这个偶们的设置都是1024M的，反正偶们内存大大的4G呢）<br />
<br />
<strong>2) 开发模式 vs. 产品模式；</strong><br />
开发模式和产品模式的一些参数的默认值不同，可能会对性能造成影响，下面是对性能有影响的参数列表：</p>
<p>
<table width="505" height="121" cellspacing="1" cellpadding="1" border="1">
    <tbody>
        <tr>
            <td>参数</td>
            <td>开发模式默认值</td>
            <td>产品模式默认值</td>
        </tr>
        <tr>
            <td>Execute Queue: Thread Count</td>
            <td>15 threads</td>
            <td>25 threads</td>
        </tr>
        <tr>
            <td>JDBC Connection Pool: MaxCapacity</td>
            <td>15 connnections</td>
            <td>25 connections</td>
        </tr>
    </tbody>
</table>
<br />
通过启动管理控制台，在域（如：mydomain）&gt; 配置 &gt; 常规选择产品模式。<br />
<font color="#ff0000">（这个在创建weblogic的domain的时候是有选择的，选择&ldquo;产品&rdquo;模式就可以了，如果后期需要修改，可以按照上面的方法修改）</font><br />
<strong><br />
3) 尽量开启本地I/O；</strong><br />
通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt; 配置 &gt; 调整选择启用本地I/O。<br />
注：此值也可通过手动的修改config.xml配置文件。<br />
<font color="#ff0000">（这个没有试验过，不晓得有什么效果和好处，知道的告诉偶下下。）</font><br />
<br />
<strong>4) 调优执行队列线程；</strong><br />
<u>a) 修改默认执行线程数</u><br />
在这里，执行队列的线程数表示执行队列能够同时执行的操作的数量。但此值不是设的越大越好，应该恰到好处的去设置它，太小了，执行队列中将会积累很多待处理的任务，太大了，则会消耗大量的系统资源从而影响整体的性能。在产品模式下默认为25个执行线程。<br />
<font color="#ff0000">（点：一般来说，其上限是每个CPU对应50个线程，其按照CPU个数线性增长.）</font><br />
<br />
为了设置理想的执行队列的线程数，我们可以启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt; 监视 &gt; 性能中监控最大负载时执行队列的吞吐量和队列中的等待请求数，据此确定理想的数值。<br />
理想的默认执行线程数是由多方面的因素决定的，比如机器CPU性能、总体体系架构、I/O、操作系统的进程调度机制、JVM的线程调度机制。随着CPU个数的增加，WebLogic可以近乎线性地提高线程数。线程数越多，花费在线程切换的时间也就越多；线程数越小，CPU可能无法得到充分的利用。为获取一个理想的线程数，需要经过反复的测试。在测试中，可以以<strong>25*CPU</strong>个数为基准进行调整。当空闲线程较少，CPU利用率较低时，可以适当增加线程数的大小（每五个递增）。对于PC Server和Windows 2000，则最好每个CPU小于50个线程，以CPU利用率为90%左右为最佳。<br />
通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt; Execute Queue &gt; weblogic.kernel.Defalt &gt; 配置中修改线程计数。<br />
<br />
<u>b) 设定执行队列的溢出条件；</u><br />
&nbsp;&nbsp;&nbsp; Weblogic Server提供给默认的执行队列或用户自定义的执行队列自定义溢出条件的功能，当满足此溢出条件时，服务器改变其状态为&ldquo;警告&rdquo;状态，并且额外的再分配一些线程去处理在队列中的请求，而达到降低队列长度的目的。<br />
&nbsp;&nbsp;&nbsp; 通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt; Execute Queue &gt; weblogic.kernel.Defalt &gt; 配置下面几项：<br />
●队列长度：此值表示执行队列中可容纳的最大请求数，默认值是65536，最后不要手动改变此值。<br />
●队列长度阈值百分比：此值表示溢出条件，在此服务器指出队列溢出之前可以达到的队列长度大小的百分比。<br />
●线程数增加：当检测到溢出条件时，将增加到执行队列中的线程数量。如果CPU和内存不是足够的高，尽量不要改变默认值&ldquo;0&rdquo;。因为Weblogic一旦增加后不会自动缩减，虽然最终可能确实起到了降低请求的作用，但在将来的运行中将影响程序的性能。<br />
●最大线程数：为了防止创建过多的线程数量，可以通过设定最大的线程数进行控制。<br />
在实际的应用场景中，应根据具体情况适当的调整以上参数。<br />
<br />
<u>c) 设定执行队列监测行为</u><br />
Weblogic Server能够自动监测到当一个执行线程变为&ldquo;阻塞&rdquo;。变为&ldquo;阻塞&rdquo;状态的执行线程将无法完成当前的工作，也无法再执行新请求。如果执行队列中的所有执行线程都变为&ldquo;阻塞&rdquo;状态，Weblogic server可能改变状态为&ldquo;警告&rdquo;或&ldquo;严重&rdquo;状态。如果Weblogic server变为&ldquo;严重&rdquo;状态，可以通过Node Manager来自动关闭此服务器并重新启动它。具体请参考：Node Manager Capabilities文档。<br />
通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt;配置 &gt; 调整下可配置下面几项：<br />
●阻塞线程最长时间：在此服务器将线程诊断为阻塞线程之前，线程必须连续工作的时间长度(秒)。默认情况下，WebLogic Server 认为线程在连续工作 600 秒后成为阻塞线程。<br />
●阻塞线程计时器间隔：WebLogic Server 定期扫描线程以查看它们是否已经连续工作了 &quot;阻塞线程最长时间&quot; 字段中指定的时间长度的间隔时间(秒)。默认情况下，WebLogic Server 将此时间间隔设置为 600 秒。<br />
<br />
<strong>5) 调优TCP连接缓存数；</strong><br />
WebLogic Server用<strong>Accept Backlog</strong>参数规定服务器向操作系统请求的队列大小，默认值为50。当系统重载负荷时,这个值可能过小,日志中报Connection Refused,导致有效连接请求遭到拒绝,此时可以提高Accept Backlog 25%直到连接拒绝错误消失。对于Portal类型的应用,默认值往往是不够的。<br />
Login Timeout和SSL Login Timeout参数表示普通连接和SSL连接的超时时间,如果客户连接被服务器中断或者SSL容量大,可以尝试增加该值。<br />
通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt;配置 &gt; 调整下可配置&ldquo;接受预备连接&rdquo;。<br />
<br />
<strong>6) 改变Java编译器；</strong><br />
标准的Java编译器是javac，但编译JSP servlets速度太慢，为了提高编译速度，可以使用sj或jikes编译器取代javac编译器。下面说说更改Java编译器：<br />
通过启动管理控制台，在域（如：mydomain）&gt; 服务器 &gt; server实例（如：myserver）&gt;配置 &gt; 常规下改变Java 编译器，默认为javac。输入完整路径，如：c:\visualcafe31\bin\sj.exe。然后打开高级选项，在预规划到类路径填写编译 Java 代码时为 Java 编译器类路径预规划的选项，如：BEA_HOME\jdk141_02\jre\lib\rt.jar。<br />
<br />
<strong>7) 使用Webogic Server集群提高性能；</strong><br />
具体关于如何配置Weblogic集群，我就不细说了。详情可参考：Introduction to WebLogic Server Clustering。<br />
<br />
<strong>8) Weblogic EJB调优</strong><br />
由于EJB2.0已经很少项目在用了，EJB3.0再成熟一点，我再补充这一部分吧！<br />
<br />
<strong>9) JDBC应用调优</strong><br />
JDBC Connection Pool的调优受制于WebLogic Server线程数的设置和数据库进程数,游标的大小。通常我们在一个线程中使用一个连接,所以连接数并不是越多越好,为避免两边的资源消耗，建议设置连接池的最大值等于或者略小于线程数。同时为了减少新建连接的开销,将最小值和最大值设为一致。<br />
增加Statement Cache Size对于大量使用PreparedStatement对象的应用程序很有帮助,WebLogic能够为每一个连接缓存这些对象,此值默认为10。在保证数据库游标大小足够的前提下,可以根据需要提高Statement Cache Size。比如当你设置连接数为25,Cache Size为10时,数据库可能需要打开25*10=250个游标。不幸的是,当遇到与PreparedStatement Cache有关的应用程序错误时,你需要将Cache Size设置为0。<br />
尽管JDBC Connection Pool提供了很多高级参数,在开发模式下比较有用,但大部分在生产环境下不需调整。这里建议最好不要设置测试表, 同时Test Reserved Connections和Test Released Connections也无需勾上。 当然如果你的数据库不稳定,时断时续,你就可能需要上述的参数打开。<br />
最后提一下驱动程序类型的选择,以Oracle为例,Oracle提供thin驱动和oci驱动,从性能上来讲,oci驱动强于thin驱动,特别是大数据量的操作。但在简单的数据库操作中,性能相差不大,随着thin驱动的不断改进,这一弱势将得到弥补。而thin驱动的移植性明显强于oci驱动。所以在通常情况下建议使用thin驱动。而最新驱动器由于WebLogic server/bin目录下的类包可能不是最新的,请以Oracle网站为准: http://www.oracle.com/technology/software/tech/java/sqlj_jdbc/htdocs/jdbc9201.html。<br />
<br />
<strong>10) JSP调优</strong><br />
设置jsp-param pageCheckSeconds=-1；<br />
设置serlet-reload-check=-1或ServletReloadCheckSecs=-1；<br />
设置jsp-param precompile=true，关闭JSP预编译选项。</p>
