;; -*- lexical-binding: t; -*-

(setenv "LSP_USE_PLISTS" "true")

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (((c-mode c++-mode go-mode) . lsp-deferred))
  :defines lsp-completion-provider
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-enable-folding                   nil
        lsp-enable-links                     nil
        lsp-enable-snippet                   nil
        ;; We set company-backends ourself.
        lsp-completion-provider              :none
        lsp-enable-on-type-formatting        nil
        lsp-signature-auto-activate          t
        lsp-signature-doc-lines              3
        lsp-enable-semantic-highlighting     t
        lsp-headerline-breadcrumb-enable     nil
        lsp-modeline-code-actions-enable     nil
        lsp-modeline-diagnostics-enable      nil
        lsp-modeline-workspace-status-enable nil))

(use-package lsp-ui
  :ensure t
  :bind (([f8]  . lsp-ui-sideline-toggle-symbols-info)
         ([f9]  . lsp-ui-doc-show)
         ([f10] . lsp-ui-doc-hide))
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable          nil
        lsp-ui-sideline-show-hover nil))

(provide 'lang-lsp)
