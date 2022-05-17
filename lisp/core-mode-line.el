;; -*- lexical-binding: t; -*-

;; Force monospace font.
(set-face-attribute 'mode-line-active nil :inherit 'mode-line)
(set-face-attribute 'mode-line-inactive nil :inherit 'mode-line)

(defconst mode-line-left
      (list " "
            'mode-line-buffer-identification
            " "
            "%l:%c"))

(defconst mode-line-right
      (list ""
            '(flymake-mode (:propertize ("/^v^\\" flymake-mode-line-counters)))))

(setq-default mode-line-format
              (list
               mode-line-left
               '(:eval (mode-line-fill-right))
               mode-line-right))

(defun mode-line-fill-right ()
  "Return enough empty space to right-align `mode-line-right' items."
  (let ((length (length (format-mode-line mode-line-right))))
        (propertize " "
                    'display `(space :align-to (- right ,length)))))

(provide 'core-mode-line)
