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
  :bind ("<f5>" . adsc-todo)
  :bind ("<f6>" . adsc-python-script)
  :bind ("<f7>" . adsc-python-module)
  :bind ("<f9>" . adsc-file-created)
  :bind ("C-<f9>" . adsc-last-update)
  :bind ("C-S-<f9>" . adsc-update-history))

(use-package keybinds :load-path "cfg/")

(use-package ui :load-path "ui/")

(use-package python :load-path "lang/python/")

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
  :init (darktooth-modeline-three))

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
  :init (add-hook 'python-mode-hook 'projectile-mode))

(use-package flx-ido)

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(defun iwb ()
  "Indent whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; Tab auto-indent
(setq tab-always-indent 'complete)

;; Revert buffer
(defun revert-buffer-no-comfirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

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

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;; flx-ido
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(defun find-other-file-other-window ()
  "Find the corresponding file in another window."
  (interactive)
  (if (not (one-window-p))
      (delete-other-windows))
  (split-window-right)
  (other-window 1)
  (ff-find-other-file))

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
