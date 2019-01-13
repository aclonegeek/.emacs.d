;; -*- lexical-binding: t; -*-

(use-package rustic
  :ensure t
  :commands rustic-mode
  :mode "\\.rs\\'"
  :config
  (setq rustic-format-on-save t))

(use-package flycheck-rust
  :ensure t
  :after (flycheck rustic-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package lsp-rust
  :ensure t
  :hook (rustic-mode . lsp-rust-enable)
  :config
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))

(provide 'lang-rust)
