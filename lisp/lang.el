;; -*- lexical-binding: t; -*-

(defun rjt-format-buffer (command)
  "Format the buffer with COMMAND."
  (let ((point (point)))
    (shell-command-on-region
     (point-min)
     (point-max)
     command
     (current-buffer)
     t
     "*Format Buffer Errors"
     t)
    (goto-char point)))

(defun rjt-format-c/c++-buffer ()
  "Format a C/C++ buffer."
  (interactive)
  (rjt-format-buffer "clang-format"))

(defun rjt-format-go-buffer ()
  "Format a Go buffer."
  (interactive)
  (rjt-format-buffer "gofmt"))

(defun rjt-format-rust-buffer ()
  "Format a Rust buffer."
  (interactive)
  (rjt-format-buffer "rustfmt"))

;; tree-sitter.
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; C.
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-c/c++-buffer nil 'local)))
(add-hook 'c++-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-c/c++-buffer nil 'local)))
(add-hook 'c-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-c/c++-buffer nil 'local)))
(add-hook 'c++-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-c/c++-buffer nil 'local)))

;; Go.
(add-hook 'go-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-go-buffer nil 'local)))

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
(add-hook 'rust-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rjt-format-rust-buffer nil 'local)))

(provide 'lang)
