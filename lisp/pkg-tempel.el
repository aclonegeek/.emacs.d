;; -*- lexical-binding: t; -*-

(use-package tempel
  :bind (("C-<tab>" . tempel-expand))
  :config
  (setq tempel-path (expand-file-name "templates/*.eld" user-emacs-directory)))

(provide 'pkg-tempel)
