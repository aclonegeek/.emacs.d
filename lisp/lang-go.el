;; -*- lexical-binding: t; -*-

(use-package go-mode
  :defer t)

(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'lang-go)
