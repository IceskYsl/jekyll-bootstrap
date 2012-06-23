---
layout: post
title: 在防火墙后安装Rails
date: '2007-5-20'
comments: true
categories: Mac&*UNIX Ruby&Rails
link: true
---
说到安装Rails,一般提到的方法就是使用rubygem，如果安装的是One-Click Installer – Windows版的ruby,里面自动附带了rubygem，如果不是，并且想用gem安装rails的话，到这里下载gem,http://rubyforge.org/frs/?group_id=126将它解压到任何目录下，到解压后的目录下，运行ruby setup.rb安装gem.如果还没有使用One-Click Installer，建议去装一个。下载地址如下：http://rubyforge.org/frs/?group_id=167然后是安装rails,官方网站上就明确教导大家用gem install rails --include-dependencies来安装rails。使用代理服务器上网的话，还可以通过指定参数 -p http://&lt;代理服务器名&gt;@&lt;端口&gt; 来进行安装。gem install rails -p http://&lt;代理服务器名&gt;@&lt;端口&gt;如果你的机器位于防火墙之后，或者有种种连接限制的环境下，则可以通过下载gem文件，用gem install ***.gem（保存到windows后会发现，gem文件的后缀实际上是.gem. tar）来进行安装。所有的gem文件都可以从以下网页下载：http://rubyforge.vm.bytemark.co.uk/gems/由于各个包之间有相互依赖的关系，所以安装的时候有安装顺序问题。不过即使安装顺序错误也问题不大，会有提示需要***.gem文件的*.*.*版本，去下载并安装就行了。保存gem文件后，转到gem文件所在目录,执行以下安装：笔者的安装顺序是1.）gem install rake-0.7.1.gem.tar2.) gem install activesupport-1.14.4.gem.tar3.) gem install activerecord-1.12.5.gem.tar4.) gem install actionpack-1.12.5.gem.tar5.) gem install actionmailer-1.2.5.gem.tar6.) gem install actionwebservice-1.1.6.gem.tar7.) gem install rails-1.1.6.gem.tar由于rake,active***.action***,rails等gem文件版本众多，笔者也不知道那个版本比较好，就全部挑了最新版进行安装。不过如果假如知道rails的1.1.4版比较稳定，可以将上面的顺序反过来，先试装rails，如果出错，出错信息里会包含所需要的gem（比如 actionwebservice）的版本，这样逆序找到所需的所有gem包之后，再顺序安装rake-&gt;active***-&gt; action**-&gt;rails就可以了。 最后成功安装rails后，可以通过rails –v来确认安装，能看到C:\&gt;rails -vRails 1.1.6恭喜你，安装rails成功了。
