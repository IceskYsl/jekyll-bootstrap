---
layout: post
title: 在Android中计算GPS两点间的距离/速度
date: '2009-1-18'
comments: true
categories: Android&Java
link: true
---
<p>Q:<span class="postbody">how to get distance between two GeoPoints in sdk 1.0 ? MapPoint.distanceSquared(MapPoint) is gone <img border="0" alt="Sad" src="http://www.anddev.org/images/smiles/sad.png" /> <br />
thaks!! <br />
</span></p>
<p><span class="postbody">A:</span><span class="postbody">you'll need to brush up on your trigonometry, and first compute the Haversine function (this is the standard way of doing it). In order to use the Java trig functions, you'll have to first convert all your angles from degrees to radians. <br />
Given two longitude/latitude pairs, and the earth's average radius (assume 6356.78km for your calculations), <br />
you can calculate the distance between the 2 points via this Java code: <br />
<br />
<strong>     	double EarthRad = 6356.78;	// in km ! </strong><br />
// first convert to radians... <br />
double geo1_lat = geo1.getLatitude()*java.lang.Math.PI/360; <br />
double geo1_lng = geo1.getLongitude()*java.lang.Math.PI/360; <br />
double geo2_lat = geo2.getLatitude()*java.lang.Math.PI/360; <br />
double geo2_lng = geo2.getLongitude()*java.lang.Math.PI/360; <br />
<br />
double deltaLat = java.lang.Math.abs(java.lang.Math.abs(geo2_lat) - java.lang.Math.abs(geo1_lat)); <br />
double deltaLng = java.lang.Math.abs(java.lang.Math.abs(geo2_lng) - java.lang.Math.abs(geo1_lng)); <br />
<br />
double dist = 2*EarthRad*java.lang.Math.asin(java.lang.Math.sqrt(haversine(deltaLat) <br />
+ java.lang.Math.cos(pair1_lat) <br />
*java.lang.Math.cos(pair1_lng)*haversine(deltaLng))); <br />
<br />
Where &quot;dist&quot; now contains the distance between along the earth's surface. <br />
You can find the Haversine function trig equation by Googling it, then construct a method that returns the appropriate value.</span></p>
<p><span class="postbody">Computing the speed is straightforward: you know your sampling frequency, and you now know the distance between the most recent two points, so, employee speed = distance / sampling interval</span></p>
<p><span class="postbody">参考：http://www.anddev.org/distance_between_two_geopoints_in_sdk10-t4195.html</span></p>
<p><span class="postbody">http://www.anddev.org/calculating_distance_between_two_gps_points-t3708.html</span></p>
<p><span class="postbody"><br />
</span></p>
