(setq inhibit-startup-screen t)

(fset 'yes-or-no-p 'y-or-n-p)

(prefer-coding-system 'utf-8)

;; Tab auto-indent
(setq tab-always-indent 'complete)

;; Disable backup files
(setq make-backup-files nil)

;; 4 spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list (number-sequence 4 200 4))

(provide 'settings)
