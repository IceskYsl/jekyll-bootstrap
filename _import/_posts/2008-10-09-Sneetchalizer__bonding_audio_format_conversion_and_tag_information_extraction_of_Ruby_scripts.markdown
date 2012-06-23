---
layout: post
title: ! 'sneetchalizer: 粘合audio格式转换和tag信息提取的Ruby脚本'
date: '2008-10-9'
comments: true
categories: Ruby&Rails
tags: sneetchalizer
link: true
---
前几天写了“<a href="http://iceskysl.1sters.com/?action=show&amp;id=406">采用Ruby提取MP3的metadata信息</a>”后，就在寻找成熟的Ruby代码做差不多的事情，今天找到一个<a href="http://badcomputer.org/unix/code/sneetchalizer/">sneetchalizer</a>，仔细的看了下，非常强大。

<img src="http://badcomputer.org/unix/code/sneetchalizer/Do%20not%20leach%20my%20bandwidth%20asshole.jpg" alt="" />

sneetchalizer其实只是个粘合剂，因为在*unix下，audio格式转换的lib已经非常丰富和成熟，例如<a href="http://lame.sourceforge.net/">lame</a>,<a href="http://freshmeat.net/projects/gogo/">gogo</a>,<a href="http://freshmeat.net/projects/bladeenc/">bladeenc</a>,<a href="http://www.mplayerhq.hu/">mplayer</a>等等就非常好用；另外，关于audio的tag信息和metadata信息的提取也有比较成熟的lib了，类似<a href="http://rubyforge.org/projects/id3lib-ruby/">id3lib-ruby library</a>,<a href="http://badcomputer.org/unix/code/wmainfo/">wmainfo-rb library</a>,<a href="http://rubyforge.org/projects/ruby-ogginfo/">ruby-ogginfo library</a>等等。而sneetchalizer只是把这些tools粘合起来。

其支持的格式有:'aac' 'aif' 'aifc' 'aiff' 'aiffc' 'ape' 'au' 'caf' 'cdda' 'cdr' 'copy' 'fap' 'flac' 'gsm''ircam' 'm4a' 'm4b' 'mat' 'mat4' 'mat5' 'mp2' '<strong>mp3</strong>' 'mp4' 'mpc' 'mpp' 'nist' 'ofr''ofs' '<strong>ogg</strong>' 'paf' 'pvf' 'raw' 'sd2' 'sds' 'sf' 'snd' 'spx' 'svx' 'tta' 'voc''vox' 'w64' '<strong>wav</strong>' '<strong>wma</strong>' 'wv' 'xi'

使用sneetchalizer可以实现audio文件的格式转换和tag信息提取和写入，详细使用方法参考其主页上说明，下面简要的说说起安装方法和使用参数：

<strong>1、安装方法</strong>

直接下载其gz包，<a href="http://badcomputer.org/unix/code/sneetchalizer/src/sneetchalizer-0.9.0.tar.gz">sneetchalizer-0.9.0</a>是现在的最新版本。下载解包后可以看到：
<div class="codeText">
<div class="codeHead">Manifest:</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>README                - You're reading it now.  </span></span></li>
	<li><span>LICENSE               - A copy of the GPL, under which sneetchalizer is released.  </span></li>
	<li class="alt"><span>CHANGES               - sneetchalizer's cvs/svn commit log.  </span></li>
	<li><span>sneetchalizer         - The script itself.  </span></li>
	<li class="alt"><span>sneetchalizer.1       - The manpage for sneetchalizer.  </span></li>
	<li><span>sneetchalizer.desktop - A KDE service menu for converting with Konqueror.  </span></li>
	<li class="alt"><span>install.rb            - A quick and dirty script to install the sneetchalizer.  </span></li>
</ol>
</div>
如果有root权限，可以直接运行<span>install.rb，其会将</span><span>sneetchalizer拷贝到/usr/bin下，将</span><span>sneetchalizer.1拷贝到/usr/share/man/man1下。</span>

<strong><span>2、参数解释</span></strong>

