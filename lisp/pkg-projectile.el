;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :hook (prog-mode . projectile-mode)
  :config
  (setq projectile-enable-caching    t
        projectile-indexing-method   'alien
        projectile-completion-system 'ivy
        projectile-generic-command   "fd . -0")
  (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))

(provide 'pkg-projectile)
