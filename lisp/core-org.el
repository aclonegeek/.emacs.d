;; -*- lexical-binding: t; -*-

(use-package org
  :commands org-mode
  :hook (org-mode . (lambda () (require 'ox-md nil t)))
  :bind (:map org-mode-map
              ("C-," . nil)
              ("C-x n e" . nil))
  :init (setq org-modules nil)
  :config
  ;; Wrap lines in org-mode
  (setq org-startup-truncated nil
        org-startup-folded    t))

(provide 'core-org)
