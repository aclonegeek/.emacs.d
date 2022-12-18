;; -*- lexical-binding: t; -*-

(eval-and-compile
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(require 'pkg-straight)

;; Core.
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

;; Lang.
(require 'lang)

;; Packages.
(require 'pkg-avy)
(require 'pkg-ace-window)
(require 'pkg-consult)
(require 'pkg-corfu)
(require 'pkg-embark)
(require 'pkg-magit)
(require 'pkg-multiple-cursors)
(require 'pkg-tempel)

(setq custom-file "~/.emacs.d/custom.el")
