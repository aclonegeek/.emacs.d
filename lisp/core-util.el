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

(defun open-config()
  "Open Emacs config."
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(provide 'core-util)
