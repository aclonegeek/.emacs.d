;; -*- lexical-binding: t; -*-

(use-package company
  :ensure t
  :commands company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 10
        company-show-numbers t))

(provide 'vega-company)
