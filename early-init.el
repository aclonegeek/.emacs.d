;; -*- lexical-binding: t; -*-

(setq
 ;; Disable autosaves.
 auto-save-default nil
 ;; Defer GC.
 gc-cons-threshold  most-positive-fixnum
 gc-cons-percentage 0.6
 ;; Don't resize the Emacs frame when GUI elements (e.g. bars, font) change.
 frame-inhibit-implied-resize t)

;; Package.
(setq-default package-user-dir "~/.emacs.d/elpa"
              ;; TODO: Figure out how to uncomment below without package shenanigans on startup.
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
