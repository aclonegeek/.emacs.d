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
  (add-to-list 'eglot-stay-out-of 'imenu)
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode) . ("clangd"
                                            "--pch-storage=memory"
                                            "--completion-style=detailed"
                                            "--header-insertion=never"
                                            ))))

(provide 'core-eglot)
