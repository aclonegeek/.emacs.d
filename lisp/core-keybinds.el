;; -*- lexical-binding: t; -*-

(global-set-key [f1] 'shell)
(global-set-key [f2] 'shell-command)

;; Mirror most popular text editor's C-backspace functionality (for the most part).
(global-set-key [C-backspace] 'backward-delete-word)

(global-set-key (kbd "C-`") 'calc-eval-region)

(global-set-key (kbd "C-c a") 'align-regexp)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-d") 'delete-word)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "M-k") 'kill-line)
(global-set-key (kbd "C-z") 'duplicate-line)
(global-set-key (kbd "C-q") 'select-word-backward)
(global-set-key (kbd "M-q") 'select-word-forward)

(global-set-key (kbd "C-c r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-c n") 'rename-file-and-buffer)

(provide 'core-keybinds)
