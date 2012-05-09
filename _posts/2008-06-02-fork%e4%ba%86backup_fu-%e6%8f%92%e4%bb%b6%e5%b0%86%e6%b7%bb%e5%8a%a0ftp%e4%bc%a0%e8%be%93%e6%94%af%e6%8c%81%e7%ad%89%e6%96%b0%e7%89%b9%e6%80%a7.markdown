--- 
layout: post
comments: true
title: !binary |
  Rm9ya+S6hmJhY2t1cF9mdSDmj5Lku7Ys5bCG5re75YqgRlRQ5Lyg6L6T5pSv
  5oyB562J5paw54m55oCnLg==

date: 2008-6-2
link: false
categories: life
---
<p>因为项目需要定时将资料打包备份到远程主机或者<strong>Amazon</strong>的<strong>S3</strong>上存储以备不测，我自己写了自动打包，备份的代码，用的也挺好的，但是一直想着可以做成插件之类的分享给更多的人。</p>
<p>今天重新看了下<a href="http://github.com/gravelpup/backup_fu/tree">backup_fu</a>这个插件，其实知道这个插件很早了，但是一直没仔细看它到底是做啥的，今天仔细看了下，原来是专门用来打包、上传到Amazon的S3的上一个插件，其使用的是<strong>aws-s3</strong>类。简单了看了下起代码，发现挺简单的，于是<strong>fork</strong>了一份回来。</p>
<p>然后我将在其基础上做一些现在可以想到的修改和完善：</p>
<p><strong>1、增加FTP远程备份功能</strong> --这个是我fork过来的主要用途，因为不是每个人都用S3的，很多人会选择通过FTP远程备份到另为的主机上；</p>
<p><strong>2、增加对RightScale gems的支持</strong>&nbsp; --尽管aws-s3的口碑不错，但是RightScale 的AWS的gems更加完备和健壮，且有产品级的支持，我自己环境用的也是这个gems，于是打算加入这个的支持。</p>
<p><strong>3、其他的一些比较的修改</strong>&nbsp;&nbsp; --按照我的习惯来修改，如果作者愿意，可以pull过去，呵呵。</p>
<p>如果您有类似的需求，请关注我fork的github：<a href="http://github.com/IceskYsl/backup_fu/tree/master">IceskYsl / backup_fu <br />
</a></p>
<p>&nbsp;</p>
