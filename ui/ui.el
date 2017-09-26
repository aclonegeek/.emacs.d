(add-to-list 'custom-theme-load-path "~/.emacs.d/ui/themes")

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; Disable blinking cursor
(blink-cursor-mode 0)

;; Font
(set-face-attribute 'default nil
		    :family "Droid Sans Mono"
		    :height 95)

;; Highlight current line
(global-hl-line-mode t)

;; Colour text if it passes the max column length
(defvar whitespace-line-column)
(defvar whitespace-style)
(use-package whitespace
  :init
  (setq whitespace-line-column 100)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'prog-mode-hook 'whitespace-mode))

;; Show matching parentheses
(show-paren-mode)

;; MODE-LINE
(line-number-mode 1)

(provide 'ui)
