;; -*- lexical-binding: t; -*-

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(blink-cursor-mode 0)            ;; Disable blinking
(set-default 'cursor-type 'box)  ;; Fat cursor
(global-hl-line-mode t)          ;; Highlight current line
(show-paren-mode)                ;; Show matching parentheses

;; Font
(set-face-attribute 'default nil
                    :family "Noto Mono"
                    :height 110)

(use-package whitespace
  :ensure t
  :hook ((prog-mode . whitespace-mode)
         (text-mode . whitespace-mode))
  :config
  (setq-default whitespace-line-column 100
                ;; Colour text if it passes the max column length.
                whitespace-style '(face lines-tail)))

;; Theme
(use-package base16-theme
  :ensure t
  :init (load-theme 'base16-atelier-dune t))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode 1
        column-number-mode 1))

(provide 'core-ui)
