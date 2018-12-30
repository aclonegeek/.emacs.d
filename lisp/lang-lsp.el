;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :defer t
  :commands lsp
  :config
  (require 'lsp-clients)
  (setq lsp-prefer-flymake nil))

(use-package lsp-imenu
  :hook (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends)

  (setq company-lsp-cache-candidates t
        company-lsp-enable-snippet   t))

(provide 'lang-lsp)
