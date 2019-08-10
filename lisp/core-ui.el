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
  (load-theme 'doom-one t))

;; https://gist.github.com/huytd/6b785bdaeb595401d69adc7797e5c22c
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#212121" :foreground "#eeffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "nil"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370"))))
 '(mode-line ((t (:background "#191919" :box nil))))
 '(mode-line-inactive ((t (:background "#282828" :foreground "#5B6268" :box nil)))))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode 1
        column-number-mode 1))

(provide 'core-ui)
