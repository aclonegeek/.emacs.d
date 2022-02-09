;; -*- lexical-binding: t; -*-

(use-package xref
  :config
  (setq xref-search-program 'ripgrep
        xref-show-xrefs-function #'xref-show-definitions-completing-read
        xref-show-definitions-function #'xref-show-definitions-completing-read))

(provide 'pkg-xref)
