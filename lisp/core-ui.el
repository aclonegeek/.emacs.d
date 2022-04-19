;; -*- lexical-binding: t; -*-

(tooltip-mode -1)

(blink-cursor-mode 0)            ;; Disable blinking.
(set-default 'cursor-type 'box)  ;; Fat cursor.

(defvar bookmark-set-fringe-mark)
(setq bookmark-set-fringe-mark nil)

(setq show-paren-delay 0
      show-paren-when-point-in-periphery t
      show-paren-context-when-offscreen 'overlay)
(show-paren-mode)

(global-hl-line-mode)

(setq-default mode-line-default-help-echo nil) ;; Disable mode-line hover tips.

;; Font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 110)

;; Theme
(require 'colourful-darkness-theme)
(add-hook 'after-init-hook (lambda () (load-theme 'colourful-darkness t)))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode   1
        column-number-mode 1))

(provide 'core-ui)
