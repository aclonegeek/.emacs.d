;; -*- lexical-binding: t; -*-

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(blink-cursor-mode 0)            ;; Disable blinking
(set-default 'cursor-type 'box)  ;; Fat cursor
(global-hl-line-mode t)          ;; Highlight current line
(show-paren-mode)                ;; Show matching parentheses

(setq-default
 ;; Performance optimizations
 bidi-display-reordering nil
 jit-lock-defer-time nil
 jit-lock-stealth-nice 0.1
 jit-lock-stealth-time 0.2
 jit-lock-stealth-verbose nil
 mode-line-default-help-echo nil) ;; Disable mode-line hover tips

;; Font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 120)

;; Theme
(use-package challenger-deep-theme
  :ensure t
  :config (load-theme 'challenger-deep t))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode 1
        column-number-mode 1))

(provide 'core-ui)
