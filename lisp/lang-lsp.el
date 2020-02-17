;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((c-mode c++-mode) . (lambda () (lsp-deferred)))
  :config
  (setq lsp-enable-on-type-formatting nil
        lsp-flycheck-live-reporting   nil))

(use-package lsp-imenu
  :hook (lsp-after-open . lsp-enable-imenu))

(use-package lsp-ui
  :ensure t
  :bind (([f8]  . lsp-ui-sideline-toggle-symbols-info)
         ([f9]  . lsp-ui-doc-show)
         ([f10] . lsp-ui-doc-hide))
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable          nil
        lsp-ui-sideline-show-hover nil))

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (setq company-lsp-cache-candidates t
        company-lsp-enable-snippet   t))

(provide 'lang-lsp)
