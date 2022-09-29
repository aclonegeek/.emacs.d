c-mode c++-mode

(def "#define " q)
(inc "#include <" q ">")

(i8 "int8_t " q)
(i16 "int16_t " q)
(i32 "int32_t " q)
(i64 "int64_t " q)
(u8 "uint8_t " q)
(u16 "uint16_t " q)
(u32 "uint32_t " q)
(u64 "uint64_t " q)

(if "if (" p ") {" n> q n "}">)
(ife "if (" p ") {" n> p n "} else {"> n> q n "}">)
(elif "if (" p ") {" n> p n "} else if (" p ") {"> n> q n "}">)

(for "for (" p "; " p "; " p ") {" n> q n "}">)
(while "while (" p ") {" n> q n "}">)

(fn p "(" p ") {" n> q n "}">)
