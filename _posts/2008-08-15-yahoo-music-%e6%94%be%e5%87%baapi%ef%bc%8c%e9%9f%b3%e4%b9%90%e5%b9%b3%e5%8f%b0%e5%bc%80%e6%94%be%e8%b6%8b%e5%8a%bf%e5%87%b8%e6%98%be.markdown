--- 
layout: post
comments: true
title: !binary |
  WWFob28hIE11c2ljIOaUvuWHukFQSe+8jOmfs+S5kOW5s+WPsOW8gOaUvui2
  i+WKv+WHuOaYvg==

date: 2008-8-15
link: false
categories: life
---
在<a href="http://Last.fm">Last.fm</a>宣布其开放API后，<a href="http://new.music.yahoo.com/">Yahoo! Music</a>也宣布其开放<a href="http://developer.yahoo.com/music/api_guide/">API</a>。直接看一段英文描述，不废话了，大家都看得懂，如下：
<blockquote>The music API gives developers access to Yahoo!’s “catalog of artists, albums, tracks, videos, ratings and more,” according to the company. It allows developers to interface with Yahoo! Music’s database via “charts, search, similarities, genres, artists, and user recommendations and ratings.”

The REST-based API returns data in XML, JSON, and RSS and uses BBAuth to allow user authentication for Yahoo! Music users to access their personal data via external apps. Use of the API is currently limited to 5k queries per day.</blockquote>
采用REST格式的API，使用Ruby来调用非常简单，看一段代码：
<div class="codeText">
<div class="codeHead">Ruby代码</div>
<ol class="dp-rb" start="1">
	<li class="alt"><span><span>require </span><span class="string">'yahoo-music'</span><span>  </span></span></li>
	<li><span>include Yahoo::Music  </span></li>
	<li class="alt"><span>Yahoo::Music.app_id = <span class="string">"..."</span><span> </span><span class="comment"># Put Your App ID Here</span><span>  </span></span></li>
	<li><span>artist = Artist.<span class="keyword">new</span><span>(</span><span class="string">"Beirut"</span><span>) </span><span class="comment"># Searches by name and uses first result</span><span>  </span></span></li>
	<li class="alt"><span>album = artist.releases.detect{|r| r.title == <span class="string">"Flying Club Cup"</span><span>}  </span></span></li>
	<li><span>puts album.title  </span></li>
	<li class="alt"><span>puts album.artist  </span></li>
	<li><span>puts <span class="string">"Release Date:"</span><span> + album.released_on.strftime(</span><span class="string">"%m/%d/%Y"</span><span>)  </span></span></li>
	<li class="alt"><span>puts  </span></li>
	<li><span>puts <span class="string">"Tracks"</span><span>  </span></span></li>
	<li class="alt"><span>artist.tracks.each_with_index <span class="keyword">do</span><span> |track, i|  </span></span></li>
	<li><span>puts <span class="string">"\t%d %s \t%2d:%2d"</span><span> % [i, track.title, track.duration / 60, track.duration % 60]  </span></span></li>
	<li class="alt"><span><span class="keyword">end</span><span>  </span></span></li>
</ol>
</div>
详细资料，请参考：

http://developer.yahoo.net/blog/archives/2008/08/y_music_battle_of_the_apis.html

http://developer.yahoo.com/music/

http://www.sitepoint.com/blogs/2008/08/05/yahoo-releases-music-api/

&nbsp;
