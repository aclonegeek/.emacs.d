;; -*- lexical-binding: t; -*-

(use-package avy
  :ensure t
  :bind (("C-=" . avy-goto-char)
         ("C-+" . avy-goto-char-2))
  :config
  (setq avy-background t))

(provide 'vega-avy)
