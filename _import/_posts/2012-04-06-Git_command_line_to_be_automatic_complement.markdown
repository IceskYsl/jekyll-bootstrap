---
layout: post
title: Git 命令行自动补全
date: '2012-4-6'
comments: true
categories: Mac&*UNIX
tags: completion git
link: true
---
在<a href="http://progit.org/book/ch2-7.html" target="_blank">Pro Git</a>上看到的技巧，git的源代码包里的contrib/completion目录下有个<a href="http://repo.or.cz/w/git.git/blob_plain/HEAD:/contrib/completion/git-completion.bash" target="_blank">git-completion.bash</a>，把这个文件保存到~/.git-completion.bash，然后在.bashrc或.bash_profile中加入一行
<blockquote>source ~/.git-completion.bash</blockquote>
这样就能在bash下用tab自动补全git命令、branch等内容了。也可以为系统上所有用户都设置默认使用此脚本。Mac 上将此脚本复制到{% codeblock %}/opt/local/etc/bash_completion.d{% endcodeblock %} 目录中，Linux 上则复制到 {% codeblock %}/etc/bash_completion.d/{% endcodeblock %} 目录中。这两处目录中的脚本，都会在 Bash 启动时自动加载。

在输入 Git 命令的时候可以敲两次跳格键（Tab），就会看到列出所有匹配的可用命令建议：
{% codeblock %}{% codeblock %}$ git co&lt;tab&gt;&lt;tab&gt; commit config{% endcodeblock %}{% endcodeblock %}
此例中，键入 git co 然后连按两次 Tab 键，会看到两个相关的建议（命令） commit 和 config。继而输入 {% codeblock %}m&lt;tab&gt;{% endcodeblock %} 会自动完成 {% codeblock %}git commit{% endcodeblock %} 命令的输入。

命令的选项也可以用这种方式自动完成，其实这种情况更实用些。比如运行 {% codeblock %}git log{% endcodeblock %} 的时候忘了相关选项的名字，可以输入开头的几个字母，然后敲 Tab 键看看有哪些匹配的：
{% codeblock %}{% codeblock %}$ git log --s&lt;tab&gt; --shortstat --since= --src-prefix= --stat --summary{% endcodeblock %}{% endcodeblock %}
这个技巧不错吧，可以节省很多输入和查阅文档的时间。
