---
layout: post
title: ! 'git-svn: 整合使用git和svn'
date: '2008-5-27'
comments: true
categories: Ruby&Rails
link: true
---
<p>前面已经说了&ldquo;<a href="http://iceskysl.1sters.com/?action=show&amp;id=289">与时俱进,使用Git</a>&rdquo;，用了几天<strong>git</strong>后，越来越觉得不错，如下说说<strong>SVN</strong>和<strong>Git</strong>的主要区别：</p>
<blockquote>
<p>Git是<strong>分布式</strong>SCM，而SVN是基于<strong>服务器</strong>的，也就是说每个开发者本地都有一套git库，每个人维护自己的版本（或者合并其他人的版本），而SVN是每个人写完代码后都及时的checkin到服务器上，进行合并。</p>
</blockquote>
<p>如果上面这段话还不能让你真正了解Git的好处，而不想使用git来替代你的svn的话，那么我再列举几个我认为不错的比较直观的场景：</p>
<p>1、可以在本地（<strong>离线</strong>）就做好版本控制，而不用时刻连网，特别是Soho一族或者喜欢经常到处跑，又喜欢在路上、车上或者马路旁边的小凳子上coding的人；这个时候你可以在自己的Git库上进行版本控制，而不用到处找网络把代码搞到svn上去。</p>
<p>2、分布式的SCM更加安全和健壮，有没有想过，如果你的SVN版本服务器挂掉了（硬盘坏了或者网络不可用等等），你会咋样，能修复的好么，一旦修复不好，资料都完蛋了，而Git的分布式SCM，其中的几个节点挂掉影响并不大。</p>
<p>3、速度，你如果使用<strong>GoogleCode</strong>或者其他的SVN服务的话，不知道你是否有呆呆的等待chenkin完成的情况（我是经常有的），而Git，毫无疑问，速度快的多，（就算是使用GitHub也快），究其原因，应该是Git是打包好了上传，而不像SVN单个文件上传。</p>
<p>4、版本、分支管理</p>
<p>还有啥？想不来了，差不多就这样了，视个人情况而定，但是我认为Git会让你更加满意。</p>
<p>但是有人可能会有这样的想法，我本地使用git，然后定时的checkin到SVN上，这样岂不是更好，啊哈，好吧，你还不习惯或者还有其他的特殊情况（比如其他开发者不喜欢git，或者原来的代码在svn上等等），这里看看如何把git和svn结合起来一起使用。</p>
<p><strong>1、比较笨的方法</strong></p>
<p>同时使用Git和SVN，然后再各自的&ldquo;忽略&rdquo;列表里面加加上对方的版本库，比如在svn的忽略列表中加上.git，而同时在git的.gitignore中加上.svn；然后执行各自的命令。</p>
<p><strong>2、比较靠谱的方法</strong></p>
<p>使用<strong>git-svn</strong>应该算更加科学和靠谱的方法，安装好<strong>git-svn</strong>（这个是需要单独安装的）后，就可以使用啦，基本上是这样的：</p>
<p>mkdir 1stlog<br />
cd 1stlog &amp;&amp; git-svn init http://1stlog.googlecode.com/svn/trunk/</p>
<p>其他的就不多说了，可以参考&ldquo;<a href="http://pluskid.lifegoo.com/?p=24">git and subversion</a>&rdquo;和&ldquo;<a href="http://www.flavio.castelli.name/howto_use_git_with_svn">Howto use Git and svn together</a>&rdquo;以及&ldquo;<a href="http://privacymania.info/index.php?hl=f5&amp;q=uggc%3A%2F%2Ff5hagl.oybtfcbg.pbz%2F2008%2F03%2Ftvg-fia.ugzy">git-svn 常用功能示例</a>&rdquo;。</p>
