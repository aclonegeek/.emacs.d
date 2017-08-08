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

;; Show matching parentheses
(show-paren-mode)

;; MODE-LINE
(line-number-mode 1)

(provide 'ui)
