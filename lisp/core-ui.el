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
                    :height 110)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode 1
        column-number-mode 1))

;; https://gist.github.com/huytd/6b785bdaeb595401d69adc7797e5c22c
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#212121" :foreground "#eeffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Iosevka"))))

 ;; font-lock.
 '(font-lock-constant-face      ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face       ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face  ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face        ((t (:foreground "#8EEF00"))))
 '(font-lock-type-face          ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370"))))

 ;; mode-line.
 '(mode-line          ((t (:background "#191919" :box nil))))
 '(mode-line-inactive ((t (:background "#282828" :foreground "#5B6268" :box nil))))

 ;; ivy-mode.
 '(ivy-current-match           ((t (:foreground "#FFFFFF" :background "#007dde"))))
 '(ivy-minibuffer-match-face-2 ((t (:foreground "#6B9FFF"))))
 '(ivy-minibuffer-match-face-3 ((t (:foreground "#FF5370"))))
 '(ivy-minibuffer-match-face-4 ((t (:foreground "#8EEF00"))))
 )

(provide 'core-ui)
