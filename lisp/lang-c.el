;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package cmake-mode
  :defer t)

;; To disable clang-format on save with .dir-locals.el:
;; ((nil . ((eval . (remove-hook 'before-save-hook #'clang-format-buffer t)))))
(use-package clang-format
  :hook ((c-mode c++-mode) . (lambda ()
                               (add-hook 'before-save-hook
                                         #'clang-format-buffer
                                         nil
                                         t))))

(defvar c--treesit-keywords
  '("break"
    "case"
    "const"
    "continue"
    "default"
    "do"
    "else"
    "enum"
    "extern"
    "for"
    "if"
    "inline"
    "return"
    "sizeof"
    "static"
    "struct"
    "switch"
    "typedef"
    "union"
    "volatile"
    "while"
    "...")
  "C keywords for tree-sitter font-locking.")

(defvar c--treesit-operators
  '("+"
    "-"
    "*"
    "/"
    "%"
    "~"
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
    "="
    "+="
    "-="
    "*="
    "/="
    "%="
    "|="
    "&="
    "++"
    "--")
  "C operators for tree-sitter font-locking.")

(defvar c++--treesit-keywords
  '("class"
    "decltype"
    "constexpr"
    "explicit"
    "final"
    "friend"
    "mutable"
    "namespace"
    "override"
    "private"
    "protected"
    "public"
    "template"
    "typename"
    "using"
    "virtual"
    "co_await"
    "concept"
    "requires"
    "consteval"
    "constinit"
    (auto))
  "C++ keywords for tree-sitter font-locking.")

(defvar treesit-font-lock-rules-c/c++
  (treesit-font-lock-rules
   :language 'c
   :feature 'full
   :override t
   `(
     ;; Comments.
     (comment) @font-lock-comment-face

     ;; Escape.
     (escape_sequence) @font-lock-escape-face

     ;; Constants.
     ((identifier) @font-lock-constant-face
      (:match "^[A-Z][A-Z\\d_]*$" @font-lock-constant-face))

     [
      (true)
      (false)
      (null)
      ] @font-lock-builtin-face

     ;; Literals.
     [
      (string_literal)
      (system_lib_string)
      ] @font-lock-string-face
     [
      (char_literal)
      (number_literal)
      ] @font-lock-number-face ;; Custom face.

     ;; Identifiers.
     (type_identifier) @font-lock-type-face
     [(primitive_type)
      (sized_type_specifier)] @font-lock-builtin-face
     (declaration declarator: [(identifier) @font-lock-variable-name-face
                               (_ (identifier) @font-lock-variable-name-face)])
     (parameter_declaration declarator: [(identifier) @font-lock-variable-name-face
                                         (_ (identifier) @font-lock-variable-name-face)])
     (init_declarator declarator: [(identifier) @font-lock-variable-name-face
                                   (_ (identifier) @font-lock-variable-name-face)])
     (assignment_expression
      left: [(identifier) @font-lock-variable-name-face
             (field_expression field: (_) @font-lock-variable-name-face)
             (subscript_expression argument: (identifier) @font-lock-variable-name-face)
             (pointer_expression (identifier) @font-lock-variable-name-face)])
     (update_expression
      argument: (identifier) @font-lock-variable-name-face)
     (preproc_def name: (identifier) @font-lock-variable-name-face)
     (preproc_params
      (identifier) @font-lock-variable-name-face)
     ((["#ifdef" "#ifndef"] (identifier) @font-lock-constant-face))

     ;; Properties.
     (field_declaration
      declarator: [(field_identifier) @font-lock-property-face
                   (pointer_declarator (field_identifier) @font-lock-property-face)
                   (pointer_declarator (pointer_declarator (field_identifier) @font-lock-property-face))])

     (enumerator name: (identifier) @font-lock-property-face)

     (field_identifier) @font-lock-property-face

     ;; Functions.
     (call_expression
      function: [(identifier) @font-lock-function-name-face
                 (field_expression field: (_) @font-lock-function-name-face)])
     (function_declarator
      declarator: [(identifier) @font-lock-function-name-face
                   (parenthesized_declarator
                    (pointer_declarator (field_identifier) @font-lock-function-name-face))])
     (preproc_function_def
      name: (identifier) @font-lock-function-name-face)

     ;; Keywords.
     [,@c--treesit-keywords] @font-lock-keyword-face

     ;; Operators.
     [,@c--treesit-operators] @font-lock-operator-face ;; Custom face.

     ;; Conditional expression.
     (conditional_expression ["?" ":"] @font-lock-operator-face) ;; Custom face.

     ;; Punctuation.
     ["(" ")" "[" "]" "{" "}"] @font-lock-punctuation-face

     ["." "," ";"] @font-lock-punctuation-face

     ;; Preprocessor.
     [
      "#define"
      "#else"
      "#endif"
      "#if"
      "#ifdef"
      "#ifndef"
      "#include"
      (preproc_directive)
      ] @font-lock-preprocessor-face
     )
   :language 'cpp
   :feature 'full
   :override t
   `(
     ;; Keywords.
     [,@c++--treesit-keywords] @font-lock-keyword-face
     )))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq-local treesit-mode-supported t)
            (setq-local treesit-required-languages '(c cpp))
            (setq-local treesit-font-lock-feature-list
                        '((full)))
            (setq-local treesit-font-lock-settings
                        treesit-font-lock-rules-c/c++)
            (treesit-major-mode-setup)))

(provide 'lang-c)
