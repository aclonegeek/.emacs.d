;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :hook ((rust-mode . ts-hl-rust-mode))
  :bind ("C-c c" . rust-run-clippy)
  :config
  (setq rust-format-on-save t))

(defvar rust-font-lock-settings
  `((rust
     ,(treesit-query-compile
       'rust
       '(
         ;; Comments.
         [
          (block_comment)
          (line_comment)
          ] @font-lock-comment-face

         ;; Escape.
         (escape_sequence) @font-lock-escape-face

         ;; Constants.
         ((identifier) @font-lock-constant-face
          (:match "^[A-Z][A-Z\\d_]*$" @font-lock-constant-face))

         (boolean_literal) @font-lock-builtin-face

         ;; Literals.
         [
          (char_literal)
          (string_literal)
          (raw_string_literal)
          ] @font-lock-string-face
         [
          ;; (char_literal)
          (integer_literal)
          (float_literal)
          ] @font-lock-number-face ;; Custom face.

         ;; Identifiers.
         (identifier) @font-lock-variable-name-face
         (type_identifier) @font-lock-type-face
         (primitive_type) @font-lock-builtin-face
         (field_identifier) @font-lock-property-face

         ;; Functions.
         (call_expression
          function: [(identifier) @font-lock-function-name-face
                     (field_expression
                      field: (field_identifier) @font-lock-function-name-face)
                     (scoped_identifier
                      name: (identifier) @font-lock-function-name-face)])

         (generic_function
          function: [(identifier) @font-lock-function-name-face
                     (field_expression
                      field: (field_identifier) @font-lock-function-name-face)
                     (scoped_identifier
                      name: (identifier) @font-lock-function-name-face)])

         ;; TODO: Custom macro face?
         (macro_invocation
          macro: [(identifier) @font-lock-function-name-face
                  (scoped_identifier
                   name: (identifier) @font-lock-function-name-face)])

         ;; Keywords.
         [
          "as"
          "async"
          "await"
          "break"
          "const"
          "continue"
          "dyn"
          "else"
          "enum"
          "extern"
          "fn"
          "for"
          "if"
          "impl"
          "in"
          "let"
          "loop"
          "match"
          "mod"
          "move"
          "pub"
          "ref"
          "return"
          "static"
          "struct"
          "trait"
          "type"
          "union"
          "unsafe"
          "use"
          "where"
          "while"
          (crate)
          (self)
          (super)
          (mutable_specifier)
          ] @font-lock-keyword-face

         ;; Operators.
         [
          "+"
          "-"
          "*"
          "/"
          "%"
          "|"
          "&"
          "<<"
          ">>"
          "!"
          "||"
          "&&"
          "->"
          "=="
          "!="
          "<"
          ">"
          "<="
          ">="
          ">>="
          "<<="
          "="
          "+="
          "-="
          "*="
          "/="
          "%="
          "|="
          "&="
          "^="
          ".."
          "..="
          "?"
          "@"
          ] @font-lock-operator-face ;; Custom face.

         ;; Punctuation.
         ["(" ")" "[" "]" "{" "}"] @font-lock-punctuation-face
         ["." "," ";" ":" "::"] @font-lock-punctuation-face
         )))))

(define-minor-mode ts-hl-rust-mode
  "Minor mode for highlighting Rust using tree-sitter."
  :lighter nil
  (require 'treesit)
  (unless font-lock-defaults
    (setq font-lock-defaults '(nil t)))
  (setq-local treesit-font-lock-defaults '((rust-font-lock-settings)))
  (treesit-font-lock-enable))

(provide 'lang-rust)
