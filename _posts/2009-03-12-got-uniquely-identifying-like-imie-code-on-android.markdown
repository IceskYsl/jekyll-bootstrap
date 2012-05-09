--- 
layout: post
comments: true
title: Got Uniquely Identifying like IMIE code on Android
date: 2009-3-12
link: false
categories: life
---
<p>In some case,you may want do get&nbsp; Uniquely Identifying&nbsp; for a&nbsp; 'real' android phone,such as IMEI code,SimOperator etc, and we all kown ,the IMEI like ID card,and you can use TelephonyManager to get it,some usefull codes like this :</p>
<div class="codeText">
<div class="codeHead">Java代码</div>
<ol class="dp-j" start="1">
    <li class="alt"><span><span class="keyword">public</span><span>&nbsp;</span><span class="keyword">void</span><span>&nbsp;fetch_status(){&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;TelephonyManager&nbsp;tm&nbsp;=&nbsp;(TelephonyManager)&nbsp;<span class="keyword">this</span><span>&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;.getSystemService(Context.TELEPHONY_SERVICE);<span class="comment">//&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;str&nbsp;=&nbsp;<span class="string">&quot;&quot;</span><span>;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;DeviceId(IMEI)&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getDeviceId()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;DeviceSoftwareVersion&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getDeviceSoftwareVersion()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;Line1Number&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getLine1Number()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;NetworkCountryIso&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getNetworkCountryIso()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;NetworkOperator&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getNetworkOperator()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;NetworkOperatorName&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getNetworkOperatorName()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;NetworkType&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getNetworkType()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;PhoneType&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getPhoneType()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SimCountryIso&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSimCountryIso()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SimOperator&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSimOperator()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SimOperatorName&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSimOperatorName()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SimSerialNumber&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSimSerialNumber()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SimState&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSimState()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;SubscriberId(IMSI)&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getSubscriberId()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;str&nbsp;+=&nbsp;<span class="string">&quot;VoiceMailNumber&nbsp;=&nbsp;&quot;</span><span>&nbsp;+&nbsp;tm.getVoiceMailNumber()&nbsp;+&nbsp;</span><span class="string">&quot;\n&quot;</span><span>;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></li>
    <li class=""><span>&nbsp;&nbsp;&nbsp;&nbsp;TextView&nbsp;sys&nbsp;=&nbsp;(TextView)&nbsp;findViewById(R.id.sys);&nbsp;&nbsp;</span></li>
    <li class="alt"><span>&nbsp;&nbsp;&nbsp;&nbsp;sys.setText(str);&nbsp;&nbsp;</span></li>
    <li class=""><span>}&nbsp;&nbsp;</span></li>
</ol>
</div>
<p>and,your output like here.</p>
<p>some userfull resource link:</p>
<p><a href="http://developer.android.com/reference/android/telephony/TelephonyManager.html">http://developer.android.com/reference/android/telephony/TelephonyManager.html</a></p>
