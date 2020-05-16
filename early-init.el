;; -*- lexical-binding: t; -*-

(eval-and-compile
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(defvar file-name-handler-alist-old file-name-handler-alist)
(setq
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

;; Package.
(setq-default ;; TODO: Figure out how to uncomment below without package shenanigans on startup.
              ;; package-enable-at-startup nil
              package-archives
              (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                                  (not (gnutls-available-p))))
                     (proto (if no-ssl "http" "https")))
                `(("gnu"   . ,(concat proto "://elpa.gnu.org/packages/"))
                  ("melpa" . ,(concat proto "://melpa.org/packages/"))))
              package-quickstart t)

;; Disable GUI elements.
(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Ignore X resources.
(advice-add #'x-apply-session-resources :override #'ignore)
