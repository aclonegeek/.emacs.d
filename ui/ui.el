;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(blink-cursor-mode 0)           ;; Disable blinking
(set-default 'cursor-type 'box) ;; Fat cursor

;; Font
(set-face-attribute 'default nil
		    :family "Noto Sans Mono"
		    :height 105)

;; Highlight current line
(global-hl-line-mode t)

;; Show matching parentheses
(show-paren-mode)

;; Colour text if it passes the max column length
(defvar whitespace-line-column)
(defvar whitespace-style)
(use-package whitespace
  :init
  (setq whitespace-line-column 100)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'prog-mode-hook 'whitespace-mode))

;; Theme
(use-package base16-theme
  :ensure t
  :init (load-theme 'base16-atelier-dune t))

;; Modeline
(use-package modeline :load-path "ui/"
  :config
  (setq line-number-mode 1)
  (setq column-number-mode 1))

(provide 'ui)
