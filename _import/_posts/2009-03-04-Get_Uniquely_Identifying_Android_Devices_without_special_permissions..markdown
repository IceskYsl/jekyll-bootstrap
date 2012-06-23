---
layout: post
title: Get_Uniquely_Identifying_Android_Devices_without_special_permissions.
date: '2009-3-4'
comments: true
categories: 技术归总 Android&Java
tags: Android Identifying
link: true
---
<p>In some case,you may want do get&nbsp; Uniquely Identifying&nbsp; for a&nbsp; 'real' android phone,and you can do it like this:</p>
<p>In <a href="http://code.google.com/android/reference/android/provider/Settings.System.html">Android.Provider.Settings.System</a> we have some interesting values that could be of use, one specifically is &ldquo;Android_ID&rdquo;. From the documentation it is the following;</p>
<blockquote>
<p>String   	ANDROID_ID   	The Android ID (a unique 64-bit value) as a hex string.   	&ldquo;android_id&rdquo;</p>
</blockquote>
<p>
<div class="codeText">
<div class="codeHead">C++代码</div>
<ol start="1" class="dp-cpp">
    <li class="alt"><span><span>import&nbsp;Android.Provider.Settings.System;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>...&nbsp;&nbsp;</span></li>
    <li class="alt"><span>String&nbsp;Android_ID&nbsp;=&nbsp;System.getString(<span class="keyword">this</span><span>.getContentResolver(),&nbsp;System.ANDROID_ID);&nbsp;&nbsp;</span></span></li>
</ol>
</div>
Also, note that in an emulator this will return &ldquo;<strong>null</strong>&rdquo;, though a real device will return an actual value. The nice thing about this tid-bit of code is that you are not required any special permissions to call it, since it&rsquo;s essentially a passive call to get information. No write access is (obviously) required.</p>
<p>Some userfull link resource come here:</p>
<ul>
    <li>http://strazzere.com/blog/?tag=android_id</li>
    <li>http://groups.google.com/group/android-developers/browse_thread/thread/93d1c9333fae0e07</li>
    <li>http://groups.google.com/group/android-developers/browse_thread/thread/ab70f142148e5801/0af3468a7d92d095?lnk=gst&amp;q=%22mark+murphy%22</li>
    <li>http://groups.google.com/group/android-developers/browse_thread/thread/c0d243345b90c8a5</li>
    <li>http://code.google.com/intl/zh-CN/android/reference/android/provider/Settings.System.html#ANDROID_ID</li>
</ul>
<p>&nbsp;</p>