<span>不翻译了，都挺简单明了的，如下：</span>
<div class="codeText">
<div class="codeHead">XML/HTML代码</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>General options:  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>-h or --help  </span></li>
	<li><span>    Print quick or full usage details respectively.  </span></li>
	<li class="alt"><span>-r or --recursive  </span></li>
	<li><span>    Search directory arguments recursively for files to convert.  </span></li>
	<li class="alt"><span>-d or --delete  </span></li>
	<li><span>    delete input files after successful conversion. May not be safe yet!!!  </span></li>
	<li class="alt"><span>-v or --verbose  </span></li>
	<li><span>    makes sneetchalizer more chatty.  </span></li>
	<li class="alt"><span>-s or --show-output  </span></li>
	<li><span>    shows output from conversion tool.  </span></li>
	<li class="alt"><span>-p or --pretend  </span></li>
	<li><span>    don't convert anything. sneetchalizer will go through the motions and print out the commands it would run. Useful for preview- ing a complex command line to ensure it does what you intend. You should interpret this option's output with a grain of salt. For example, if you include the '--sanitize' option, the files will not really be renamed when using --pretend, and as such the command's output will not reflect that the filenames would be changed during an actual run.  </span></li>
	<li class="alt"><span>-t or --terminate  </span></li>
	<li><span>    terminate sneetchalizer options. This is useful if you have to convert '--coolDir' or '-groovySong.mp3'. This is the only option whose order on the command line is significant.  </span></li>
	<li class="alt"><span>-D ARG or <span class="attribute">--out-directory</span><span>=</span><span class="attribute-value">ARG</span><span>  </span></span></li>
	<li><span>    write all outfiles to a directory argument. This is useful if you want to (re)encode files directly to a mounted portable device.  </span></li>
	<li class="alt"><span>--strict and --pedantic  </span></li>
	<li><span>    many errors that sneetchalizer may encounter are recoverable, such as specifying a directory as argument that contains no files to convert, or conversion failures in general. By default the script will print an error message and move on to the next file. If you use '--strict' then sneetchalizer will bail out at the first sign of trouble except for tag errors. With '--pedantic' the script will stop even on tag errors.   </span></li>
	<li class="alt"><span>--stasis  </span></li>
	<li><span>    Preserve timestamp (mtime) of original file.  </span></li>
	<li class="alt"><span>--threads [N]  </span></li>
	<li><span>    Experimental. Use threads to create concurrent jobs. This option takes an optional integer argument which represents the number of threads to launch. The default is two. Preliminary tests suggest there is little advantage (and even diminishing returns) when setting this number greater than the number of cores/CPUs you have. Due to the asychronous nature of threads the --verbose and --show-output flags will be silently disabled and most screen output is supressed.   </span></li>
	<li class="alt"><span>--sanitize  </span></li>
	<li><span>    Removes ,, ;, :, ', ", %, @, #, and ` from filenames and tags.  </span></li>
	<li class="alt"><span>-n [FORMAT] or --rename[=FORMAT]  </span></li>
	<li><span>    rename all outfiles (and temporary wavs) according to FORMAT. FORMAT is a string with special designators to be pulled from the file tags. The following options are available:  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>        * %t Song title  </span></li>
	<li class="alt"><span>        * %b Album title  </span></li>
	<li><span>        * %n Track number  </span></li>
	<li class="alt"><span>        * %a Artist name  </span></li>
	<li><span>        * %y Year  </span></li>
	<li class="alt"><span>        * %g Genre  </span></li>
	<li><span>        * %c Comment field  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>    Directories may be created with this command, as in "%b/%n - %t". The default value of FORMAT is "%n %t".   </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>Bitrate/Quality/Compression options:  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>-b or --bitrate  </span></li>
	<li class="alt"><span>    mp3/ogg/m4a bitrate.  </span></li>
	<li><span>-q or --quality  </span></li>
	<li class="alt"><span>    mp3/ogg quality.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>quality and bitrate are passed directly to lame or oggenc depending on mp3 or ogg output format respectively. Both tools can handle either a bitrate or quality argument, so it is important to understand what values are valid for the underlying tool in your specific use case. faac will accept a bitrate argument, but not a quality argument. These options will be silently ignored for any output formats other than mp3, ogg or m4a. Make sure you know what you are doing if you decide to use both in one run, and read each tools manpage for valid values. If these options are omitted the tools builtin defaults are used (-q3 for oggenc and -q5 for lame).  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>-c or --compression  </span></li>
	<li><span>    flac/mac compression level.  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>this option allows you to pass a compression argument to flac and mac. See 'flac --help' and/or 'mac --help' if you don't know what this means.  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>Format Options:  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span><span class="attribute">--out</span><span>=</span><span class="attribute-value">format</span><span>  </span></span></li>
	<li class="alt"><span>    output format. Default is wav.  </span></li>
	<li><span><span class="attribute">--in</span><span>=</span><span class="attribute-value">format</span><span>[,format..]  </span></span></li>
	<li class="alt"><span>    input format(s). Default is wav.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Valid output formats are: "aac", "aif", "aifc", "aiff", "aiffc", "ape", "au", "cdr", "cdda", "copy", "flac", "m4a", "m4b", "mpc", "mp4", "mpp", "mp3", "mp2", "ofr", "ofs", "ogg", "snd", "spx", "tta", "wav", "wv". Valid input formats are all of the above plus "wma". You can specify multiple input formats using a comma: 'mp3,m4a,wma'. Input format is only neccesary when passing directory arguments, as file arguments are handled by context (read: file extension). The "copy" output option copies files directly, bypassing decoding/encoding steps (useful in conjunction with --rename).  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Tagging Options:  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>--tt or --title  </span></li>
	<li><span>    Set 'title' tag.  </span></li>
	<li class="alt"><span>--ta or --artist  </span></li>
	<li><span>    Set 'artist' tag.  </span></li>
	<li class="alt"><span>--tl or --album  </span></li>
	<li><span>    Set 'album' tag.  </span></li>
	<li class="alt"><span>--ty or --year  </span></li>
	<li><span>    Set 'year' tag.  </span></li>
	<li class="alt"><span>--tc or --comment  </span></li>
	<li><span>    Set 'comment' tag.  </span></li>
	<li class="alt"><span>--tg or --genre  </span></li>
	<li><span>    Set 'genre' tag.  </span></li>
	<li class="alt"><span>--tn or --trackn  </span></li>
	<li><span>    Set 'track number' tag.  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>The short and long versions are different in an important way: Using the long version will clobber any existing tags. The short version will only set the tag if the existing tag has no value. Note that these tags will be placed in _every_ outfile during the run.  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>Alternative Encoder/Decoder Options:  </span></li>
	<li class="alt"><span>  </span></li>
	<li><span>--gogo  </span></li>
	<li class="alt"><span>    use gogo to encode mp3 files.  </span></li>
	<li><span>--bladeenc  </span></li>
	<li class="alt"><span>    use bladeenc to encode mp3 files.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>The default is still 'lame'. If 'lame' is not found, the script will search for one of these two encoders regardless if these options are passed or not.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Special Options:  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span><span class="attribute">--in-optionhook</span><span>=</span><span class="attribute-value">ARG</span><span>  </span></span></li>
	<li><span>    add ARG to infile conversion command. Possibly dangerous!  </span></li>
	<li class="alt"><span><span class="attribute">--out-optionhook</span><span>=</span><span class="attribute-value">ARG</span><span>  </span></span></li>
	<li><span>    add ARG to outfile conversion command. Possibly dangerous!   </span></li>
