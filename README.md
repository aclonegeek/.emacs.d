# .emacs.d

Emacs master built from source.

## Installation
``` shell
./autogen.sh

./configure
--enable-link-time-optimization
--with-modules
--with-pgtk
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
--with-native-compilation
CFLAGS="-O2 -pipe -mtune=native -march=native -fomit-frame-pointer"

make -j NATIVE_FULL_AOT=1
sudo make install
```
