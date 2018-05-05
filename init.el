;; -*- lexical-binding: t; -*-

;;; Speedier Startup ;;;
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq package-enable-at-startup nil
      file-name-handler-alist   nil
      gc-cons-threshold         402653184
      gc-cons-percentage        0.6)

(add-hook 'after-init-hook (lambda ()
                             (setq file-name-handler-alist file-name-handler-alist-old
                                   gc-cons-threshold 800000
                                   gc-cons-percentage 0.1)))
(add-hook 'focus-out-hook 'garbage-collect)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups/"))
      auto-save-file-name-transforms `(("." "~/.emacs.d/backups/" t))
      make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-old-versions 6
      kept-new-versions 9
      auto-save-default t
      auto-save-timeout 30
      auto-save-interval 500)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package
(eval-when-compile
  (require 'use-package))

(load "~/.emacs.d/cfg/keybinds.el")
(load "~/.emacs.d/cfg/settings.el")
(load "~/.emacs.d/cfg/util.el")
(load "~/.emacs.d/ui/ui.el")
;; Load lang configs
(load "~/.emacs.d/lang/org/config.el")
(load "~/.emacs.d/lang/python/config.el")
(load "~/.emacs.d/lang/latex/config.el")
(load "~/.emacs.d/lang/rust/config.el")
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package company
  :ensure t
  :commands company-mode
  :config
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1)
  (global-company-mode 1))

(use-package flycheck
  :ensure t
  :bind ("C-\\"    . flycheck-list-errors)
  :bind ("C-x n e" . flycheck-next-error)
  :bind ("C-x p e" . flycheck-previous-error)
  :commands flycheck-mode
  :init
  (setq-default flycheck-checker-error-threshold 400
                ;; TODO(randy): Make this cross-platform.
                flycheck-pylintrc "C:/Users/Randy/.pylintrc"
                flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config (global-flycheck-mode))

(use-package multiple-cursors
  :ensure t
  :bind ("C-?"      . mc/edit-lines)
  :bind ("C-,"      . mc/mark-previous-like-this)
  :bind ("C-."      . mc/mark-next-like-this)
  :bind ("C-c C-."  . mc/mark-all-like-this)
  :bind ("C-<"      . mc/unmark-previous-like-this)
  :bind ("C->"      . mc/unmark-next-like-this))

(use-package projectile
  :ensure t
  :config
  (add-hook 'rust-mode-hook 'projectile-mode)
  (add-hook 'python-mode-hook 'projectile-mode))

(use-package flx
  :ensure t
  :defer t)

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

(use-package counsel-projectile
  :ensure t
  :after counsel
  :config
  (counsel-projectile-mode))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))

(setq custom-file "~/.emacs.d/custom.el")
