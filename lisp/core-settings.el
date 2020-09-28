;; -*- lexical-binding: t; -*-

;; Set default-directory on Windows.
(if (eq system-type 'windows-nt)
    (setq default-directory (expand-file-name (getenv "UserProfile"))))

(fset #'yes-or-no-p #'y-or-n-p)

;; Coding systems.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(setq-default
 ring-bell-function #'ignore
 visible-bell nil

 ;; Disable backups and lockfiles.
 make-backup-files nil
 create-lockfiles  nil

 ;; 4 spaces instead of tabs.
 indent-tabs-mode nil
 tab-width 4
 tab-stop-list (quote (4 8))
 tab-always-indent 'complete

 auto-composition-mode nil
 mouse-wheel-progressive-speed nil

 ;; Optimizations.
 auto-mode-case-fold nil ;; Don't pass twice over auto-mode-alist.
 auto-window-vscroll nil
 line-move-visual nil
 inhibit-compacting-font-caches t
 bidi-display-reordering 'left-to-right
 bidi-paragraph-direction 'left-to-right
 bidi-inhibit-bpa t
 fast-but-imprecise-scrolling t

 ;; Let Emacs read more from the process.
 read-process-output-max (* 1024 1024)

 ;; Don't render cursors or regions in non-focused windows.
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil)

(setq completion-ignore-case t
      completion-styles '(basic partial-completion flex))

(delete-selection-mode 1)
(electric-pair-mode 1)

;; http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun minibuffer-exit-hook ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold 16777216))))

(add-hook 'minibuffer-setup-hook #'minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook  #'minibuffer-exit-hook)

(add-hook 'after-save-hook #'garbage-collect)
(add-function :after after-focus-change-function #'garbage-collect)

(add-hook 'before-save-hook #'whitespace-cleanup)

(provide 'core-settings)
