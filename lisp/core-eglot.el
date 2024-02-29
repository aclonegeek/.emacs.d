;; -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :bind (:map eglot-mode-map
              ("C-c l a" . eglot-code-actions)
              ("C-c l r" . eglot-rename))
  :config
  (setq eglot-autoshutdown t
        eglot-sync-connect 0
        eglot-ignored-server-capabilities '(:documentFormattingProvider
                                            :documentOnTypeFormattingProvider))
  (plist-put eglot-events-buffer-config :size 0)
  (add-to-list 'eglot-stay-out-of 'imenu)
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode) . ("clangd"
                                            "--pch-storage=memory"
                                            "--completion-style=detailed"
                                            "--header-insertion=never"
                                            ))))

(provide 'core-eglot)
