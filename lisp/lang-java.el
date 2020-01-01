;; -*- lexical-binding: t; -*-

(use-package lsp-java
  :hook (java-mode . (lambda () (require 'lsp-java)(lsp-deferred))))

(provide 'lang-java)
