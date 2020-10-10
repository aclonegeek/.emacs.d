;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :hook (prog-mode . projectile-mode)
  :config
  (setq projectile-enable-caching    t
        projectile-indexing-method   'alien
        projectile-generic-command   "fd . -0")
  (add-to-list 'projectile-globally-ignored-directories ".clangd"))


(provide 'pkg-projectile)
