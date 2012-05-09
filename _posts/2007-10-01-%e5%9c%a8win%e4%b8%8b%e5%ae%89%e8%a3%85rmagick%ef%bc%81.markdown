--- 
layout: post
comments: true
title: !binary |
  5ZyoV2lu5LiL5a6J6KOFUm1hZ2lja++8gQ==

date: 2007-10-1
link: false
categories: life
---
<p>说来惭愧，写了这么久的Ruby，做了那么多的网站，也写过不少使用Rmagick来处理图片的代码，但是自己的机子上始终安装不成功，折腾了好几 次，我记得都没有最终完全搞定。本来准备使用Ubuntu上，但是很多东西在Win下使用惯了，所以还是安心的在WIN下做开发吧。</p>
<p>言归正传，说说怎么在Win下安装Rmagick，其他的部分可以参考http://www.javaeye.com/post/167758和 http://blog.sina.com.cn/s/blog_4a6ae9750100076w.html这两文章，我大概说下步骤和可能会出现的问 题，记录一下：</p>
<div>1、首先到<a target="_blank" href="http://rubyforge.org/frs/?group_id=12&amp;release_id=6780">这个地方</a>去下载RMagick的最新Windows版本，到目前为止的最新版本是<a target="_blank" href="http://rubyforge.org/frs/download.php/12890/rmagick-win32-1.13.0_IM-6.2.9-3.zip">rmagick-win32-1.13.0_IM-6.2.9-3.zip</a>。</div>
<div>2、先解压，然后输入命令安装：gem install rmagick-1.13.0-win32.gem</div>
<div>3、然后再点ImageMagick-6.2.9-3-Q8-windows-dll.exe安装，并且把这个的安装路径放到path环境变量里面去，否则会出现CORE_RL_magick_.dll找不到的错误（需要注意，加入后CMD需要重新打开下，否则不行）。<br />
然后试试这段代码，如下：<br />
<div class="codeText">
<div class="codeHead">示例代码</div>
<ol start="1" class="dp-rb">
    <li class="alt"><span><span>require&nbsp;</span><span class="string">'RMagick'</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>include&nbsp;Magick&nbsp;&nbsp;</span></li>
    <li class="alt"><span>pic&nbsp;=&nbsp;ImageList.<span class="keyword">new</span><span>(</span><span class="string">&quot;vd2.jpg&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
    <li class=""><span>l&nbsp;=&nbsp;pic.columns&nbsp;&gt;&nbsp;pic.rows&nbsp;?&nbsp;pic.columns&nbsp;:&nbsp;pic.rows&nbsp;&nbsp;</span></li>
    <li class="alt"><span>f&nbsp;=&nbsp;128.0/l;&nbsp;&nbsp;</span></li>
    <li class=""><span>thumb&nbsp;=&nbsp;pic.thumbnail(f)&nbsp;&nbsp;</span></li>
    <li class="alt"><span>thumb.write(<span class="string">&quot;vd2_tb.jpg&quot;</span><span>)&nbsp;&nbsp;</span></span></li>
</ol>
</div>
其他的就不写的，互联网的资源是无限的，参考以下：<br />
1、http://blog.sina.com.cn/s/blog_4a6ae9750100076w.html<br />
2、http://www.javaeye.com/post/167758<br />
3、http://rmagick.rubyforge.org/portfolio.html</div>
