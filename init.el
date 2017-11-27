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

;; My packages
(use-package keybinds :load-path "cfg/")
(use-package settings :load-path "cfg/")
(use-package util :load-path "cfg/")
(use-package ui :load-path "ui/")

;; MELPA packages
(defvar flycheck-checker)
(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :interpreter ("python")
  :init
  (add-hook 'python-mode-hook (lambda ()
                                (flycheck-mode 1)
                                (semantic-mode 1)
                                (setq flycheck-checker 'python-pylint)
  (defvar python-check-command "pylint"))))

(use-package flycheck-rust
  :ensure t)

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  (autoload 'rust-mode "rust-mode" nil t)
  :config
  (setq rust-format-on-save t))

(use-package auto-complete
  :ensure t
  :config (ac-config-default))

(use-package flycheck
  :ensure t
  :bind ("C-\\" . flycheck-list-errors)
  :bind ("C-x n e" . flycheck-next-error)
  :bind ("C-x p e" . flycheck-previous-error)
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (setq-default flycheck-checker-error-threshold 400
                flycheck-pylintrc "C:/Users/Randy/.pylintrc"
                flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                             python-flake8)))

(use-package pylint
  :ensure t
  :bind ("<f12>" . pylint-insert-ignore-comment))

(use-package molokai-theme
  :ensure t
  :init (load-theme 'molokai t))

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
