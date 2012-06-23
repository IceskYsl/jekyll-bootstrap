---
layout: post
title: Debugging_Installing_apps_on_the_G1___Real_Driver_
date: '2009-3-10'
comments: true
categories: 技术归总
tags: Android Debug G1
link: true
---
<p><span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span">I konw,you can dev app and test it on the </span>simulator,but if you had a real driver,G1,you can do debug on it,very great,here is the tips for this:<span style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;" class="Apple-style-span">
<ol type="1">
    <li>On your G1, go to Settings<span class="Apple-converted-space">&nbsp;</span><img border="0" alt="Arrow" src="images/smiles/icon_arrow.gif" /><span class="Apple-converted-space">&nbsp;</span>Applications<span class="Apple-converted-space">&nbsp;</span><img border="0" alt="Arrow" src="images/smiles/icon_arrow.gif" /><span class="Apple-converted-space">&nbsp;</span>Development<span class="Apple-converted-space">&nbsp;</span><img border="0" alt="Arrow" src="images/smiles/icon_arrow.gif" /><span class="Apple-converted-space">&nbsp;</span>[X] USB debugging<span class="Apple-converted-space">&nbsp;</span></li>
    <li>Download this file:<span class="Apple-converted-space">&nbsp;</span><a style="text-decoration: none; color: rgb(39, 138, 26);" class="postlink" target="_blank" href="http://href.to/eNE">android_usb_windows.zip</a><span class="Apple-converted-space">&nbsp;</span></li>
    <li>Unzip it to a folder<span class="Apple-converted-space">&nbsp;</span></li>
    <li>Connect your G1 with your PC<span class="Apple-converted-space">&nbsp;</span></li>
    <li>When it asks for driver location choose the unzipped folder<span class="Apple-converted-space"> </span>and install the driver for it.</li>
    <li>You'll see sth like &quot;HTC Dream Composite ADB Interface&quot; on success<span class="Apple-converted-space">&nbsp;</span></li>
    <li>(Re)Start Eclipse<span class="Apple-converted-space">&nbsp;</span></li>
    <li>Your G1 should now be listed in the DDMS-Perspective under Devices<span class="Apple-converted-space">&nbsp;</span></li>
    <li>Go to the AndroidManifest.xml of your App and modify it to contain<span class="Apple-converted-space">&nbsp;</span><span style="font-family: 'Courier New';">android:debuggable=&quot;true&quot;<span class="Apple-converted-space">&nbsp;</span></span>in the &lt;application ... &gt;-Tag<span class="Apple-converted-space"> </span>,look like this:&lt;application android:icon=&quot;@drawable/icon&quot; android:label=&quot;@string/app_name&quot; <span style="background-color: rgb(255, 255, 0);">android:debuggable=&quot;true&quot;</span>&gt;</li>
    <li>Go Debug<span class="Apple-converted-space"> as usual.<br />
    </span></li>
</ol>
</span>ps: I do not upload the zip file here,you can find it via the link above,but if you can not download it,you can mail me to fetch one.</p>
<p><strong>Btw: </strong><br />
You can now install (signed)APKs via USB:</p>
<blockquote><em>D:\dev\Android\android-sdk-windows-1.0_r1\tools&gt;adb -d install D:\Workspace\keytools\AndNav_signed.apk <br />
1305 KB/s (1975987 bytes in 1.478s) <br />
pkg: /data/local/tmp/AndNav_signed.apk <br />
Success</em><br />
</blockquote>
<p><br />
And uninstall them:</p>
<blockquote><em>D:\dev\Android\android-sdk-windows-1.0_r1\tools&gt;adb uninstall org.andnav <br />
Success<br />
</em></blockquote>
<p>&nbsp;</p>
