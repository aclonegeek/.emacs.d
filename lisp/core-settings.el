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
 ;; Split windows vertically by default.
 ;; split-width-threshold 0
 ;; split-height-threshold nil
 )

(electric-pair-mode 1)

;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(provide 'core-settings)
