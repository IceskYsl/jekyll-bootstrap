---
layout: post
title: Counting_Distinct_Records_In_Rails
date: '2007-5-19'
comments: true
categories: Database Ruby&Rails
link: true
---
If you ever need to count your Rails records based on a distinct column, here is a simple solution:Gift.count_by_sql(&quot;select count(distinct url) from gifts&quot;)In this example, I am counting the number of distinct gift urls from my gifts table.
