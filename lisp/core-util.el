;; -*- lexical-binding: t; -*-

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun duplicate-line ()
  "Copy the current line and paste it on to a new line."
  (interactive)
  (kill-whole-line)
  (yank)
  (yank)
  (forward-line -1))

(defun select-word-backward ()
  "Select the word before the cursor."
  (interactive)
  (backward-word)
  (set-mark (point))
  (forward-word))

(defun select-word-forward ()
  "Select the word after the cursor."
  (interactive)
  (forward-word)
  (set-mark (point))
  (backward-word))

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word."
  (interactive "p")
  (delete-word (- arg)))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun open-config ()
  "Open Emacs config."
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

; https://www.reddit.com/r/emacs/comments/aja311/first_trial_of_a_weekly_emacs_tipstricksetc_thread/eev3iu4/
(defun calc-eval-region (arg)
  "Evaluate an expression in calc and communicate the result.

If the region is active then evaluate it, otherwise search backwards
to the first whitespace character to find the beginning of the
expression. By default, replace the expression with its value. If
called with the universal prefix argument, keep the expression
and insert the result into the buffer after it. If called with a
negative prefix argument, just echo the result in the
minibuffer."
  (interactive "p")
  (let (start end)
    (if (use-region-p)
        (setq start (region-beginning) end (region-end))
      (setq end (point))
      (setq start (search-backward-regexp "\\s-\\|\n" 0 1))
      (setq start (1+ (if start start 0)))
      (goto-char end))
    (let ((value (calc-eval (buffer-substring-no-properties start end))))
      (pcase arg
        (1 (delete-region start end))
        (4 (insert " = ")))
      (pcase arg
        ((or 1 4) (insert value))
        (-1 (message value))))))

(defun byte-compile-stuff ()
  "Byte-compile stuff."
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))

(defun native-compile-stuff ()
  "Native-compile stuff."
  (interactive)
  (native-compile-async package-user-dir 'recursively))

(defun sudo-edit ()
  "Edit the current file with sudo."
  (interactive)
  (let ((tramp-file-name (concat "/sudo::" (buffer-file-name))))
    (find-file tramp-file-name)))

(defun sudo-find-file ()
  "Edit the selected file with sudo."
  (interactive)
  (let ((default-directory "/sudo::"))
    (call-interactively #'find-file)))

(defun ssh ()
  "Connect to remote host with TRAMP via SSH."
  (interactive)
  (let* ((user (read-string "Username: "))
         (ip (read-string "IP: "))
         (dir (read-string "Directory: "))
         (tramp-file-name (concat "/ssh:" user "@" ip ":" dir)))
    (find-file tramp-file-name)))

(provide 'core-util)
