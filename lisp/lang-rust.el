;; -*- lexical-binding: t; -*-

(use-package rustic
  :commands rustic-mode
  :config
  (require 'lsp-mode)
  (setq rustic-lsp-server     'rust-analyzer
        rustic-format-on-save t))

(use-package flycheck-rust
  :after (flycheck rustic-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(provide 'lang-rust)
