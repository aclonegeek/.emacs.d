;; -*- lexical-binding: t; -*-

(use-package rustic
  :commands rustic-mode
  :config
  (setq rustic-lsp-server     'rust-analyzer
        rustic-format-trigger 'on-save))

(provide 'lang-rust)
