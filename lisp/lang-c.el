;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package ccls
  :ensure t
  :defer t
  :bind ("C-c c" . compile)
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls)(lsp))))

(provide 'lang-c)
