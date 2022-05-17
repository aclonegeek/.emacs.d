;; -*- lexical-binding: t; -*-

;; Force monospace font.
(set-face-attribute 'mode-line-active nil :inherit 'mode-line)
(set-face-attribute 'mode-line-inactive nil :inherit 'mode-line)

(setq-default mode-line-format
              (list ""
               'mode-line-directory
               'mode-line-buffer-identification
               " "
               "%l:%c"
               '(flymake-mode (:propertize ("/^v^\\" flymake-mode-line-counters)))))

(defvar mode-line-directory
  '(:propertize
    (:eval
     (when (buffer-file-name) (concat " " (shorten-directory default-directory 20))))))
(put 'mode-line-directory 'risky-local-variable t)

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
               (output ""))
       (when (and path (equal "" (car path)))
         (setq path (cdr path)))
       (while (and path (< (length output) (- max-length 4)))
         (setq output (concat (car path) "/" output))
         (setq path (cdr path)))
       (when path
         (setq output (concat ".../" output)))
       output))

(provide 'core-modeline)
