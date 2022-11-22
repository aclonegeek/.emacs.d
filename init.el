;; -*- lexical-binding: t; -*-

(eval-and-compile
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(require 'pkg-straight)

(straight-use-package 'use-package)

;; Core.
(require 'treesit nil 'noerror)
(require 'core-keybinds)
(require 'core-settings)
(require 'core-ui)
(require 'core-util)
(require 'core-eglot)
(require 'core-icomplete)
(require 'core-isearch)

;; Lang.
(require 'lang-c)
(require 'lang-go)
(require 'lang-markdown)
(require 'lang-org)
(require 'lang-python)
(require 'lang-rust)

;; Packages.
(require 'pkg-avy)
(require 'pkg-ace-window)
(require 'pkg-consult)
(require 'pkg-corfu)
(require 'pkg-embark)
(require 'pkg-flymake)
(require 'pkg-magit)
(require 'pkg-multiple-cursors)
(require 'pkg-project)
(require 'pkg-tempel)
(require 'pkg-xref)

(setq custom-file "~/.emacs.d/custom.el")
