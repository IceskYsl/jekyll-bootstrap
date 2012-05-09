--- 
layout: post
comments: true
title: mount&umount on unix
date: 2009-2-28
link: false
categories: life
---
<p>Some tips for mount&amp;umount ,maybe give you some help..</p>
<p><strong>cdrom:</strong><br />
# mount -t is09660 /dev/cdrom /mnt/cdrom<br />
# umount /mnt/cdrom<br />
<br />
<strong>floppy:</strong><br />
# mount /dev/fd0 /mnt/floppy<br />
#umount /mnt/floppy<br />
<br />
<strong>usb:</strong><br />
1.use 'fdisk -l' to show the usb nums,something like '/dev/sda';<br />
2.then use 'mkdir /mnt/usb' to create a dir for mount this usb;<br />
3.at last,use '# mount -t msdos /dev/sda1 /mnt/usb&quot; to mount it.<br />
4.#umount /mnt/usb<br />
<br />
<strong>hda:</strong><br />
1.use 'fdisk -l' to show the disk nums,like '/dev/hda1';<br />
2.then use 'make /mnt/vfat' to create a mount point;<br />
3.at last,use '# mount -t vfat /dev/hda1 /mnt/vfat'to mount it..<br />
4.#umount /mnt/vfat</p>
<p>and some usefull resource links and docs here:</p>
<p><a href="http://unix-cd.com/unixcd12/article_3967.html">http://unix-cd.com/unixcd12/article_3967.html</a></p>
<p><a href="http://blog.oracle.com.cn/index.php/121320/viewspace-6733.html">http://blog.oracle.com.cn/index.php/121320/viewspace-6733.html</a></p>
