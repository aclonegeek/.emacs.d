;; -*- lexical-binding: t; -*-

(defvar treesit-font-lock-rules-bash
  (treesit-font-lock-rules
   :language 'bash
   '(
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
     )))

(add-hook 'sh-mode-hook
          (lambda ()
            (when (treesit-can-enable-p)
              (setq-local treesit-font-lock-settings treesit-font-lock-rules-bash)
              (treesit-font-lock-enable))))

(provide 'lang-bash)
