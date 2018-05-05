;; -*- lexical-binding: t; -*-

(use-package company
  :ensure t
  :commands company-mode
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode 1))

(provide 'vega-company)
