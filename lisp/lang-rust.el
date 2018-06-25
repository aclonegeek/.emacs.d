;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :ensure t
  :defer t
  :commands rust-mode
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :ensure t
  :defer t
  :after rust-mode
  :hook (rust-mode . cargo-minor-mode))

;;(use-package racer
;;  :ensure t
;;  :defer t
;;  :after rust-mode
;;  :hook ((rust-mode . racer-mode)
;;         (racer-mode . eldoc-mode))
;;  :config
;;  (setq racer-cmd "C:/Users/Randy/.cargo/bin/racer"
;;        racer-rust-src-path "C:/Users/Randy/Programming/Code/rust/src"))
;;
;;(use-package company-racer
;;  :ensure t
;;  :defer t
;;  :after racer
;;  :config
;;  (add-to-list 'company-backends 'company-racer))

(use-package flycheck-rust
  :ensure t
  :defer t
  :after (flycheck rust-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package lsp-rust
  :ensure t
  :hook (rust-mode . lsp-rust-enable)
  :config
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))

(provide 'lang-rust)
