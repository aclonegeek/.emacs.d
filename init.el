;; -*- lexical-binding: t; -*-
;;; Speedier Startup ;;;
;; Garbage collection stuff
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)
(add-hook 'after-init-hook (lambda()
                             (setq gc-cons-threshold 800000
                                   gc-cons-percentage 0.1)))
(add-hook 'focus-out-hook 'garbage-collect)

;; file-name-handler-alist
(defvar temp--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'after-init-hook (lambda()
                             (setq file-name-handler-alist temp--file-name-handler-alist)))

(require 'package)
(setq package-enable-at-startup nil)
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
(load "~/.emacs.d/lang/python/config.el")
(load "~/.emacs.d/lang/latex/config.el")
;;(load "~/.emacs.d/lang/rust/config.el")
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;; TODO(randy): Configure this
(use-package company
  :ensure t
  :init
  (global-company-mode t)
  (setq company-idle-delay nil)
  (setq company-minimum-prefix-length 1))

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
;  (add-hook 'rust-mode-hook 'projectile-mode)
  (add-hook 'python-mode-hook 'projectile-mode))

(use-package flx-ido
  :ensure t
  :init
  (declare-function ido-everywhere "flx-ido" 1)
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(setq custom-file "~/.emacs.d/custom.el")
