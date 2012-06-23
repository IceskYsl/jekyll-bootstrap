---
layout: post
title: 升级ubuntu8.10未果
date: '2008-11-10'
comments: true
categories: 无心呢喃
link: true
---
<p>ubuntu8.10发布好几天了，最近一直很忙，没时间升级，今天得闲升级，却遇到一些问题,开始是找速度不错的源，后来是遇到/boot下空间 不足的问题，但是我的 /boot是 100M，按常理，应该足够了，其哦已经清理掉每次升级版本留下来的grup，现在只保留了最新一个版本的image，查看/boot下的文件，发现没啥 是大文件，却占了70多M的空间，奇怪，如下：</p>
<p>iceskysl@IceskYsl:~$ cd /boot/<br />
iceskysl@IceskYsl:/boot$ du sk *<br />
du: 无法访问&ldquo;sk&rdquo;: 没有该文件或目录<br />
416&nbsp;&nbsp;&nbsp; abi-2.6.24-21-generic<br />
80&nbsp;&nbsp;&nbsp; config-2.6.24-21-generic<br />
179&nbsp;&nbsp;&nbsp; grub<br />
7488&nbsp;&nbsp;&nbsp; initrd.img-2.6.24-21-generic<br />
du: 无法创建目录&ldquo;lost+found&rdquo;: Permission denied<br />
12&nbsp;&nbsp;&nbsp; lost+found<br />
102&nbsp;&nbsp;&nbsp; memtest86+.bin<br />
890&nbsp;&nbsp;&nbsp; System.map-2.6.24-21-generic<br />
1885&nbsp;&nbsp;&nbsp; vmlinuz-2.6.24-21-generic<br />
iceskysl@IceskYsl:/boot$ df<br />
文件系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1K-块&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 已用&nbsp;&nbsp;&nbsp;&nbsp; 可用 已用% 挂载点<br />
/dev/sda8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10309796&nbsp;&nbsp; 7409400&nbsp;&nbsp; 2376680&nbsp; 76% /<br />
varrun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 228&nbsp;&nbsp;&nbsp; 772724&nbsp;&nbsp; 1% /var/run<br />
varlock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp; 0% /var/lock<br />
udev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 72&nbsp;&nbsp;&nbsp; 772880&nbsp;&nbsp; 1% /dev<br />
devshm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp; 0% /dev/shm<br />
lrm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 772952&nbsp;&nbsp;&nbsp;&nbsp; 39780&nbsp;&nbsp;&nbsp; 733172&nbsp;&nbsp; 6% /lib/modules/2.6.24-21-generic/volatile<br />
/dev/sda7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 93307&nbsp;&nbsp;&nbsp;&nbsp; 73608&nbsp;&nbsp;&nbsp;&nbsp; 14882&nbsp; 84% /boot<br />
/dev/sda9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9614116&nbsp;&nbsp; 5299748&nbsp;&nbsp; 3825996&nbsp; 59% /home<br />
/dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14195576&nbsp; 11835000&nbsp;&nbsp; 2360576&nbsp; 84% /media/sda1<br />
/dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15366140&nbsp; 13796572&nbsp;&nbsp; 1569568&nbsp; 90% /media/sda5<br />
可以看到，占了77M的空间，但是du看到的却最大的也只有 8M，其他空间哪里去了？</p>
