;; -*- lexical-binding: t; -*-

(use-package xref
  :defer t
  :config
  (setq xref-search-program 'ripgrep
        xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(provide 'pkg-xref)
