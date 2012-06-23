---
layout: post
title: Installs_Homebrew_to__usr_local_so_you_don_t_need_sudo_to__brew_install_
date: '2011-9-3'
comments: true
categories: Mac&*UNIX
tags: brew
link: true
---
$ curl https://raw.github.com/gist/323731/install_homebrew.rb  -o /tmp/install_homebrew.rb
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4569  100  4569    0     0   1605      0  0:00:02  0:00:02 --:--:--  2346

 $ ruby /tmp/install_homebrew.rb
==> This script will install:
/usr/local/bin/brew
/usr/local/Library/Formula/...
/usr/local/Library/Homebrew/...
==> The following directories will be made group writable:
/usr/local/.
/usr/local/bin
==> The following directories will have their group set to admin:
/usr/local/.
/usr/local/bin

Press enter to continue
==> /usr/bin/sudo /bin/chmod g+rwx /usr/local/. /usr/local/bin
==> /usr/bin/sudo /usr/bin/chgrp admin /usr/local/. /usr/local/bin
==> Downloading and Installing Homebrew...
Warning: The following *evil* dylibs exist in /usr/local/lib
They may break builds or worse. You should consider deleting them:
/usr/local/lib/libevent-1.4.2.1.3.dylib
/usr/local/lib/libevent_core-1.4.2.1.3.dylib
/usr/local/lib/libevent_extra-1.4.2.1.3.dylib
/usr/local/lib/libkyotocabinet.4.8.0.dylib
/usr/local/lib/libprotobuf-lite.6.dylib
/usr/local/lib/libprotobuf.6.dylib
/usr/local/lib/libprotoc.6.dylib
==> Installation successful!
Now type: brew help

参考：https://gist.github.com/323731
