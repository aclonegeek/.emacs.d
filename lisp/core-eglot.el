;; -*- lexical-binding: t; -*-

(use-package eglot
  :straight nil
  :bind (:map eglot-mode-map
              ("C-c l a" . eglot-code-actions)
              ("C-c l r" . eglot-rename))
  :hook (((c-ts-mode
           c++-ts-mode
           go-ts-mode
           rust-ts-mode) . eglot-ensure))
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
               '((c-ts-mode c++-ts-mode) . ("clangd"
                                            "--pch-storage=memory"
                                            "--completion-style=detailed"
                                            "--header-insertion=never"
                                            ))))

(provide 'core-eglot)
