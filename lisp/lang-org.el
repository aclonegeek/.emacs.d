;; -*- lexical-binding: t; -*-

(use-package org
  :defer t
  :hook (org-mode . (lambda () (require 'ox-md nil t)))
  :config
  (unbind-key "C-k" org-mode-map)
  (unbind-key "C-x n e" org-mode-map)
  ;; Wrap lines in org-mode
  (setq org-startup-truncated nil)
  ;; Insert a page break after the TOC.
  (setq org-latex-toc-command "\\tableofcontents \\clearpage"))

(provide 'lang-org)
