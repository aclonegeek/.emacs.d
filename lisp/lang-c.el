;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package ccls
  :ensure t
  :bind ("C-c c" . compile)
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls)(lsp)))
  :config
  (setq ccls-sem-highlight-method 'font-lock))

(provide 'lang-c)
