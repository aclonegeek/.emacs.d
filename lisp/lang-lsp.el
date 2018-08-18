;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :defer t)

(use-package lsp-imenu
  :after lsp-mode
  :hook (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends))

(provide 'lang-lsp)
