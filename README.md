# .emacs.d

Emacs 27 built from source.

## Installation
``` shell
./autogen.sh

./configure
--with-x-toolkit=lucid
--with-sound=no
--without-xpm
--without-tiff
--without-gif
--without-png
--without-rsvg
--without-lcms2
--without-libsystemd
--without-imagemagick
--without-toolkit-scroll-bars
--without-xaw3d
--without-xim
--without-dbus
--without-gsettings
--without-gconf
--without-selinux
--without-makeinfo
--without-zlib
--without-libgmp
--without-compress-install
--with-modules
--with-x
'CFLAGS= -O2 -g3'

make -j4
sudo make install
```
