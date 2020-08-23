# .emacs.d

Emacs master built from source.

## Installation
``` shell
./autogen.sh

./configure
--with-x-toolkit=lucid
--with-modules
--with-x
--with-file-notification=no
--with-sound=no
--without-compress-install
--without-dbus
--without-gif
--without-gpm
--without-imagemagick
--without-jpeg
--without-lcms2
--without-libgmp
--without-libotf
--without-libsystemd
--without-m17n-flt
--without-makeinfo
--without-png
--without-rsvg
--without-selinux
--without-tiff
--without-toolkit-scroll-bars
--without-gsettings
--without-gconf
--without-xaw3d
--without-xim
--without-xpm
CFLAGS="-O2 -g3 -mtune=native -march=native"

make -j
sudo make install
```
