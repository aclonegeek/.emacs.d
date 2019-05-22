;; -*- lexical-binding: t; -*-

(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :bind ("C-x 4 b" . ivy-switch-buffer-other-window)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-display-style 'fancy
        ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy))
        ivy-virtual-abbreviate 'full))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf))
  :config
  (setq counsel-find-file-ignore-regexp "^\\.\\|~$\\|^#\\|\\.elc\\|\\.pyc\\|__pycache__"))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'pkg-ivy)
