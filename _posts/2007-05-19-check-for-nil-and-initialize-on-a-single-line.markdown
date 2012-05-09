--- 
layout: post
comments: true
title: Check for nil and initialize on a single line
date: 2007-5-19
link: false
categories: life
---
点评：关于ROR中的一中“遇nil赋值”的写法，这个很早的时候在书上看到的是||＝操作符，也一直这么用，今天发现作者的另外这个写法也挺好的。

Sometimes, you want to initialize a variable to some value only if that variable is equal to nil. If you like to write your methods as short, clean and readable as possible, you can do that task in a single line instead of taking the traditionnal 3 lines approach. You have two options :

1) You can use the if modifier   1. x = get_some_object if x.nil?Very easy to read. This is my favorite.

2) Or you can use the ||= operator   1. x ||= get_some_object This one is even shorter. The ||= operator is a little bit less verbose and might confuse a ruby newcomer… but I’m not saying that it should be a reason for not using it. This is more a matter of personal taste than anything else.Both of these methods are better than this :

1.  #eeww… we don’t like this one.

2.  if(x.nil?)

3.     x = get_some_object   4.  end
