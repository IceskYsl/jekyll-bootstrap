---
layout: post
title: 在Android中使用Map需要注意的技巧
date: '2009-1-18'
comments: true
categories: 技术归总 Android&Java
tags: jarsigner Map
link: true
---
<p>在Android中使用GoogleMap非常方便，但是有些小技巧或者注意事项你必须牢记，否则调试半天你也不会找到啥线索，浪费时间不说，更让你狂抓，以下技巧都是我在实际项目中遇到的，不断更新和维护，如果你有类似技巧，欢迎分享：</p>
<p>（以下技巧是基于SDK 1.0的）</p>
<p><strong>一、申请Apikey，并放在正确的位置</strong></p>
<p>这个应该都知道，但是是申请得到的key放哪里很多人不知道，可以放在</p>
<p>1、XML布局文件中</p>
<p>&lt;view android:id=&quot;@+id/mv&quot;<br />
&nbsp;&nbsp; class=&quot;com.google.android.maps.MapView&quot;<br />
&nbsp;&nbsp; android:layout_width=&quot;fill_parent&quot;<br />
&nbsp;&nbsp; android:layout_height=&quot;fill_parent&quot;<br />
&nbsp;&nbsp; android:layout_weight=&quot;1&quot; <br />
&nbsp;&nbsp; android:apiKey=&quot;01Yu9W3X3vbpYT3x33chPXXX7U1Z6jy8WYZXNFA&quot; <br />
&nbsp;&nbsp; /&gt;</p>
<p>2、java中</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mMapView = new MapView(this, &quot;01Yu9W3X3vbpYT3x33chPxxx7U1Z6jy8WYZXNFA&quot;);</p>
<p><strong>二、记得导入<span class="postbody">uses-library </span></strong></p>
<p><span class="postbody"> 由于1.0版本的修改，使得map包不再是默认的了，使用的时候需要在manifest中的application节点下加入</span></p>
<p><span class="postbody">&lt;uses-library android:name=&quot;com.google.android.maps&quot; /&gt; <br />
</span></p>
<p><span class="postbody">否则，你将遇到可恶的&ldquo;</span><span class="postbody">java.lang.NoClassDefFoundError: </span><span class="postbody">&rdquo;，切记！</span></p>
<p><strong><span class="postbody">三、需要给予一定的权限</span></strong></p>
<p><span class="postbody">因为要使用GoogleMAP的service，所以需要<br />
&lt;uses-permission android:name=&quot;android.permission.INTERNET&quot;&gt;&lt;/uses-permission&gt;</span></p>
<p><span class="postbody">如果需要GPS等应用，还需要</span></p>
<p><span class="postbody">&lt;uses-permission android:name=&quot;android.permission.ACCESS_FINE_LOCATION&quot;&gt;&lt;/uses-permission&gt;</span></p>
<p><strong><span class="postbody">四、Activity需要继承自MapActivity</span></strong></p>
<p><span class="postbody">类似如下代码；</span></p>
<p><span class="postbody">package com.iceskysl.showmap;<br />
<br />
import com.google.android.maps.MapActivity;<br />
<br />
import android.os.Bundle;<br />
<br />
public class ShowMap extends MapActivity {<br />
&nbsp;&nbsp;&nbsp; /** Called when the activity is first created. */<br />
&nbsp;&nbsp;&nbsp; @Override<br />
&nbsp;&nbsp;&nbsp; public void onCreate(Bundle savedInstanceState) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super.onCreate(savedInstanceState);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; setContentView(R.layout.main);<br />
&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp; @Override<br />
&nbsp;&nbsp;&nbsp; protected boolean isRouteDisplayed() {<br />
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // TODO Auto-generated method stub<br />
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return false;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
</span></p>
