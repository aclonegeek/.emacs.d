;; -*- lexical-binding: t; -*-

(defvar file-name-handler-alist-old file-name-handler-alist)
(setq
 ;; Use straight instead.
 package-enable-at-startup nil
 site-run-file           nil
 file-name-handler-alist nil
 ;; Disable autosaves.
 auto-save-default nil
 ;; Defer GC.
 gc-cons-threshold  most-positive-fixnum
 gc-cons-percentage 0.6
 ;; Don't resize the Emacs frame when GUI elements (e.g. bars, font) change.
 frame-inhibit-implied-resize t
 ;; Don't use outdated bytecode.
 load-prefer-newer t
 ;; Barebones startup.
 initial-major-mode 'fundamental-mode
 inhibit-startup-screen t
 inhibit-startup-message t
 inhibit-default-init t
 initial-scratch-message nil)
(fset #'display-startup-echo-area-message #'ignore)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist file-name-handler-alist-old
                  gc-cons-threshold       16777216
                  gc-cons-percentage      0.1)))

;; Disable GUI elements.
(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq menu-bar-mode   nil
      scroll-bar-mode nil
      tool-bar-mode   nil)

;; Ignore X resources.
(advice-add #'x-apply-session-resources :override #'ignore)

(set-language-environment "UTF-8")
(setq default-input-method nil) ;; Set by set-language-environment.

(setq native-comp-jit-compilation nil)
