;; -*- lexical-binding: t; -*-

;; C.
(setq-default c-basic-offset 4)
;; TODO(rtaylor): Format buffer on save.

;; Go.
;; TODO(rtaylor): Format buffer on save.

;; Markdown.
(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config (setq markdown-command "multimarkdown"))

;; Python.
(setq-default python-shell-interpreter "python3"
              python-indent-offset 4
              python-indent-guess-indent-offset nil)

;; Rust.
;; TODO(rtaylor): Format buffer on save.

(provide 'lang)
