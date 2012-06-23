---
layout: post
title: ImageMagick够折腾得，no decode delegate
date: '2009-11-23'
comments: true
categories: Mac&*UNIX Ruby&Rails
tags: delegate ImageMagick
link: true
---
估计RP出问题了，以前安装和今天在mac上安装都很顺利，但是在服务器上装得时候，出现一大堆得问题，极度诡异，最后查了N多资料，改了N多东西，也不晓得最后是哪个生效了，终于折腾好了.
记录下我参考过得资料：
http://www.imagemagick.org/script/command-line-processing.php
http://wanguan2000.blog.ubuntu.org.cn/2009/01/04/ubuntu-下rmagick的安装/
http://infrastacks.com/?p=57
http://hi.baidu.com/yttxuehui/blog/item/9f1a21978d6fa96a55fb96d5.html
http://www.blogjava.net/fl1429/archive/2009/06/17/282895.html
http://hi.baidu.com/countryroadtao/blog/item/225c72dad2adc16cd0164e97.html
http://www.cnscn.org/htm_data/602/0705/8717.html
http://stackoverflow.com/questions/1483968/imagemagick-convert-error-wrong-jpeg-library-version-library-is-62-caller-expe
我读最后一个问题印象深刻
"Looks like it is reading the wrong jpeg ibrary, but I have jpeg 7 installed. How do i tell ImageMagick to look up the right JPEG library version(I don't care 62 or 70 as long as it works)."
root@li84-64:/data/soft/ImageMagick-6.5.7-9# convert -list format | grep JPEG
           see part 5 which describes the image encoding (RLE, JPEG, JPEG-LS),
           and supplement 61 which adds JPEG-2000 encoding.
      JNG* PNG       rw-   JPEG Network Graphics
      JP2* JP2       rw-   JPEG-2000 File Format Syntax
      JPC* JPC       rw-   JPEG-2000 Code Stream Syntax
     JPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (70)
      JPG* JPEG      rw-   Joint Photographic Experts Group JFIF format (70)
      JPX* JPX       rw-   JPEG-2000 File Format Syntax
      PGX* PGX       r--   JPEG-2000 VM Format
    PJPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (70)

看到其需要得JPEG得lib是70，但是我装得是

root@li84-64:/data/soft/ImageMagick-6.5.7-9# dpkg --list | grep "magick"
rc  imagemagick                       7:6.4.5.4.dfsg1-1ubuntu3.1       image manipulation programs
ii  libmagick++10                     7:6.3.7.9.dfsg1-2ubuntu1.1       C++ API to the ImageMagick library
ii  libmagick++9-dev                  7:6.3.7.9.dfsg1-2ubuntu1.1       C++ API to the ImageMagick library - develop
ii  libmagick10                       7:6.3.7.9.dfsg1-2ubuntu1.1       image manipulation library
ii  libmagick9-dev                    7:6.3.7.9.dfsg1-2ubuntu1.1       image manipulation library - development fil
ii  libmagickcore1                    7:6.4.5.4.dfsg1-1ubuntu3.1       low-level image manipulation library
ii  libmagickwand1                    7:6.4.5.4.dfsg1-1ubuntu3.1       image manipulation library
ii  librmagick-ruby                   1.15.11-1ubuntu1                 ImageMagick API for Ruby
ii  librmagick-ruby1.8                1.15.11-1ubuntu1                 ImageMagick API for Ruby
