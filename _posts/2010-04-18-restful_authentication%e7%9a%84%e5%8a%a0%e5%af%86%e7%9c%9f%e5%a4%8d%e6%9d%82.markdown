--- 
layout: post
comments: true
title: !binary |
  cmVzdGZ1bF9hdXRoZW50aWNhdGlvbueahOWKoOWvhuecn+Wkjeadgg==

date: 2010-4-18
link: false
categories: life
---
以前一个项目中直接使用了restful_authentication，耶没怎么管生成的密码是啥样的，最近有几个系统要对接，需要统一用户，于是看了下restful_authentication的密码加密原则，发现其真是负责，一共分成下面几个部分：

1.定义了一个40位的REST_AUTH_SITE_KEY和一样我常量10的REST_AUTH_DIGEST_STRETCHES；

2.随机生成一个salt，其salt生成的规则是secure_digest(Time.now, (1..10).map{ rand.to_s })，而secure_digest是Digest::SHA1.hexdigest来生成的，也是40位。

3.将salt和原始密码，混合前面定义的REST_AUTH_SITE_KEY，反复加密REST_AUTH_DIGEST_STRETCHES次，得到最终的一个digest就是密码了。

够复杂～ 为啥搞这么负责呢，直接随机salt加双MD5不可逆加密也应该够用了吧。
