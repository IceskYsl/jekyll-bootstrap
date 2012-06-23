---
layout: post
title: Appending to a string（ROR中的+=和<<操作符的比较）
date: '2007-5-19'
comments: true
categories: Ruby&Rails
link: true
---
If you come from another language, you might be tempted to use the += operator when appending to a string.   1.  my_str = &quot;Marco &quot;   2.  my_str += &quot;Polo&quot;It works… but there is a better way to do it : the &lt;&lt; method.   1. my_str = &quot;Marco &quot;   2. my_str &lt;&lt; &quot;Polo&quot;#UPDATEI have removed my initial claim about operator precedence as it isn’t really accurate. There is a much better reason to use &lt;&lt; instead of += when appending to a string... something I didn't even realize (Thanks to Gregory). += will create a new String instance and will assign it to your left object. On the other hand, &lt;&lt; will append the new string directly into your already existing left object. One could argue that += is only different than &lt;&lt; and not better, but to me &lt;&lt; is what you'll want to use 99% of the time (if not 100%) when appending to a String. I have yet to see a real case where one would want to &quot;lose&quot; it's existing String instance just to get a new one containing the exact same value.You can also use the &lt;&lt; method with arrays :   1. [1,2,3] &lt;&lt; 4 #gives [1,2,3,4]、 Be careful however when using &lt;&lt; with Fixnum/Bignum instances. With these objects, the &lt;&lt; method will shift the bits of your integer to the left. If you want to do a summation (append style that is), you will have to use +=
