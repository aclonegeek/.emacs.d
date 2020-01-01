;; -*- lexical-binding: t; -*-

;; Speedier startup.
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil
      site-run-file           nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist file-name-handler-alist-old
                  gc-cons-threshold       16777216
                  gc-cons-percentage      0.1)))

;; We don't want to use old .elc files.
(setq load-prefer-newer t)

(eval-and-compile
 (add-to-list 'load-path "~/.emacs.d/lisp"))

(eval-when-compile
  ;; Ensure use-package is installed.
  (unless (locate-library "use-package")
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

;; Core.
(require 'core-keybinds)
(require 'core-settings)
(require 'core-ui)
(require 'core-util)

;; Lang.
(require 'lang-lsp)
(require 'lang-c)
(require 'lang-java)
(require 'lang-markdown)
(require 'lang-org)
(require 'lang-python)
(require 'lang-rust)

;; Packages.
(require 'pkg-avy)
(require 'pkg-ace-window)
(require 'pkg-company)
(require 'pkg-deadgrep)
(require 'pkg-flx)
(require 'pkg-flycheck)
(require 'pkg-flyspell)
(require 'pkg-ivy)
(require 'pkg-magit)
(require 'pkg-multiple-cursors)
(require 'pkg-projectile)
(require 'pkg-yasnippet)

;; OS.
(if (eq system-type 'gnu/linux)
  (require 'os-linux))

(setq custom-file "~/.emacs.d/custom.el")
