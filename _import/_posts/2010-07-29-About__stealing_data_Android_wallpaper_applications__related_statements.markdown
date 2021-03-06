---
layout: post
title: 关于“偷窃数据的Android壁纸应用”的相关申明
date: '2010-7-29'
comments: true
categories: 无心呢喃
tags: Android
link: true
---
今天在GoogleTalk上朋友发来消息，说有人撰写文章指出我以前开发的一款更换手机壁纸的应用（嵌入了admob和google的广告）中存在偷窃用户隐私数据行为时，我简直不敢相信这是真的；当看到新闻的详细内容时，我更是被震惊了。以下是那段转载文章的原话：

<em>“拉斯维加斯黑帽大会上，Lookout 的安全人员指出，一个伪装成Android手机壁纸应用的偷窃个人信息程序已经被下载了百万次，它会收集您的个人资料，并将其发送到一个来自中国深圳的神秘网站imnet.us中。安全人员(Kevin MaHaffey)估计这款程序是由正常的壁纸应用修改而来，黑客将其上传到Android Market，希望装饰自己手机的用户因此而中招。泄漏的数据包括浏览历史记录，短信，手机的SIM卡号码，用户识别号，语音邮件，甚至是密码，他警告称每个人都应该警惕来自手机上的威胁。”</em>

在看完这条消息后，我立马检查了所有代码，防止这款应用在我不知情的情况下，被他人加入恶意代码，但我一无所获。
<h2><strong><span style="color: #ff0000;">现就相关事宜申明如下：</span></strong></h2>
<strong>一、我开发的所有程序都没有侵犯到用户的隐私。</strong>

在这个应用中，申请的全部权限为：
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.INTERNET" /&gt;</div>
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" /&gt;</div>
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" /&gt;</div>
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.SET_WALLPAPER" /&gt;</div>
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.READ_PHONE_STATE" /&gt;</div>
<div id="_mcePaste">&lt;uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" /&gt;</div>
懂点Android技术的都知道，这些权限都是为了让该软件的功能，能够正常工作所必须的权限（连接网络，获取网络状态，下载壁纸时读写SD卡，设置壁纸，读取手机状态）和Admob的广告精准推送所需要的权限（位置信息，读取手机状态）。
至于获取用户浏览历史记录、短信、语音邮件密码的这些明显侵犯用户隐私的行为，完全是子虚乌有。一方面并没要申请相关的权限；另一方面我还真不知道怎样获取这些敏感信息。另外，admob的精准广告服务中可能是会针对用户的地理位置等信息推送更准确的广告服务。
关于这款应用能获取的设备标识号是用来区分设备的唯一性，免去用户注册的麻烦，而能给用户提供收藏图片的功能；而诸如获取手机屏幕大小是为了能够智能适配合适的图片。在这些设备信息中，请问哪一条会侵犯到用户的隐私。
另外说我可以获取浏览历史信息，这简直就是个天大的笑话。如果懂一点程序的就会知道，要获取浏览器信息必须在程序里申请com.android.browser.permission.READ_HISTORY_BOOKMARKS权限。我的程序完全没有获取到权限，怎么能够获取到历史信息，真是笑话！！！

<strong>二、Android手机的权限管理，在任何没有刷过第三方rom的手机上是很严格的。
</strong> Android手机的权限管理，在任何没有刷过第三方rom的手机上是很严格的，在没有相关权限的情况下，要获取那些信息，是完全不可能的。就算是被刷过Rom的手机，也只有具有该ROM制作人的加密签名的程序，才能完成一些不安全的操作。
我所需要的权限在用户安装的时候会很明确的告诉用户，下面我就给大家展示一下我应用申请的权限和另外一个著名的壁纸的应用background和一款管理短信的应用申请的权限。

我的软件需要的权限：
<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/07/5.png"><img class="alignnone size-medium wp-image-763" title="5" src="http://iceskysl.1sters.com/wp-content/uploads/2010/07/5-200x300.png" alt="" width="200" height="300" /></a>

看看background（另外一款壁纸的应用）申请的权限：
<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/07/3.png"><img class="alignnone size-medium wp-image-764" title="3" src="http://iceskysl.1sters.com/wp-content/uploads/2010/07/3-200x300.png" alt="" width="200" height="300" /></a>

Handcent SMS申请的权限：

<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/07/1.png"><img class="alignnone size-medium wp-image-772" title="1" src="http://iceskysl.1sters.com/wp-content/uploads/2010/07/1-200x300.png" alt="" width="200" height="300" /></a>

