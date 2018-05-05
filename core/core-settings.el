;; -*- lexical-binding: t; -*-

(setq inhibit-startup-screen t)
(fset 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8)

;; Disable backups and autosaves
(setq-default make-backup-files nil
              auto-save-default nil)

;; 4 spaces instead of tabs
(setq-default indent-tabs-mode nil
              tab-width 4
              tab-stop-list (quote (4 8))
              tab-always-indent 'complete)

(provide 'core-settings)
