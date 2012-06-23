---
layout: post
title: Ubuntu_gzip__stdout__No_space_left_on_device
date: '2008-6-12'
comments: true
categories: Ruby&Rails
link: true
---
<p><strong>问题:</strong><br />
iceskysl@IceskYsl:/boot$ sudo dpkg --configure -a<br />
正在设置 initramfs-tools (0.85eubuntu39.1) ...<br />
update-initramfs: deferring update (trigger activated)<br />
<br />
正在设置 linux-ubuntu-modules-2.6.24-18-generic (2.6.24-18.26) ...<br />
update-initramfs: Generating /boot/initrd.img-2.6.24-18-generic<br />
<br />
正在设置 linux-image-generic (2.6.24.18.20) ...<br />
正在设置 linux-generic (2.6.24.18.20) ...<br />
Processing triggers for initramfs-tools ...<br />
update-initramfs: Generating /boot/initrd.img-2.6.24-18-generic<br />
<br />
<span style="background-color: rgb(255, 0, 0);">gzip: stdout: No space left on device</span><br />
update-initramfs: failed for /boot/initrd.img-2.6.24-18-generic<br />
dpkg: 子进程 post-installation script 返回了错误号 1<br />
<br />
<strong>解决：</strong><br />
<span class="postbody">uname -a 看自己用的什么 <br />
dpkg --get-selections|grep linux 看机器里都装了什么 <br />
sudo apt-get remove linux-image-2.6.XX 直接删  XX替代为不用的 <br />
或者用新立得搜索到不用的卸载</span><br />
<br />
<strong>实践:</strong><br />
<strong>iceskysl@IceskYsl:~$ uname -a</strong><br />
Linux IceskYsl 2.6.24-17-generic #1 SMP Thu May 1 14:31:33 UTC 2008 i686 GNU/Linux<br />
<strong>iceskysl@IceskYsl:~$ dpkg --get-selections|grep linux</strong><br />
libselinux1&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.20-15&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.20-15-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.20-16&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.20-16-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-16&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-16-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-17&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-17-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-18&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-2.6.24-18-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-headers-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-2.6.20-15-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; deinstall<br />
linux-image-2.6.20-16-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-2.6.22-14-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-2.6.24-16-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-2.6.24-17-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-2.6.24-18-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-image-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-libc-dev&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-2.6.20-15-generic&nbsp;&nbsp;&nbsp; deinstall<br />
linux-restricted-modules-2.6.20-16-generic&nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-2.6.22-14-generic&nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-2.6.24-16-generic&nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-2.6.24-17-generic&nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-2.6.24-18-generic&nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-common&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-restricted-modules-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-sound-base&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-ubuntu-modules-2.6.22-14-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-ubuntu-modules-2.6.24-16-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-ubuntu-modules-2.6.24-17-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
linux-ubuntu-modules-2.6.24-18-generic&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
util-linux&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
util-linux-locales&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; install<br />
<strong>iceskysl@IceskYsl:~$ sudo apt-get remove linux-image-2.6.20-16-generic</strong><br />
正在读取软件包列表... 完成<br />
正在分析软件包的依赖关系树&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
读取状态信息... 完成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
下列软件包将被【卸载】：<br />
&nbsp; linux-image-2.6.20-16-generic linux-restricted-modules-2.6.20-16-generic<br />
共升级了 0 个软件包，新安装了 0 个软件包，要卸载 2 个软件包，有 34 个软件未被升级。<br />
操作完成后，会释放 114MB 的磁盘空间。<br />
您希望继续执行吗？[Y/n]y<br />
(正在读取数据库 ... 系统当前总共安装有 218707 个文件和目录。)<br />
正在删除 linux-restricted-modules-2.6.20-16-generic ...<br />
FATAL: Could not open '/boot/System.map-2.6.20-16-generic': No such file or directory<br />
正在删除 linux-image-2.6.20-16-generic ...<br />
Running postrm hook script /sbin/update-grub.<br />
Searching for GRUB installation directory ... found: /boot/grub<br />
Searching for default file ... found: /boot/grub/default<br />
Testing for an existing GRUB menu.lst file ... found: /boot/grub/menu.lst<br />
Searching for splash image ... none found, skipping ...<br />
Found kernel: /vmlinuz-2.6.24-18-generic<br />
Found kernel: /memtest86+.bin<br />
Updating /boot/grub/menu.lst ... done</p>