短信有短信的权限，联系人有联系人的权限，我都没要申请，请问我如何获取相关的信息。

<strong>三、应用主要面向外国用户，但绝对没有获取那些高敏感度的隐私信息！</strong>

该应用主要面向外国用户（国内由于网络原因无法正常使用），连接服务器端能够获取到精确适配终端的图片，这是一款非常有用，也深受用户喜爱的应用。它确实拥有数量众多（几百万）的用户，但绝对没有获取那些高敏感度的隐私信息！我每天都收到很多用户的反馈邮件告诉我这个软件多么棒，给他们带来多少乐趣！

<strong>四、我本人始终与业界同仁一道，希望建立诚实守信、和谐共生的Android产业生态系统。</strong>

随着Android开放性操作平台手机的广泛使用，其应用软件开发市场正呈现蓬勃发展景象。对于提醒用户警惕来自手机上的威胁，我本人向来都是强烈支持的！本人一直始终与业界同仁一道，一直为共建诚实守信、和谐共生的Android产业生态系统而努力，将力量专注于用户需求和技术创新，创造更被用户喜欢的软解，并致力于推动手机应用软件产业持续健康发展。

<span class="s1">在此，本人郑重申明，该应用没有获取任何诸如</span><span class="s2">“</span><span class="s1">浏览历史记录，短信，语音邮件密码等</span><span class="s2">”</span><span class="s1">这种高敏感度的信息，并和国外的原作者取得联系，让其修正自己的言论并发布公开道歉，同时对于这种不负责任的言论和评价观点，对我及与我相关的应用进行不负责任的报道造成的影响给予补偿，我将保留追究其法律责任的权利。</span>

ps：

如果您有其他的疑问或者问题，欢迎你在我sina微博客（<a href="http://t.sina.com.cn/iceskysl" target="_self">http://t.sina.com.cn/iceskysl</a>）或者sohu微博（<a href="http://t.sohu.com/iceskysl" target="_self">http://t.sohu.com/iceskysl</a>）给我沟通！
<h2><span style="color: #0000ff;">update：</span></h2>
写完申明后，去看消息出处看到其竟然做了修改，我早料到其会做相关的行为，所有早些时候截了屏幕如下：

<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/07/Screen-shot-2010-07-29-at-pm07.34.24.png"><img class="alignnone size-medium wp-image-775" title="Screen shot 2010-07-29 at pm07.34.24" src="http://iceskysl.1sters.com/wp-content/uploads/2010/07/Screen-shot-2010-07-29-at-pm07.34.24-300x295.png" alt="" width="300" height="295" /></a>

而现在的文章被修改为：

<a href="http://iceskysl.1sters.com/wp-content/uploads/2010/07/Screen-shot-2010-07-30-at-am01.24.09.png"><img class="alignnone size-medium wp-image-776" title="Screen shot 2010-07-30 at am01.24.09" src="http://iceskysl.1sters.com/wp-content/uploads/2010/07/Screen-shot-2010-07-30-at-am01.24.09-300x159.png" alt="" width="300" height="159" /></a>

看我用鼠标标识的地方，对关键信息进行了修改，感兴趣的人可以去 <a href="http://mobile.venturebeat.com/2010/07/28/android-wallpaper-app-that-steals-your-data-was-downloaded-by-millions/" target="_self">http://mobile.venturebeat.com/2010/07/28/android-wallpaper-app-that-steals-your-data-was-downloaded-by-millions/</a> 查看原文，对于这种标题党用子虚乌有的事情炒作，等消息传播后再修改自己的内容算什么行为！而对国内部分媒体在传播时不但不对真实性进行验证，还添油加醋，歪曲意思的报道，我非常无奈（看到有人还说可以获取信用卡信息，还加密传输，我实在无语）。

<span style="color: #ff0000;">按照我个人的感觉，他们应该紧接着要开始拿这个事件来炒作自己的产品了，我个人懒得去关注，如果有人发现有人借此炒作自己的产品，请帮忙分析分析，看看到底是什么人用这样手法。</span>

<span style="color: #0000ff;">再次update！！！</span>

<span style="color: #ff0000;"><span style="color: #0000ff;">通过email和mylookout的人取得联系，说明我取得诸如设备号，手机屏幕大小是为了更智能的给设备适配图片，而获取部分的sim卡号是后来用户反馈说自己换了手机还想使用之前的收藏记录才使用的，这些信息只在该应用中使用，并没提供给任何第三方！</span></span>

