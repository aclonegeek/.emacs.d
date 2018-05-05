;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'projectile-mode)
  (add-hook 'python-mode-hook 'projectile-mode))

(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))

(provide 'vega-projectile)
