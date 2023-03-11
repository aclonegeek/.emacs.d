;; -*- lexical-binding: t; -*-

(use-package xref
  :elpaca nil
  :defer t
  :config
  (setq xref-search-program 'ripgrep
        xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(provide 'core-xref)
