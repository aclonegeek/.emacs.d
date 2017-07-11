;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

(load-theme 'darktooth t)
(darktooth-modeline-three)

;; Highlight current line
(global-hl-line-mode t)

;; MODE-LINE
(line-number-mode 1)

(provide 'ui)
