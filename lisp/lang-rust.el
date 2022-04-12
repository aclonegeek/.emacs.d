;; -*- lexical-binding: t; -*-

(use-package rustic
  :commands rustic-mode
  :config
  (setq rustic-format-trigger 'on-save))

(provide 'lang-rust)
