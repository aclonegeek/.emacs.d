;; -*- lexical-binding: t; -*-

(setq inhibit-startup-screen t
      initial-scratch-message "")

(fset 'yes-or-no-p 'y-or-n-p)

;; Coding systems.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(setq-default
 ring-bell-function 'ignore
 visible-bell nil
 ;; Disable backups and autosaves
 make-backup-files nil
 auto-save-default nil
 ;; 4 spaces instead of tabs
 indent-tabs-mode nil
 tab-width 4
 tab-stop-list (quote (4 8))
 tab-always-indent 'complete)

(provide 'core-settings)
