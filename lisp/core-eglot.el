;; -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :bind (:map eglot-mode-map
              ("C-c l a" . eglot-code-actions)
              ("C-c l r" . eglot-rename))
  ;; Flymake reporting will be incorrect/out of date because we set
  ;; flymake-no-changes-timeout to nil and
  ;; flymake-start-on-save-buffer to t. This causes Flymake to ask for
  ;; diagnostics on a save but the server hasn't yet published the
  ;; notification that says there are no diagnostics at all (see
  ;; https://github.com/joaotavora/eglot/issues/1296). To work around
  ;; this, we let Eglot run Flymake when it has diagnostics and
  ;; prevent Flymake from running otherwise.
  :hook (eglot-managed-mode . (lambda ()
                                (setq-local flymake-no-changes-timeout most-positive-fixnum
                                            flymake-start-on-save-buffer nil)))
  :config
  (setq eglot-autoshutdown t
        eglot-report-progress nil
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
