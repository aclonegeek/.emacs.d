;; -*- lexical-binding: t; -*-

(use-package wgrep
  :bind (("C-x C-q" . wgrep-change-to-wgrep-mode)
         ("C-c C-c" . wgrep-finish-edit))
  :config
  (setq wgrep-auto-save-buffer t))

(provide 'pkg-wgrep)
