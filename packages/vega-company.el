;; -*- lexical-binding: t; -*-

(use-package company
  :ensure t
  :defer 1
  :commands company-mode
  :config
  (setq company-idle-delay nil
        company-minimum-prefix-length 1)
  (global-company-mode 1))

(provide 'vega-company)
