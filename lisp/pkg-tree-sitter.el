;; -*- lexical-binding: t; -*-

(use-package tree-sitter
  :ensure t
  :hook ((c-mode . tree-sitter-hl-mode)
         (c++-mode . tree-sitter-hl-mode)
         (go-mode . tree-sitter-hl-mode)
         (js-mode . tree-sitter-hl-mode)
         (json-mode . tree-sitter-hl-mode)
         (python-mode . tree-sitter-hl-mode)
         (rust-mode . tree-sitter-hl-mode)
         (sh-mode . tree-sitter-hl-mode)))

(use-package tree-sitter-langs
  :ensure t
  :defer t)

(provide 'pkg-tree-sitter)
