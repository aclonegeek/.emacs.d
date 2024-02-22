;; -*- lexical-binding: t; -*-

(use-package isearch
  :ensure nil
  :config
  (setq isearch-lazy-count   t
        isearch-allow-scroll 'unlimited))

(provide 'core-isearch)
