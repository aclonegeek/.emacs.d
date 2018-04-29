;; -*- lexical-binding: t; -*-

;;(use-package org-bullets
;;  :ensure t
;;  :config
;;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 0))))

;; Wrap lines in org-mode
(setq org-startup-truncated nil)

(use-package org-preview-html
  :ensure t
  :bind ("C-c o p" . org-preview-html-mode))

(provide 'config)