<span style="color: #ff0000;"><span style="color: #0000ff;">同时让其确认</span></span><a href="http://mobile.venturebeat.com/2010/07/28/android-wallpaper-app-that-steals-your-data-was-downloaded-by-millions/" target="_self"><span style="color: #0000ff;">venturebeat</span></a><span style="color: #0000ff;">上文章中说到的获取浏览器历史，短信息，密码等高敏感性信息是否是他们说的还是写文章的人自己写的（</span><span style="line-height: normal; font-size: 11px; border-collapse: collapse;"><span style="color: #0000ff;">Lots of my users send me the email ask me why I collect their text message and voicemail passward, I just want to make sure whether you and your ceo said that  I collected browsing history,text message ,voicemail passward during the meeting.</span></span><span style="color: #0000ff;">）。</span>

<span style="color: #0000ff;">其cto给我回复说他们没有说过我的应用获取过诸如</span><span style="line-height: normal; font-size: 15px; border-collapse: collapse;"><span style="color: #0000ff;">text messages or browsing history这些信息（</span></span><span style="line-height: normal; font-size: 15px; border-collapse: collapse;"><span style="color: #0000ff;"> We never stated that the wallpaper applications gathered users text messages or browsing history.</span></span><span style="line-height: normal; font-size: 15px; border-collapse: collapse;"><span style="color: #0000ff;">），是媒体在撰写和传播的时候错误报道了（</span></span><span style="line-height: normal; font-size: 15px; border-collapse: collapse;"><span style="color: #0000ff;">A member of the press misreported our research and he has since corrected it. </span></span><span style="line-height: normal; font-size: 15px; border-collapse: collapse;"><span style="color: #0000ff;">）。</span></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: medium;">我非常无语～</span></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: medium;">2010年8月4日第二次次update！</span></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: small;">多谢这些天很多朋友的关心，我很好，谢谢！这些天和google android组，lookout公司和venturebeat的作者，以及国内外很多媒体，博客们，记者们都有很多的接触。</span></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: small;">1. google就前段时间将应用暂停和我一起分析了这个应用，今天发来调查的结果：</span></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: small;"><span style="color: #000000; font-size: 11px;"><em>Our investigation has concluded that there's no obvious malicious code in your apps, though the implementation accesses data that it doesn't need to.  We've restored your apps (and they'll be available on Market again once you publish them), and are looking forward to seeing them updated to use ANDROID_ID.  We are likely to make a statement about this issue this week--I'll let you know.</em></span></span></span>

我早就说过，我配合调查，我把代码提供给他们，google也做出了公正的评判，另外也给我提了一些建议（<span style="font-family: arial, sans-serif; line-height: normal; font-size: 11px; border-collapse: collapse;"><em>ANDROID_ID）。</em></span>

<span style="font-family: arial, sans-serif; color: #1f497d;"><span style="border-collapse: collapse; line-height: normal; font-size: small;"><span style="color: #000000; font-size: 11px;">2. 当时写这篇报道的</span></span></span><span style="font-family: arial, sans-serif; line-height: normal; font-size: small; border-collapse: collapse; color: #1f497d;">venturebeat记者</span><span style="font-family: arial, sans-serif; line-height: normal; font-size: 11px; border-collapse: collapse;">Dean Takahashi发来了mail，为自己犯的错误道歉，并道歉该事带来的恶劣影响，会再写一篇文章澄清这个事情以消除影响。</span>

<span style="font-family: arial, sans-serif; line-height: normal; font-size: 11px; border-collapse: collapse;">3. 那个安全公司lookout的人写邮件来要于我一起“</span><span style="font-family: arial, sans-serif; line-height: normal; font-size: 12px; border-collapse: collapse;"> We wanted to coordinate with you to prevent further misunderstandings. ”。</span>

<span style="font-family: arial, sans-serif; line-height: normal; font-size: 12px; border-collapse: collapse;">4.好几个不认识的国外记者很负责任，发邮件和gt和我交流询问事情的真相，并帮我喊冤，谢谢这些有职业精神的记者们。</span>

<span style="font-family: arial, sans-serif; line-height: normal; font-size: 12px; border-collapse: collapse;">这个事情到这差不多就结束了，其中看到很多假丑恶，也看到很多真善美！谢谢所有帮助过我的人（很多很多，就不一一列举）。</span>
