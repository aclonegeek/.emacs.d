;; -*- lexical-binding: t; -*-

(use-package tree-sitter
  :ensure t
  :hook (prog-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t)

(provide 'pkg-tree-sitter)
