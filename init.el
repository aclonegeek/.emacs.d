(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))

(fset 'yes-or-no-p 'y-or-n-p)

(prefer-coding-system 'utf-8)

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

(setq use-package-always-ensure t)

(use-package adsc :load-path "adsc/"
  :bind ("<f5>"     . adsc-todo)
  :bind ("<f6>"     . adsc-python-script)
  :bind ("<f7>"     . adsc-python-module)
  :bind ("<f9>"     . adsc-file-created)
  :bind ("C-<f9>"   . adsc-last-update)
  :bind ("C-S-<f9>" . adsc-update-history))

(use-package keybinds :load-path "cfg/")

(use-package util :load-path "cfg/")

(use-package ui :load-path "ui/")

(use-package python-mode
  :mode "\\.py\\'"
  :interpreter ("python")
  :init
  (add-hook 'python-mode-hook (lambda ()
                                (flycheck-mode 1)
                                (semantic-mode 1)
                                (setq flycheck-checker 'python-pylint
                                      flycheck-checker-error-threshold 400
                                      flycheck-pylintrc "C:/Users/Randy/.pylintrc")))
  :config
  (setq-default flycheck-disabled-checkers '(python-flake8
					     emacs-lisp-checkdoc))
  (defvar python-check-command "pylint"))

(use-package auto-complete
  :config (ac-config-default))

(use-package flycheck
  :bind ("C-\\" . flycheck-list-errors)
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc
				     python-flake8)))

(use-package pylint
  :bind ("<f12>" . pylint-insert-ignore-comment))

(use-package darktooth-theme
  :init
  (add-hook 'after-init-hook #'darktooth-modeline-three)
  :config
  (load-theme 'darktooth t))

(use-package multiple-cursors
  :bind ("C-?" . mc/edit-lines)
  :bind ("C-," . mc/mark-previous-like-this)
  :bind ("C-." . mc/mark-next-like-this)
  :bind ("C-c C-." . mc/mark-all-like-this)
  :bind ("C-<" . mc/unmark-previous-like-this)
  :bind ("C->" . mc/unmark-next-like-this))

(use-package neotree
  :bind ("<f8>" . neotree-toggle))

(use-package projectile
  :config (add-hook 'python-mode-hook 'projectile-mode))

(use-package flx-ido
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; Tab auto-indent
(setq tab-always-indent 'complete)

;; Disable backup files
(setq make-backup-files nil)

;; 4 spaces instead of tabs
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
