;;(use-package flycheck-rust
;;  :ensure t)

;;(use-package rust-mode
;;  :ensure t
;;  :mode "\\.rs\\'"
;;  :init
;;  (autoload 'rust-mode "rust-mode" nil t)
;;  :config
;;  (setq rust-format-on-save t))

;;(use-package cargo
;;  :ensure t
;;  :config
;;  (add-hook 'rust-mode-hook 'cargo-minor-mode))

;;(use-package racer
;;  :ensure t
;;  :init
;;  (add-hook 'rust-mode-hook #'racer-mode)
;;  (add-hook 'racer-mode-hook #'eldoc-mode)
;;  (add-hook 'racer-mode-hook #'company-mode)
;;  :config
;;  (setq racer-cmd "C:/Users/Randy/.cargo/bin/racer")
;;  (setq racer-rust-src-path "C:/Users/Randy/Programming/Code/rust/src"))
