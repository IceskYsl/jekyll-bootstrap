---
layout: post
title: 谈谈我使用过的几个国外服务器提供商
date: '2008-4-11'
comments: true
categories: Ruby&Rails
link: true
---
<p>今天在<a href="http://www.williamlong.info/archives/1301.html">月光的blog</a>上看到其对<strong>DreamHost</strong>的抱怨，说起存在&ldquo;<strong>过度销售</strong>&rdquo;的现象，具体的可以看<a href="http://www.williamlong.info/archives/1301.html">这里</a>（http://www.williamlong.info/archives/1301.html）。</p>
<p>这里说说我自己使用过的和了解到的国外服务器提供商的个人感受，纯属个人感受，请不要乱扣帽子。我选空间的用途主要是有2个，<strong>其一</strong>是运行一些我开发的开源的系统（比如1stlog，byeloo！等）的Demo，用来演示或者流量不大的应用；<strong>其二</strong>是为客户选择的跑商业化的RoR应用。所以我选择的服务区必须可以支持RubyOnRails应用。</p>
<p>我使用过的国外提供商有<strong>BlueHost</strong>，<strong>DreamHost</strong>和<strong>SliceHost</strong>，我试用过的有亚马逊的<strong>EC2</strong>，<strong>RaislHost</strong>,<strong>hostingrails</strong>和<strong>railsplayground</strong>；我了解过的有<strong>mt</strong>和<strong>Railsmeches</strong>，如下分别说说个人感受：</p>
<p><strong>1、BlueHost：</strong>这个是我最开始使用的国外的服务器，当时是从朋友那分了一些空间过来使用的，因为最开始的时候，Rails的服务器并不多，貌似只有BH和DH吧，呵呵，BH虽然支持Rails，但是限制相当多，我记得当时我写的&ldquo;<a href="http://www.itechtag.com/">技能云</a>&rdquo;就放上面，那次被InfoQ报道了下后，那天流量稍微大些，就撑不住了。且速度一般般，映像不咋好，后来就撤离了。</p>
<p dragover="true"><strong>2、DreamHost：</strong>这个我使用的时间比较长，包括现在这个blog也是放在上面的，总的来说，马马虎虎，只能用来放个人blog和一些Demo等，不适合做商业站点使用；我开始使用的是<strong>Share</strong>模式的，但是后来开发的一个系统需要在后台跑一些定时JOB，其不支持，就只能开通其<strong>PS</strong>服务（这个速度相当慢，我等了20多天，来来回回的交互了好多次邮件，他们都说申请开通PS的客户太多，他们忙不过来，需要耐心的等，后来最后我怒了，说再不搞好，我就给我所有的客户选择SliceHost，这招见效，立马搞定，推荐大家使用，哈哈）。</p>
<p>其Share模式的用户非常的多，月光说他的那个服务器上有380个shell用户和1600多的FTP，都是很正常的，主要是其销售模式，带来巨量的用户群，而其宣称的500G空间和5T的月流量，无限子域名，无限MYSQL库等等，都是扯淡的，为了吸引眼球和骗那些新入手的朋友，他们对CPU和内存的限制非常严格（这就是他们的高明之处），一旦超过内存和CPU，你必须升级到PS模式。</p>
<p>而升级到PS模式（最低是150M内存/150MHZCPU/15美刀/月，以此随自己调解，以10MHZcpu/10M内存/1美刀/月的价格）以后，他会再三提醒您，如果mem不够，请增加自己的内存等。</p>
<p>虽然PS号称是&rdquo;私有服务器&ldquo;，其效果和许诺的CPU和MEM都可以得到保证，但是也不是很稳定，毕竟用户群那么大，出问题的小概率事件也会很多的。</p>
<p>值得称道的是，他们的技术支持还是不错的，我每次发邮件问，基本上很快就给我比较明确的答复；另外，DH的网速还是不错的（就我使用的那个服务器看）；其操作面板比较容易操作，也非常强大。付款比较方便，支持信用卡，paypal以及google checkout等。</p>
<p>总的来说：DH的share模式比较适合流量小的和一些demo演示之类的应用，不适合商业化的服务；PS模式稍微好点，但是要做好down机的准备，呵呵。</p>
<p><strong>3、SliceHost：</strong>这个应该是最便宜的VPN提供商了，其比较专业，以VPN的方式提供服务，可以选择的种类最低是256M独立内存，可以自己选择操作系统类型，自己装web服务器等，其技术文档比较多且可操作性比较好，但是其技术支持不是很到位，我只在chat里和他们沟通过，没发过邮件。</p>
<p>SliceHost我上次使用的是256M的ubuntu7.10+nginx+mogrel集群跑的一个Rails应用，用apache的ab压力测了下，效果还不错，且没有出现down机等不稳定现象的出现，比较令人满意。</p>
<p>但是有个问题，需要注意，我当时需要在程序里么net/http 取国内一些网站上的资源，速度很让人郁闷，有时候竟然只有900B/秒，相当慢。我曾和他们的技术支持沟通，他们给的解释是&ldquo;<em>SliceHsot在美国，而您要取得资源在中国，这个网路上的事情，我们也无能为力</em>&rdquo;，所以，如果您有类似需求，请千万注意。</p>
<p>其他几个，类似EC2和Mt等，由于我没有实际长时间使用过，这里就不评价了，最近会逐一试试，以后再补充这个文章。</p>
<p>如果您使用过其他的国外的服务器，还请分享一二；或者想更多的了解我使用过的这些服务器，请留言即可。</p>
