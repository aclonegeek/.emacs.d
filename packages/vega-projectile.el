;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :defer 1
  :hook ((python-mode . projectile-mode)
         (rust-mode   . projectile-mode))
  :config
  (setq projectile-enable-caching t
        ;; External indexing for Windows.
        projectile-indexing-method 'alien
        projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))

(provide 'vega-projectile)
