;; -*- lexical-binding: t; -*-

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy))
        ivy-virtual-abbreviate 'full))

(use-package counsel
  :ensure t
  :after ivy
  :bind ("M-x" . counsel-M-x))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))

(provide 'vega-ivy)
