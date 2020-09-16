;; -*- lexical-binding: t; -*-

(tooltip-mode -1)

(blink-cursor-mode 0)            ;; Disable blinking.
(set-default 'cursor-type 'box)  ;; Fat cursor.
(global-hl-line-mode t)          ;; Highlight current line.

(defvar show-paren-delay)
(defvar show-paren-when-point-in-periphery)
(setq show-paren-delay 0
      show-paren-when-point-in-periphery t)
(show-paren-mode)

(setq-default mode-line-default-help-echo nil) ;; Disable mode-line hover tips.

;; Font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 110)

;; Theme
(use-package vscode-dark-plus-theme
  :ensure t
  :hook (after-init . (lambda () (load-theme 'vscode-dark-plus t))))

;; Modeline
(use-package core-modeline
  :config
  (setq line-number-mode   1
        column-number-mode 1))

(provide 'core-ui)
