---
layout: post
title: Android_Intent_is_so_powerful_and_great.
date: '2009-3-12'
comments: true
categories: 技术归总 Android&Java
tags: Android Intent
link: true
---
<p>Android have lots of intent,it's powerful and useful,here is some tips for you:</p>
<p>1，start web browser<br />
Uri myBlogUri = Uri.parse(&quot;http://kuikui.javaeye.com&quot;);<br />
returnIt = new Intent(Intent.ACTION_VIEW, myBlogUri);</p>
<p><br />
2，Google map<br />
Uri mapUri = Uri.parse(&quot;geo:38.899533,-77.036476&quot;);<br />
returnIt = new Intent(Intent.ACTION_VIEW, mapUri);</p>
<p><br />
3，show dialer tel <br />
Uri telUri = Uri.parse(&quot;tel:100861&quot;);<br />
returnIt = new Intent(Intent.ACTION_DIAL, telUri);</p>
<p><br />
4，start call dialar<br />
Uri callUri = Uri.parse(&quot;tel:100861&quot;);<br />
returnIt = new Intent(Intent.ACTION_CALL, callUri);</p>
<p><br />
5，uninstall apk<br />
Uri uninstallUri = Uri.fromParts(&quot;package&quot;, &quot;xxx&quot;, null);<br />
returnIt = new Intent(Intent.ACTION_DELETE, uninstallUri);</p>
<p><br />
6，install apk<br />
Uri installUri = Uri.fromParts(&quot;package&quot;, &quot;xxx&quot;, null);<br />
returnIt = new Intent(Intent.ACTION_PACKAGE_ADDED, installUri);</p>
<p><br />
7，play audio<br />
Uri playUri = Uri.parse(&quot;file:///sdcard/download/everything.mp3&quot;);<br />
returnIt = new Intent(Intent.ACTION_VIEW, playUri);</p>
<p><br />
8，show send email ui<br />
Uri emailUri = Uri.parse(&quot;mailto:shenrenkui@gmail.com&quot;);<br />
returnIt = new Intent(Intent.ACTION_SENDTO, emailUri);</p>
<p><br />
9，send email<br />
returnIt = new Intent(Intent.ACTION_SEND);<br />
String[] tos = { &quot;shenrenkui@gmail.com&quot; };<br />
String[] ccs = { &quot;shenrenkui@gmail.com&quot; };<br />
returnIt.putExtra(Intent.EXTRA_EMAIL, tos);<br />
returnIt.putExtra(Intent.EXTRA_CC, ccs);<br />
returnIt.putExtra(Intent.EXTRA_TEXT, &quot;body&quot;);<br />
returnIt.putExtra(Intent.EXTRA_SUBJECT, &quot;subject&quot;);<br />
returnIt.setType(&quot;message/rfc882&quot;);<br />
Intent.createChooser(returnIt, &quot;Choose Email Client&quot;);</p>
<p><br />
10，send sms<br />
Uri smsUri = Uri.parse(&quot;tel:100861&quot;);<br />
returnIt = new Intent(Intent.ACTION_VIEW, smsUri);<br />
returnIt.putExtra(&quot;sms_body&quot;, &quot;shenrenkui&quot;);<br />
returnIt.setType(&quot;vnd.android-dir/mms-sms&quot;);</p>
<p><br />
11，send email<br />
Uri smsToUri = Uri.parse(&quot;smsto://100861&quot;);<br />
returnIt = new Intent(Intent.ACTION_SENDTO, smsToUri);<br />
returnIt.putExtra(&quot;sms_body&quot;, &quot;shenrenkui&quot;);</p>
<p><br />
12，send mms<br />
Uri mmsUri = Uri.parse(&quot;content://media/external/images/media/23&quot;);<br />
returnIt = new Intent(Intent.ACTION_SEND);<br />
returnIt.putExtra(&quot;sms_body&quot;, &quot;shenrenkui&quot;);<br />
returnIt.putExtra(Intent.EXTRA_STREAM, mmsUri);<br />
returnIt.setType(&quot;image/png&quot;);&nbsp;</p>
<p>if you have other intent,please share to me ,thx.</p>
<p>useful resource link here:</p>
<p>http://kuikui.javaeye.com/blog/318627</p>
