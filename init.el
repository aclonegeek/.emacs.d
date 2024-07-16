;; -*- lexical-binding: t; -*-

(eval-and-compile
  (defconst emacs-packages-dir (concat
                                user-emacs-directory
                                "packages"))
  (defconst emacs-packages-autoloads (concat
                                      user-emacs-directory
                                      "lisp/package-autoloads.el"))
  (dolist (package (directory-files
                    emacs-packages-dir
                    t
                    directory-files-no-dot-files-regexp))
    (add-to-list 'load-path package))
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (load emacs-packages-autoloads t t))

(require 'core-keybinds)
(require 'core-settings)
(require 'core-ui)
(require 'core-util)
(require 'core-eglot)
(require 'core-flymake)
(require 'core-icomplete)
(require 'core-isearch)
(require 'core-org)
(require 'core-project)
(require 'core-xref)

(require 'lang)

(require 'pkg-avy)
(require 'pkg-ace-window)
(require 'pkg-consult)
(require 'pkg-corfu)
(require 'pkg-embark)
(require 'pkg-magit)
(require 'pkg-multiple-cursors)
(require 'pkg-tempel)
(require 'pkg-wgrep)

(setq custom-file "~/.emacs.d/custom.el")
