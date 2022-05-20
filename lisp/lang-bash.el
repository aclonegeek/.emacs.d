;; -*- lexical-binding: t; -*-

(defvar bash-font-lock-settings
  '((bash
     (
      ;; Comments.
      (comment) @font-lock-comment-face

      (file_descriptor) @font-lock-number-face ;; Custom face.

      (case_item
       value: (word) @font-lock-constant-face)

      [
       (string)
       (raw_string)
       (heredoc_body)
       (heredoc_start)
       ] @font-lock-string-face

      [
       (command_substitution)
       (process_substitution)
       (expansion)
       ] @default

      (variable_name) @font-lock-property-face ;; Custom face.

      (command_name) @font-lock-function-name-face
      (function_definition
       name: (word) @font-lock-function-name-face)

      ;; Keywords.
      [
       "case"
       "do"
       "done"
       "elif"
       "else"
       "esac"
       "export"
       "fi"
       "for"
       "function"
       "if"
       "in"
       "unset"
       "while"
       "then"
       ] @font-lock-keyword-face

      ;; Operators.
      [
       "$"
       "||"
       "&&"
       ">"
       ">>"
       "<"
       "<<"
       "<<<"
       "<<-"
       "=="
       "!="
       ";"
       ";;"
       ";&"
       ";;&"
       "|&"
       "|"
       (expansion_flags)
       ] @font-lock-operator-face ;; Custom face.
      ))))

(define-minor-mode ts-hl-bash-mode
  "Minor mode for highlighting Bash using tree-sitter."
  :lighter nil
  (require 'treesit)
  (setq-local treesit-font-lock-defaults '((bash-font-lock-settings)))
  (treesit-font-lock-enable))

(add-hook 'sh-mode-hook #'ts-hl-bash-mode)

(provide 'lang-bash)
