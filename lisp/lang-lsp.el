;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package lsp-imenu
  :hook (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :after lsp
  :bind ([f10] . lsp-ui-sideline-toggle-symbols-info)
  :commands lsp-ui-mode
  :config
  (defvar lsp-ui-flycheck-enable)
  (defvar lsp-ui-flycheck-live-reporting)
  (setq lsp-ui-doc-mode                nil
        lsp-ui-flycheck-live-reporting nil
        lsp-ui-sideline-show-hover     nil))

(use-package company-lsp
  :ensure t
  :after (company lsp)
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)

  (setq company-lsp-cache-candidates t
        company-lsp-enable-snippet   t))

(provide 'lang-lsp)
