;; -*- lexical-binding: t; -*-

(use-package org
  :defer t
  :config
  (unbind-key "C-k" org-mode-map)
  (unbind-key "C-x n e" org-mode-map)
  ;; Wrap lines in org-mode
  (setq org-startup-truncated nil))

(use-package org-preview-html
  :ensure t
  :defer t
  :bind ("C-c o p" . org-preview-html-mode))

(provide 'lang-org)
