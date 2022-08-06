;; -*- lexical-binding: t; -*-

(use-package embark
  :bind (("C-;" . embark-act)
         ("C-:" . embark-export)))

(use-package embark-consult
  :after embark)

(provide 'pkg-embark)
