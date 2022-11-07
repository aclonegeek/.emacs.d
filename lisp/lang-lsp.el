;; -*- lexical-binding: t; -*-

(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c l a" . eglot-code-actions)
              ("C-c l r" . eglot-rename))
  :hook (((c-mode c++-mode go-mode rust-mode) . eglot-ensure))
  :config
  (setq eglot-events-buffer-size 0)
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              ;; Show flymake diagnostics first.
              (setq eldoc-documentation-functions
                    (cons #'flymake-eldoc-function
                          (remove #'flymake-eldoc-function eldoc-documentation-functions)))
              ;; Show all eldoc feedback.
              (setq eldoc-documentation-strategy #'eldoc-documentation-compose)))
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd"
                                      "--pch-storage=memory"
                                      "--completion-style=detailed"
                                      "--header-insertion=never"
                                      ))))

(provide 'lang-lsp)
