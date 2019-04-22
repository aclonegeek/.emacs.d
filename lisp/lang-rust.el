;; -*- lexical-binding: t; -*-

(use-package rustic
  :ensure t
  :commands rustic-mode
  :config
  (setq rustic-format-on-save t))

(use-package flycheck-rust
  :ensure t
  :after (flycheck rustic-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(provide 'lang-rust)
