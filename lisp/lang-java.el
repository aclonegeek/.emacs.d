;; -*- lexical-binding: t; -*-

(use-package lsp-java
  :ensure t
  :hook (java-mode . (lambda () (require 'lsp-java)(lsp))))

(provide 'lang-java)
