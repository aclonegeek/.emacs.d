;; -*- lexical-binding: t; -*-

(defun rjt-revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun rjt-mark-word-backward ()
  "Mark the word before the cursor."
  (interactive)
  (backward-word)
  (set-mark (point))
  (forward-word))

(defun rjt-mark-word-forward ()
  "Mark the word after the cursor."
  (interactive)
  (forward-word)
  (set-mark (point))
  (backward-word))

(defun rjt-delete-word (arg)
  "Delete characters forward until encountering the end of a word."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun rjt-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word."
  (interactive "p")
  (rjt-delete-word (- arg)))

(defun rjt-open-config ()
  "Open Emacs config."
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

; https://www.reddit.com/r/emacs/comments/aja311/first_trial_of_a_weekly_emacs_tipstricksetc_thread/eev3iu4/
(defun rjt-calc-eval-region (arg)
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

(defun rjt-sudo-edit ()
  "Edit the current file with sudo."
  (interactive)
  (let ((tramp-file-name (concat "/sudo::" (buffer-file-name))))
    (find-file tramp-file-name)))

(defun rjt-sudo-find-file ()
  "Edit the selected file with sudo."
  (interactive)
  (let ((default-directory "/sudo::"))
    (call-interactively #'find-file)))

(defun rjt-ssh ()
  "Connect to remote host with TRAMP via SSH."
  (interactive)
  (let* ((user (read-string "Username: "))
         (ip (read-string "IP: "))
         (dir (read-string "Directory: "))
         (tramp-file-name (concat "/ssh:" user "@" ip ":" dir)))
    (find-file tramp-file-name)))

(defun rjt-native-compile-packages ()
  "Native-compile all packages."
  (interactive)
  (native-compile-async elpaca-builds-directory 'recursively))

(provide 'core-util)