</ol>
</div>
另外，你可以运行sneetchalizer -h看到简要的使用说明，也可以使用sneetchalizer --help看到详细的使用信息。

<strong>3、使用示例</strong>

如下简要的写几个使用的示例：
<div class="codeText">
<div class="codeHead">使用示例：</div>
<ol class="dp-xml" start="1">
	<li class="alt"><span><span>$ sneetchalizer song.mp3  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>The most simple possible example, creates 'song.wav'.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>$ sneetchalizer <span class="attribute">--out</span><span>=</span><span class="attribute-value">ogg</span><span> </span><span class="attribute">--in</span><span>=</span><span class="attribute-value">flac</span><span> -q5 /some/music/dir  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>This example converts every flac file in '/some/music/dir' to ogg format at quality 5.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>$ sneetchalizer -d <span class="attribute">--out</span><span>=</span><span class="attribute-value">mp3</span><span> </span><span class="attribute">--in</span><span>=</span><span class="attribute-value">ogg</span><span>,m4a,wma -b 160 .  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Converts every ogg, m4a, and wma file in the current directory to a 160 kbps constant bitrate mp3 file. The original files are deleted.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>$ sneetchalizer <span class="attribute">--out</span><span>=</span><span class="attribute-value">mp3</span><span> </span><span class="attribute">--out-optionhook</span><span>=</span><span class="attribute-value">"--preset extreme"</span><span> /some/wavs  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Here we encode every wav in '/some/wavs' to mp3 format passing '--preset extreme' directly to lame.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>$ sneetchalizer <span class="attribute">--in</span><span>=</span><span class="attribute-value">ogg</span><span> </span><span class="attribute">--out</span><span>=</span><span class="attribute-value">ogg</span><span> </span><span class="attribute">--quality</span><span>=</span><span class="attribute-value">1</span><span> norvegianWood.ogg /some/more/oggs  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Using the same --in and --out format allows us to resample/encode the file at a different bitrate or quality. Note that this will overwrite the original file so only do this on a copy, or use '-D' to write files to another directory.  </span></li>
	<li><span>  </span></li>
	<li class="alt"><span>$ sneetchalizer <span class="attribute">--in</span><span>=</span><span class="attribute-value">ogg</span><span> </span><span class="attribute">--out</span><span>=</span><span class="attribute-value">m4a</span><span> -D /mnt/ipod/ /some/oggs  </span></span></li>
	<li><span>  </span></li>
	<li class="alt"><span>Here we re-encode some ogg files to m4a format and write them to our mounted iPod.   </span></li>
</ol>
</div>
<strong>4、注意事项</strong>

本脚本只是粘合剂，其他的tool还是需要另外安装的。

其他信息请参考其主页说明,如果您有这个方面的问题或经验，欢迎和我讨论。

<span>
</span>

&nbsp;
