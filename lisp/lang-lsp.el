;; -*- lexical-binding: t; -*-

(use-package eglot
  :ensure t
  :bind (:map eglot-mode-map
              ("C-c l a" . eglot-code-actions)
              ("C-c l r" . eglot-rename))
  :hook (((c-mode c++-mode go-mode) . eglot-ensure)))


(provide 'lang-lsp)
