;; -*- lexical-binding: t; -*-

;; Speedier startup.
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq file-name-handler-alist   nil
      gc-cons-threshold         402653184
      gc-cons-percentage        0.6)

(add-hook 'after-init-hook (lambda ()
                             (setq file-name-handler-alist file-name-handler-alist-old
                                   gc-cons-threshold 800000
                                   gc-cons-percentage 0.1)))
(add-hook 'focus-out-hook 'garbage-collect)

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
  (setq load-path (append load-path (directory-files package-user-dir t "^[^.]" t))))

(eval-when-compile
  (require 'package)

  (unless (assoc-default "melpa" package-archives)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/") t))

  (package-initialize)
  ;; Ensure use-package is installed.
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package core
  :load-path "~/.emacs.d/core/")
(use-package lang
  :load-path "~/.emacs.d/lang/")
(use-package packages
  :load-path "~/.emacs.d/packages/")

(setq custom-file "~/.emacs.d/custom.el")
