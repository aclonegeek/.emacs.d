go-ts-mode

(imp "import (" n> q n ")" q)

(fmtpf "fmt.Printf(\"" p "\", " q ")")
(fmtpln "fmt.Println(\"" q "\")")
(logpf "log.Printf(\"" p "\", " q ")")
(logpln "log.Println(\"" q "\")")

(map "map[" p "]" q)

(if "if " p " {" n> q n "}">)
(ife "if " p " {" n> p n "} else {"> n> q n "}">)
(elif "if " p " {" n> p n "} else if " p " {"> n> q n "}">)

(for "for " p " {" n> q n "}">)
(range "for " p ", " p " := range " p " {" n> q n "}">)

(switch "switch " p " {" n "case "> p ":" n> q n "}">)

(fn "func " p "(" p ") " p " {" n> q n "}">)
(type "type " p " struct {" n> q n "}">)
(iface "type " p " interface {" n> q n "}">)

(init "func init() {" n> q n "}">)
(main "func main() {" n> q n "}">)
(test "func Test" p " (t *testing.T) {" n> q n "}">)
