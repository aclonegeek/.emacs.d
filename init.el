(run-with-idle-timer
5 nil
(lambda ()
   (setq gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))
 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; use-package
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package auto-complete)
(use-package gruvbox-theme)
(use-package multiple-cursors)
(use-package neotree)
(use-package nlinum)
(use-package all-the-icons)
(use-package projectile)
(use-package flx-ido)
(use-package rainbow-delimiters)

;; ADSC
(add-to-list 'load-path "~/.emacs.d/adsc")
(require 'adsc)

;; Load config
(defvar cfg-dir
  (expand-file-name "cfg" user-emacs-directory))
(add-to-list 'load-path cfg-dir)
(require 'keybinds)

(defun python-fn-docstring ()
  "Automatically insert a function docstring."
  (interactive)
  (insert "    \"\"\"Summary goes here.\n\n")
  (insert "    :Parameters:\n")
  (insert "      - `parameter`: type. what.\n\n")
  (insert "    :return: type. what.\n")
  (insert "    :raises something.Error: what/why\n\n")
  (insert "    \"\"\""))
 
;; Autocomplete
;; (require 'auto-complete)
(ac-config-default)

;; THEME
(load-theme 'gruvbox t)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(python-flake8))
(add-hook 'python-mode-hook (lambda ()
                               (flycheck-mode 1)
                               (semantic-mode 1)
                               (setq flycheck-checker 'python-pylint
                                     flycheck-checker-error-threshold 400
                                     flycheck-pylintrc "C:/Users/rtaylor/.pylintrc")))
;; (setq python-check-command "pylint")

(defun duplicate-line ()
  "Copy the current line and paste it on to a new line."
  (interactive)
  (kill-whole-line)
  (yank)
  (yank)
  (forward-line -1))
 
(defun select-word ()
  "Select the current word."
  (interactive)
  (backward-word)
  (set-mark (point))
  (forward-word))
 
;; NLINUM
(add-hook 'prog-mode-hook 'nlinum-mode)
 
;; PROJECTILE
(projectile-global-mode)

;; flx-ido
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
 
;; MODE-LINE
(line-number-mode -1)
(defvar +modeline-height 29)
(defvar +modeline-bar-width 3)

;; Disable GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

(defun find-other-file-other-window ()
  "Find the corresponding file in another window."
  (interactive)
  (if (not (one-window-p))
      (delete-other-windows))
  (split-window-right)
  (other-window 1)
  (ff-find-other-file))

;; Enable rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Disable backup files
(setq make-backup-files nil)

;; 4 spaces instead of tabs
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(defun reload-config()
  "Reload emacs config."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun edit-config()
  "Edit emacs config."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)