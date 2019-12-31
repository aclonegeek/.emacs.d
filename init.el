;; -*- lexical-binding: t; -*-

;; Speedier startup.
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist nil
      site-run-file           nil
      gc-cons-percentage      0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist file-name-handler-alist-old
                  gc-cons-threshold       16777216
                  gc-cons-percentage      0.1)))

;; Avoid calling package.el.
(eval-and-compile
  (setq load-prefer-newer t
        package-user-dir "~/.emacs.d/elpa"
        package--init-file-ensured t
        package-enable-at-startup nil)

  (unless (file-directory-p package-user-dir)
    (make-directory package-user-dir t)))

;; Manually set load path.
(eval-and-compile
  (setq load-path (append load-path (directory-files package-user-dir t "^[^.]" t)))
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(eval-when-compile
  (require 'package)

  (unless (assoc-default "melpa" package-archives)
    (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                        (not (gnutls-available-p))))
           (proto (if no-ssl "http" "https")))
      (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)))

  (package-initialize)
  ;; Ensure use-package is installed.
  (unless (package-installed-p 'use-package)
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
