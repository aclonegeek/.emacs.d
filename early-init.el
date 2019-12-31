;; -*- lexical-binding: t; -*-

(setq
 ;; Disable autosaves.
 auto-save-default nil
 ;; Defer GC.
 gc-cons-threshold most-positive-fixnum
 ;; Don't resize the Emacs frame when GUI elements (e.g. bars, font) change.
 frame-inhibit-implied-resize t)

;; Disable GUI elements.
(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Ignore X resources.
(advice-add #'x-apply-session-resources :override #'ignore)
