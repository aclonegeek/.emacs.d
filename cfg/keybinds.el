(global-set-key [f1] 'shell)
(global-set-key [f2] 'shell-command)

;; Auto align
(global-set-key (kbd "C-c C-a") 'align)

;; Mirror most popular text editor's C-backspace functionality (for the most part)
(global-set-key [C-backspace] 'backward-kill-word)

;; goto-line
(global-set-key [C-tab] 'goto-line)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "M-k") 'kill-line)
(global-set-key (kbd "C-z") 'duplicate-line)
(global-set-key (kbd "C-q") 'select-word)

(global-set-key (kbd "C-c r") 'revert-buffer-no-comfirm)
(global-set-key (kbd "C-c n") 'rename-file-and-buffer)

;; Open respective .h/.c(c/pp) file
(global-set-key (kbd "C-;") 'ff-find-other-file)
(global-set-key (kbd "C-'") 'find-other-file-other-window)

(provide 'keybinds)
