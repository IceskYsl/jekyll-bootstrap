---
layout: post
title: 使用check_box_tag时需要注意的
date: '2007-6-7'
comments: true
categories: Ruby&Rails
link: true
---
*check_box_tag*这个辅助方法，不晓得是rails自己的Bug还是其他的原因，按照道理来说，应该是和*check_box*这个辅助方法差不多的才对呀，但是在使用过程中发现有些问题，提醒各位下：check_box是可以自动生成*hidden_field*区域的代码的，这样选中或者不选中的时候，都可以正常工作；但是check_box_tag这个东西却没有那么好，它不会自动生成+hidden_field+的代码，所以使得你在不选该复选框的时候，其值是不会送到服务端的。必须手工添加以下代码：&lt;%=hidden_field_tag item.name, 0 %&gt;切忌切忌哈～
