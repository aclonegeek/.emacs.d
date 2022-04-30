;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package cmake-mode
  :defer t)

;; To disable clang-format+ with .dir-locals.el:
;; ((nil . ((eval . (clang-format+-mode 0)))))
(use-package clang-format+
  :hook ((c-mode c++-mode) . clang-format+-mode))

(provide 'lang-c)
