;; -*- lexical-binding: t; -*-

(defvar treesit-font-lock-rules-go)

(use-package go-mode
  :hook ((go-mode . (lambda ()
                      (setq-local treesit-mode-supported t)
                      (setq-local treesit-required-languages '(go))
                      (setq-local treesit-font-lock-feature-list
                                  '((full)))
                      (setq-local treesit-font-lock-settings
                                  treesit-font-lock-rules-go)
                      (treesit-major-mode-setup)))
         (before-save . gofmt-before-save)))

(setq treesit-font-lock-rules-go
      (treesit-font-lock-rules
       :language 'go
       :feature 'full
       :override t
       '(
         ;; Comments.
         (comment) @font-lock-comment-face

         ;; Escape.
         (escape_sequence) @font-lock-escape-face

         ;; Constants.
         [
          (true)
          (false)
          (nil)
          ] @font-lock-builtin-face

         ;; Literals.
         [
          (interpreted_string_literal)
          (raw_string_literal)
          (rune_literal)
          ] @font-lock-string-face

         ;; Numbers.
         [
          (int_literal)
          (float_literal)
          (imaginary_literal)
          ] @font-lock-number-face ;; Custom face.

         ;; Identifiers.
         (type_identifier) @font-lock-type-face
         (field_identifier) @font-lock-property-face ;; Custom face.
         (short_var_declaration left: (expression_list (identifier)) @font-lock-variable-name-face)
         (var_declaration (var_spec name: (identifier) @font-lock-variable-name-face))
         (parameter_declaration (identifier) @font-lock-variable-name-face)
         (const_declaration (const_spec name: (identifier) @font-lock-constant-face))

         ;; Function calls.
         (call_expression
          function: (identifier) @font-lock-function-name-face)
         (call_expression
          function: (selector_expression
                     field: (field_identifier)) @font-lock-function-name-face)
         ;; Function definitions.
         (function_declaration
          name: (identifier) @font-lock-function-name-face)
         (method_declaration
          name: (field_identifier) @font-lock-function-name-face)

         ;; Keywords.
         [
          "break"
          "case"
          "chan"
          "const"
          "continue"
          "default"
          "defer"
          "else"
          "fallthrough"
          "for"
          "func"
          "go"
          "goto"
          "if"
          "import"
          "interface"
          "map"
          "package"
          "range"
          "return"
          "select"
          "struct"
          "switch"
          "type"
          "var"
          ] @font-lock-keyword-face

         ;; Operators.
         [
          "--"
          "-"
          "-="
          ":="
          "!"
          "!="
          "..."
          "*"
          "*"
          "*="
          "/"
          "/="
          "&"
          "&&"
          "&="
          "%"
          "%="
          "^"
          "^="
          "+"
          "++"
          "+="
          "<-"
          "<"
          "<<"
          "<<="
          "<="
          "="
          "=="
          ">"
          ">="
          ">>"
          ">>="
          "|"
          "|="
          "||"
          ] @font-lock-operator-face ;; Custom face.
         )))

(provide 'lang-go)
