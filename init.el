;; -*- lexical-binding: t; -*-

;; Speedier Startup
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

(use-package core
  :load-path "~/.emacs.d/core/")
(use-package lang
  :load-path "~/.emacs.d/lang/")
(use-package packages
  :load-path "~/.emacs.d/packages/")

(setq custom-file "~/.emacs.d/custom.el")
