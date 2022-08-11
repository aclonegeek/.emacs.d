# .emacs.d

Emacs master built from source.

## Installation
``` shell
./autogen.sh

./configure
--enable-link-time-optimization
--with-file-notification=no
--with-modules
--with-native-compilation
--with-pgtk
--with-sound=no
--without-compress-install
--without-dbus
--without-gconf
--without-gif
--without-gpm
--without-gsettings
--without-imagemagick
--without-jpeg
--without-lcms2
--without-libgmp
--without-libotf
--without-libsystemd
--without-m17n-flt
--without-native-image-api
--without-png
--without-rsvg
--without-selinux
--without-sqlite3
--without-tiff
--without-webp
--without-xaw3d
--without-xim
--without-xpm
CFLAGS="-O2 -pipe -mtune=native -march=native -fomit-frame-pointer"

make -j NATIVE_FULL_AOT=1
sudo make install
```

If debugging:
```
CFLAGS="-Og -ggdb3 -pipe -mtune=native -march=native"
```
