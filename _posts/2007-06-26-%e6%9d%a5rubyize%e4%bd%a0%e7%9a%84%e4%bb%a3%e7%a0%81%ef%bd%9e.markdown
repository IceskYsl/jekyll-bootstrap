--- 
layout: post
comments: true
title: !binary |
  5p2lLFJ1YnlpemXkvaDnmoTku6PnoIHvvZ4=

date: 2007-6-26
link: false
categories: life
---
了解Ruby语法的朋友应该对Ruby的语法和表达形式很惊叹，这都要归功与Ruby强大的表达能力，有的时候，把以前的写的不完善的代码Ruby化不仅能加深对Ruby的理解，还能提高代码质量，更加可读，或者说更加Ruby一些～好，下面举个例子来说明一下，希望有见解的朋友能分享你的写法。&lt;code&gt;      def manage_ducks(ducks)        if ducks == nil          ducks = fetch_some_champions        else          unless ducks.won_stanley_cup?               ducks = fetch_some_champions          end        end        ducks.beat_random_opponent      end&lt;/code&gt;如果是刚刚解除Ruby的话，上面这段代码可能就是你写出来的，她虽然可行，但是一点都不符合ruby的风格，你将怎么改呢～请留言分享～
