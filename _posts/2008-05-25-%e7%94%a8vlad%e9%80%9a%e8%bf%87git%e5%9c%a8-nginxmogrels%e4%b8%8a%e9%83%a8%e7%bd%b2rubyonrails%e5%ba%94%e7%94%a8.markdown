--- 
layout: post
comments: true
title: !binary |
  55SoVmxhZOmAmui/h0dpdOWcqCBOZ2lueCttb2dyZWxz5LiK6YOo572yUnVi
  eU9uUmFpbHPlupTnlKgu

date: 2008-5-25
link: false
categories: life
---
<p>一个周末又快过完了，这个周末主要看了下如何自动部署<strong>RubyOnRails</strong>，目前用的比较多的是capistrano和Vlad，两者各有优缺点，但是考虑到自身的情况和未来的趋势，我主要看的是Vlad，这里就说说如何试用Vlad来把RoR应用自动部署到Nginx，Mogrels，当然，我们这里就不堪SVN了，我们看看Git的实现。</p>
<p><a href="http://rubyhitsquad.com/Vlad_the_Deployer.html">Vlad</a>的最新版本中已经支持了Git，但是尚不支持<strong>Nginx</strong>，于是我们需要自己代码，我在<strong>GitHub</strong>上fork了一份Vlad的代码，然后添加了对nginx的支持，然后就按照自己的使用方便，修改了他的core文件，添加了自动生成配置文件的方法。</p>
<p>1、增加对Nginx的支持，可以通过Vlad来start，stop，restart Nginx服务器;</p>
<p>2、可以自动生成匹配web服务器，app服务器和scm的<strong>deploy.rb</strong>配置文件;</p>
<p>3、可以根据<strong>deploy.rb</strong>自动生成合适的nginx的配置文件，并上传到服务器;（需要<strong>rsync</strong>支持.）</p>
<p>4、可以通过Git自动clone需要的代码，自动发布。（需要服务器上有git支持）</p>
<p>详细的信息，感兴趣的可以查看<a href="http://github.com/IceskYsl/vlad/tree/master">我的vlad的git</a>，使用帮助信息，请查看&ldquo;<a href="http://github.com/IceskYsl/vlad/tree/master/doco/how_to_generate_configs.txt">/how_to_generate_configs.txt</a>&rdquo;,有啥子意见，请告诉我，:)</p>
