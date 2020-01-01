;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package ccls
  :ensure t
  :bind ("C-c c" . compile)
  :hook ((c-mode c++-mode) . (lambda () (require 'ccls)(lsp-deferred)))
  :config
  (setq ccls-sem-highlight-method 'font-lock))

(use-package cmake-mode
  :ensure t
  :defer t)

(provide 'lang-c)
