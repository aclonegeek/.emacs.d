;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . TeX-latex-mode))

(use-package company-auctex
  :ensure t
  :after (company tex)
  :defer t
  :config
  (company-auctex-init))

(use-package company-math
  :ensure t
  :defer t
  :config
  (add-to-list 'company-backends 'company-math-symbols-latex))

(provide 'lang-latex)
