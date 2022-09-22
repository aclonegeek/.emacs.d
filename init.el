;; -*- lexical-binding: t; -*-

(eval-and-compile
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(require 'pkg-straight)

(straight-use-package 'use-package)

;; Core.
(require 'treesit)
(require 'core-keybinds)
(require 'core-settings)
(require 'core-ui)
(require 'core-util)
(require 'core-icomplete)
(require 'core-isearch)

;; Lang.
(require 'lang-lsp)
(require 'lang-bash)
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
(require 'pkg-xref)
(require 'pkg-yasnippet)

(setq custom-file "~/.emacs.d/custom.el")
