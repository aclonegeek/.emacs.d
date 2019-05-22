;; -*- lexical-binding: t; -*-

(use-package avy
  :ensure t
  :bind (("C-=" . avy-goto-word-or-subword-1)
         ("C-+" . avy-goto-char-2))
  :config
  (setq avy-background t))

(provide 'pkg-avy)
