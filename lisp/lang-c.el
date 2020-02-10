;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package cmake-mode
  :defer t)

(use-package clang-format+
  :hook ((c-mode c++-mode) . clang-format+-mode))

(provide 'lang-c)
