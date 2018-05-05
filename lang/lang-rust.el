;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :ensure t
  :commands rust-mode
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :ensure t
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :ensure t
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (setq racer-cmd "C:/Users/Randy/.cargo/bin/racer")
  (setq racer-rust-src-path "C:/Users/Randy/Programming/Code/rust/src"))

(use-package flycheck-rust
  :ensure t
  :after racer
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'lang-rust)
