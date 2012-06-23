---
layout: post
title: Scrot -- ubuntu/Linux 下一个很好用抓屏截图工具
date: '2007-12-15'
comments: true
categories: Ruby&Rails
link: true
---
<p><font size="5" color="#ff00ff">ubuntu</font> 下 gnome 自带的截图工具其实也还不错，有快捷键，可以在命令行下用 --window 的方式指定对某窗进行截图，也可以使用 --border 来指定是否包含窗体边框，甚至可以有阴影。但我还是不满意，因为我经常需要用鼠标划定一个范围来截图，GNOME自带的就没法做到了。<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <font color="#3366ff">Scrot</font>，也是一个命令行下使用的截图工具，支持全屏、窗口、选取、多设备、缩略图、延时，甚至可以截图完毕之后指定某程序打开截好的图片。<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <font color="#ff0000">* </font><font color="#800080">其他非</font> <font color="#ff00ff">ubuntu</font> <font color="#800080">系统，你可以在</font> [<a target="_blank" href="http://linuxbrit.co.uk/scrot/">这里</a>] <font color="#800080">下载到这款截图工具。</font><br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <strong><font size="4">安装：</font></strong>  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    可以打开新立得搜索 scrot 并安装，也可以在终端：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff0000"><span style="background-color: rgb(204, 255, 204);"> </span></font><font color="#008080" style="background-color: rgb(204, 255, 204);">sudo apt-get install scrot</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    来进行安装。<br />
<br />
<font size="4"> <strong>Scrot 使用：</strong></font><br />
<font color="#ff0000">-----------------------------------------------------------------------------------------------------------------------</font><br />
<font color="#000000">概要<br />
scrot [options] [file]<br />
<br />
描述<br />
scrot 是一个使用 imlib2 库截取屏幕和保存图像的的工具。<br />
选项 [file] 指定截图保存的文件名。 如果 [file] 没有指定，<br />
截图就会以当前的日期和时间为文件名保存在当前目录中。<br />
<br />
选项<br />
-h, --help<br />
显示帮助并且退出<br />
-v, --version<br />
显示版本信息并且退出<br />
-b, --border<br />
当选择一个窗口时，同时包含窗口边框。<br />
-c, --count<br />
延时时的显示倒计时<br />
-d, --delay NUM<br />
延时 NUM 秒<br />
-e, --exec APP<br />
对保存的图像执行程序 APP<br />
-q, --quality NUM<br />
图像质量 (1-100) 值大意味着文件大， 压缩率低。<br />
-m, --multidisp<br />
对多个显示设备分别截图并且连接在一起。<br />
-s, --select<br />
用鼠标交互式的选择一个窗口或者区域。<br />
-t, --thumb NUM<br />
同时生成缩略图。 NUM 是缩略图的百分比。<br />
<br />
说明符<br />
--exec 和 文件名可以使用可以被 scrot 扩充的格式说明符。有两种类型的<br />
说明符。 '%' 前导的说明符由 strfile(2) 来解释。例程可以查看 strftile<br />
手册。这些选项用来引用当前的日期。第二种说明符由 scort 内部解释并且<br />
使用前缀 '$'. 可以识别的说明符如下:<br />
$f 图像的路径/文件名 (如果在文件名中就会忽略)<br />
$n 图像文件名 (如果在文件名中会被忽略)<br />
$s 图像大小(字节数) (如果在文件名会被忽略)<br />
$p 图像像素大小<br />
$w 图像宽度<br />
$h 图像高度<br />
$t 图像格式<br />
$$ 打印字符 '$'<br />
n 打印新行 (如果在文件名中会被忽略)</font><br />
<font color="#ff0000">-----------------------------------------------------------------------------------------------------------------------</font><br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;<strong><font size="4">  例子(~ 用户主目录)：</font></strong><br />
1、对全屏截图并保存文件名：<br />
<font color="#3366ff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    scrot ~/abc.png<br />
<br />
<font color="#000000">2、抓取窗口，b 参数表示带边框窗体，s 用户可以指定窗口：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <font color="#3366ff">scrot -bs ~/abc.png</font><br />
<br />
3、抓取鼠标选定区域：<br />
</font></font><font color="#3366ff"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#339966"> <font color="#3366ff">scrot -s ~/abc.png</font></font><br />
<br />
4、延时抓取，d 表示延时，c 倒计时，10 是秒，抓菜单等其他东西时很好用：<br />
</font></font><font color="#3366ff"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <font color="#3366ff">scrot -cd 10 ~/abc.png</font><br />
<br />
5、生成缩略图，t 表示要生成缩略图， 20% 表示缩略图的比例， s 表示截取用户划定区域：<br />
</font></font><font color="#3366ff"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <font color="#3366ff">scrot -t 20% -s ~/abc.png</font><br />
<br />
6、启用某项操作 s 划定截图，-e 采用某项行为，这里用 gimp 打开截图图片，<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#339966"> <font color="#3366ff">scrot -s ~/abc.png -e 'gimp $f'</font></font></font></font></p>
