;; -*- lexical-binding: t; -*-

(use-package meson-mode
  :ensure t
  :defer t
  :hook (meson-mode . company-mode))

(provide 'lang-meson)
