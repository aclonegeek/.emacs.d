;; -*- lexical-binding: t; -*-

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
