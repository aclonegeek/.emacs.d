;; -*- lexical-binding: t; -*-

;; tree-sitter.
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
     (gowork "https://github.com/omertuc/tree-sitter-go-work")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(defun rjt-install-tree-sitter-grammars ()
  "Installs all tree-sitter language grammars defined in
`treesit-language-source-alist'."
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (treesit-install-language-grammar (car grammar))))

;; C.
(setq-default c-basic-offset 4)

;; Markdown.
;; TODO: Use markdown-ts-mode when it gets merged.

;; Python.
(setq-default python-shell-interpreter "python3"
              python-indent-offset 4
              python-indent-guess-indent-offset nil)

(provide 'lang)
