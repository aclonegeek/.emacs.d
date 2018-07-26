;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :defer t
  :hook ((emacs-lisp-mode . projectile-mode)
         (python-mode     . projectile-mode)
         (rust-mode       . projectile-mode))
  :init
  (setq projectile-keymap-prefix (kbd "C-c p"))
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
