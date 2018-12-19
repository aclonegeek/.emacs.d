;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package ccls
  :ensure t
  :defer t
  :hook ((c-mode   . (lambda () (require 'ccls)(lsp)))
         (c++-mode . (lambda () (require 'ccls)(lsp)))))

(provide 'lang-c)
