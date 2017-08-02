(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))

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

(use-package adsc :load-path "adsc/"
  :bind ("<f5>"     . adsc-todo)
  :bind ("<f6>"     . adsc-python-script)
  :bind ("<f7>"     . adsc-python-module)
  :bind ("<f9>"     . adsc-file-created)
  :bind ("C-<f9>"   . adsc-last-update)
  :bind ("C-S-<f9>" . adsc-update-history))

(use-package keybinds :load-path "cfg/")

(use-package settings :load-path "cfg/")

(use-package util :load-path "cfg/")

(use-package ui :load-path "ui/")

(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :interpreter ("python")
  :init
  (add-hook 'python-mode-hook (lambda ()
                                (flycheck-mode 1)
                                (semantic-mode 1)
                                (setq-default flycheck-checker 'python-pylint
                                              flycheck-checker-error-threshold 400
                                              flycheck-pylintrc "C:/Users/Randy/.pylintrc")))
  (defvar python-check-command "pylint"))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  (autoload 'rust-mode "rust-mode" nil t))

(use-package auto-complete
  :ensure t
  :config (ac-config-default))

(use-package flycheck
  :ensure t
  :bind ("C-\\" . flycheck-list-errors)
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                     python-flake8)))

(use-package pylint
  :ensure t
  :bind ("<f12>" . pylint-insert-ignore-comment))

(declare-function darktooth-modeline-three "darktooth-theme" nil)
(use-package darktooth-theme
  :ensure t
  :init (add-hook 'after-init-hook #'darktooth-modeline-three))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-one t))

(use-package multiple-cursors
  :ensure t
  :bind ("C-?" . mc/edit-lines)
  :bind ("C-," . mc/mark-previous-like-this)
  :bind ("C-." . mc/mark-next-like-this)
  :bind ("C-c C-." . mc/mark-all-like-this)
  :bind ("C-<" . mc/unmark-previous-like-this)
  :bind ("C->" . mc/unmark-next-like-this))

(use-package neotree
  :ensure t
  :bind ("<f8>" . neotree-toggle))

(use-package projectile
  :ensure t
  :config (add-hook 'python-mode-hook 'projectile-mode))

(declare-function ido-everywhere "flx-ido" 1)
(use-package flx-ido
  :ensure t
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
