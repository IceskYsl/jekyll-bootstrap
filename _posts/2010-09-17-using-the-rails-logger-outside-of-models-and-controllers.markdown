--- 
layout: post
comments: true
title: Using the Rails logger outside of models and controllers
date: 2010-9-17
link: false
categories: life
---
<!-- p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica} p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica; min-height: 14.0px} -->You can use the Rails logger outside of Rails models in at least version 2.3.X and up of Rails. You might be used to doing the following in your models or controllers:

<em>logger.info "Some debugging info I want to see in my development log."</em>

If you make a regular model that doesn’t inherit from ActiveRecord, though, you may see the following error:

undefined local variable or method `logger' for #&lt;Class:0x42fd77c&gt;

The solution is to call <strong>Rails</strong>.logger.info (or debug, or warn) as follows:

<em>Rails.logger.info "Some debugging info I want to see in my development log."</em>

I hope that helps someone.
