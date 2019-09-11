;; -*- lexical-binding: t; -*-

;; Disable GUI elements
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)

(blink-cursor-mode 0)            ;; Disable blinking
(set-default 'cursor-type 'box)  ;; Fat cursor
(global-hl-line-mode t)          ;; Highlight current line

(defvar show-paren-delay)
(defvar show-paren-when-point-in-periphery)
(setq show-paren-delay 0
      show-paren-when-point-in-periphery t)
(show-paren-mode)

(setq-default
 mode-line-default-help-echo nil) ;; Disable mode-line hover tips

;; Font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 110)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-molokai t))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode   1
        column-number-mode 1))

(provide 'core-ui)
