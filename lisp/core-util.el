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

(defun rjt-calc-eval-region (start end)
  "Evaluate a region with calc."
  (interactive "r")
  (let ((region
         (replace-regexp-in-string ",\\|\\$"
                                   ""
                                   (buffer-substring-no-properties start end))))
    (delete-region start end)
    (insert (calc-eval region))))

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

(defun rjt-generate-autoloads-and-compile ()
  "Generate autoloads and compile all packages."
  (interactive)
  (loaddefs-generate (directory-files
                      emacs-packages-dir
                      t
                      directory-files-no-dot-files-regexp)
                     emacs-packages-autoloads
                     nil
                     nil
                     nil
                     t
                     )
  (byte-recompile-directory emacs-packages-dir 0)
  (setq native-comp-async-jobs-number (- (num-processors) 2))
  (native-compile-async emacs-packages-dir 'recursively 'load))

(provide 'core-util)

