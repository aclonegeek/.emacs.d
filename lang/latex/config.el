; auctex
(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . TeX-latex-mode))

(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))

(provide 'config)
