;; -*- lexical-binding: t; -*-

;; Set default-directory on Windows.
(if (eq system-type 'windows-nt)
    (setq default-directory (expand-file-name (getenv "UserProfile"))))

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
 tab-always-indent 'complete

 auto-composition-mode nil
 mouse-wheel-progressive-speed nil

 ;; Optimizations
 auto-window-vscroll nil
 line-move-visual nil
 inhibit-compacting-font-caches t

 bidi-display-reordering nil
 jit-lock-defer-time 0
 jit-lock-stealth-nice 0.1
 jit-lock-stealth-time 0.2
 jit-lock-stealth-verbose nil

 fast-but-imprecise-scrolling t)

(delete-selection-mode 1)
(electric-pair-mode 1)

;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook  #'my-minibuffer-exit-hook)

(add-hook 'after-save-hook #'garbage-collect)
(add-hook 'focus-out-hook  #'garbage-collect)

(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'core-settings)
