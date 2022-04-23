;; -*- lexical-binding: t; -*-

(use-package imenu
  :straight nil
  :bind ("C-c i" . imenu)
  :config
  (setq imenu-auto-rescan t))

(use-package flimenu
  :hook (after-init . flimenu-global-mode))

(provide 'pkg-imenu)
