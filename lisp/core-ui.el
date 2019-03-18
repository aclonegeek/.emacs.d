;; -*- lexical-binding: t; -*-

;; Disable GUI elements
(menu-bar-mode   -1)
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)

(blink-cursor-mode 0)            ;; Disable blinking
(set-default 'cursor-type 'box)  ;; Fat cursor
(global-hl-line-mode t)          ;; Highlight current line
(show-paren-mode)                ;; Show matching parentheses

(setq-default
 mode-line-default-help-echo nil) ;; Disable mode-line hover tips

;; Font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 110)

;; Theme
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-atelier-dune t)
  (set-face-attribute 'mode-line           nil :background "#2D2B28")
  (set-face-attribute 'region              nil :background "#3F3E36")
  (set-face-attribute 'secondary-selection nil :background "#3F3E36")
  (eval-after-load 'company
    '(progn
       (set-face-attribute 'company-tooltip-selection nil :background "#292824"))))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode 1
        column-number-mode 1))

(provide 'core-ui)
