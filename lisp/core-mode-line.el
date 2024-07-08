;; -*- lexical-binding: t; -*-

;; Force monospace font.
(set-face-attribute 'mode-line-active nil :inherit 'mode-line)
(set-face-attribute 'mode-line-inactive nil :inherit 'mode-line)

(setq-default mode-line-format
              (list
               " "
               '(:eval (mode-line-project-name))
               'mode-line-buffer-identification
               " "
               "%l:%c"
               'mode-line-format-right-align
               '(flymake-mode (:propertize ("/^v^\\" flymake-mode-line-counters)))
               " "
               ))

(defun mode-line-project-name ()
  "Return the project name for the project formatted for the mode-line."
  (when-let ((proj (project-current)))
      (list "["
            (project-name proj)
            "] ")))

(provide 'core-mode-line)
