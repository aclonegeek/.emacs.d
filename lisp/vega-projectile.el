;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :defer t
  :hook (prog-mode . projectile-mode)
  :init
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :config
  (setq projectile-enable-caching t
        projectile-indexing-method 'alien
        projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))

(provide 'vega-projectile)
