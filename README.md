# .emacs.d

Emacs master built from source.

## Installation
``` shell
./autogen.sh

./configure
--enable-link-time-optimization
--without-all
--with-cairo
--with-gnutls
--with-harfbuzz
--with-json
--with-modules
--with-native-compilation
--with-pgtk
--with-small-ja-dic
--with-threads
--with-toolkit-scroll-bars
--with-xml2
--with-zlib
CFLAGS="-O2 -pipe -mtune=native -march=native -fomit-frame-pointer"

make -j NATIVE_FULL_AOT=1
sudo make install
```

If debugging:
```
CFLAGS="-Og -ggdb3 -pipe -mtune=native -march=native"
```
