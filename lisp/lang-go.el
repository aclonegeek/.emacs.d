;; -*- lexical-binding: t; -*-

(use-package go-mode
  :hook (before-save . gofmt-before-save))

(provide 'lang-go)
