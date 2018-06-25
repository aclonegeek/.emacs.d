(use-package lsp-mode
  :ensure t
  :defer t)

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :defer t)

(use-package company-lsp
  :ensure t
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends))

(provide 'lang-lsp)
