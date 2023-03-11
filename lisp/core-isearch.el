;; -*- lexical-binding: t; -*-

(use-package isearch
  :elpaca nil
  :config
  (setq isearch-lazy-count   t
        isearch-allow-scroll 'unlimited))

(provide 'core-isearch)
