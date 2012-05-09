--- 
layout: post
comments: true
title: !binary |
  cmFpbHMtZXJkOiDnlJ/miJByYWlsc+mhueebrueahOWunuS9k+WFs+ezu+Wb
  vg==

date: 2012-1-29
link: false
categories: life
---
写rails的好像很多人都没正儿八经的数据库设计文档（尽管这是不对的，但是还是很多人这么干了），随着项目越来越大，有时候我们需要搞明白实体间关系的时候就傻眼了，如何能形象的展示实体间的关系(Entity-Relationship Diagrams)，rails-erd 这个gem 可以帮我们实现：

1. 首先安装Graphviz
% brew install cairo pango graphviz # Homebrew on Mac OS X
% sudo port install graphviz # Macports on Mac OS X
% sudo aptitude install graphviz # Debian and Ubuntu 

2. 然后在开发环境中使用，在Gemfile添加
{% codeblock %}
group :development do
  gem "rails-erd", :git => 'git://github.com/voormedia/rails-erd.git'
end
{% endcodeblock %}

3. 安装gem
% bundle install 

4. 生成PDF
% rake erd
在项目根目录下就会生成ERD.pdf，效果类似：
<img src="http://rails-erd.rubyforge.org/images/entity-relationship-diagram-for-rails.png" alt="" />

更多信息参考：http://rails-erd.rubyforge.org/
<!--more-->
附：常见错误处理：
Could not find gem 'choice (~> 0.1.4) ruby', which is required by gem 'rails-erd (>= 0) ruby', in any of the sources.

原因是rails-erd依赖choice这个gem，装下
ice@mac:/www/trunk > sudo gem install choice
Password:
Successfully installed choice-0.1.4
1 gem installed
Installing ri documentation for choice-0.1.4...
Installing RDoc documentation for choice-0.1.4...
