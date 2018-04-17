;; -*- lexical-binding: t; -*-

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 0))))

(provide 'config)
