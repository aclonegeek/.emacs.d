;; -*- lexical-binding: t; -*-

(use-package isearch
  :straight nil
  :config
  (setq isearch-lazy-count   t
        isearch-allow-scroll 'unlimited))

(provide 'pkg-isearch)
