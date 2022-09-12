;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :defer t)
  :bind ("C-c c" . rust-run-clippy)
  :config
  (setq rust-format-on-save t))

(provide 'lang-rust)
