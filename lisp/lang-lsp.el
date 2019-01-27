;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (require 'lsp-clients)
  (setq lsp-prefer-flymake nil))

(use-package lsp-imenu
  :hook (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :bind ([f10] . lsp-ui-sideline-toggle-symbols-info)
  :hook (lsp . lsp-ui-mode)
  :config
  (defvar lsp-ui-flycheck-live-reporting)
  (setq lsp-ui-flycheck-live-reporting nil
        lsp-ui-sideline-show-hover     nil))

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends)

  (setq company-lsp-cache-candidates t
        company-lsp-enable-snippet   t))

(provide 'lang-lsp)
