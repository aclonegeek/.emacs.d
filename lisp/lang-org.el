;; -*- lexical-binding: t; -*-

(use-package org
  :commands org-mode
  :hook (org-mode . (lambda () (require 'ox-md nil t)))
  :config
  (unbind-key "C-k" org-mode-map)
  (unbind-key "C-x n e" org-mode-map)
  ;; Wrap lines in org-mode
  (setq org-startup-truncated nil))

(provide 'lang-org)
