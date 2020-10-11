;; -*- lexical-binding: t; -*-

(use-package company
  :ensure t
  :commands company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-backends '((company-capf company-yasnippet) company-cmake company-files)
        company-idle-delay 0.0
        company-minimum-prefix-length 1
        company-tooltip-limit 10
        company-show-numbers 'left))

(provide 'pkg-company)
