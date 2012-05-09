--- 
layout: post
comments: true
title: "\xE5\x9C\xA8RubyOnRails\xE4\xB8\xAD\xE5\xAE\x9E\xE7\x8E\xB0syntax highlighter"
date: 2008-2-15
link: false
categories: life
---
<p>在我们平时开发基于WEB的系统时，有的时候需要对需要展示的源代码做些格式化、语法分析和高亮着色，比如在blog程序中贴技术文章时，在论坛中 讨论问 题的时候，不可避免的会贴出一些代码加以辅助说明，而如果能对该代码段进行语法分析和着色，效果会更加一目了然；Rails世界向来以选择的多样性著称， 如下列举几个可行的syntax highlighter，希望对您有所帮助。</p>
<p><a id="dd8i" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#%E4%B8%80%E3%80%81%E4%BB%80%E4%B9%88%E6%98%AFSyntax_highlighting" title="一、什么是Syntax_highlighting">一、什么是Syntax_highlighting</a> <br />
<a id="ujrc" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#%E4%BA%8C%E3%80%81Syntax_highlighting%E7%9A%84%E5%8E%9F%E7%90%86" title="二、Syntax_highlighting的原理">二、Syntax_highlighting的原理</a> <br />
<a id="r26h" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#%E4%B8%89%E3%80%81%E5%87%A0%E4%B8%AA%E5%8F%AF%E7%94%A8%E7%9A%84%E5%AE%9E%E7%8E%B0%E6%96%B9%E6%B3%95" title="三、几个可用的实现方法">三、几个可用的实现方法</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="ytf3" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#1%E3%80%81GeSHi" title="1、GeSHi">1、GeSHi</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="r.z3" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#2%E3%80%81Syntax_Highlighter" title="2、Syntax_Highlighter">2、Syntax_Highlighter</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="lsmy" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#3%E3%80%81Highlight.js" title="3、Highlight.js">3、Highlight.js</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="rhlp" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#4%E3%80%81Ultraviolet" title="4、Ultraviolet">4、Ultraviolet</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="tpwg" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#5%E3%80%81ColourCode" title="5、ColourCode">5、ColourCode</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="jm_i" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#6%E3%80%81CodeRay" title="6、CodeRay">6、CodeRay</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="o.fg" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#7%E3%80%81SHJS" title="7、SHJS">7、SHJS</a> <br />
&nbsp;&nbsp;&nbsp;&nbsp;<a id="g4e2" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#8%E3%80%81google-code-prettify" title="8、google-code-prettify">8、google-code-prettify</a> <br />
<a id="an5t" href="https://docs.google.com/RawDocContents?docID=dhf86kr9_229g86m7ndg&amp;justBody=false&amp;revision=_latest&amp;timestamp=1203043407026&amp;editMode=true&amp;strip=true#%E5%9B%9B%E3%80%81%E6%80%BB%E7%BB%93" title="四、总结">四、总结</a></p>
<p>本文采用Google在线文档编写、发布的，格式比较简洁，且能随时更新和完善，就不在重复贴在这里了，文章地址如下，请自行查看：</p>
<p><a target="_blank" href="http://docs.google.com/Doc?id=dhf86kr9_229g86m7ndg">&nbsp;在RubyOnRails中实现syntax highlighter</a></p>
<p>如果对文章有疑问或者有错误的地方，请在这里回复指出，我将尽快给予回复和完善，谢谢！</p>
