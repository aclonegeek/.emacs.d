;; https://emacs.stackexchange.com/a/7542
(defun simple-mode-line-render (left right)
  "Return a string of `window-width' length containing LEFT and RIGHT aligned respectively."
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format "%%s %%%ds" available-width) left right)))

;; https://emacs.stackexchange.com/a/37270
(setq-default mode-line-format
              '((:eval
                 (simple-mode-line-render
                  ;; left
                  (format-mode-line
                   (quote
                    ("%e"
                     mode-line-directory
                     mode-line-buffer-identification
                     " "
                     mode-line-position)))
                  ;; right
                  (format-mode-line
                   (quote
                    ("%m")))))))

(setq mode-line-position
      '((line-number-mode ("%l" (column-number-mode ":%c")))
        " "
        "%p"))

; Set a darker background for the mode-line
(set-face-attribute 'mode-line nil :background "#2D2B28")

(defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " ")))
  "Formats the current directory.")
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
