;; -*- lexical-binding: t; -*-

(use-package go-mode
  :defer t
  :config
  (add-hook 'before-save-hook #'gofmt-before-save))

(provide 'lang-go)
