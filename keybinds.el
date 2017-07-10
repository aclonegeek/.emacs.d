;; CORE
;; Shell
;; Code
(global-set-key [f1] 'shell)
(global-set-key [f2] 'shell-command)

;; Auto align
(global-set-key (kbd "C-c C-a") 'align)

;; Mirror most popular text editor's C-backspace functionality (for the most part)
(global-set-key [C-backspace] 'backward-kill-word)

;; goto-line
(global-set-key [C-tab] 'goto-line)

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-z") 'duplicate-line)
(global-set-key (kbd "C-d") 'select-word)

(global-set-key (kbd "C-c r") 'revert-buffer-no-comfirm)
(global-set-key (kbd "C-c n") 'rename-file-and-buffer)

;; PYTHON
;; pylint
(global-set-key [f12] 'pylint-insert-ignore-comment)

;; CUSTOM PACKAGES
;; Keybinds for ADSC file templates
(global-set-key [f5] 'adsc-todo)
(global-set-key [f6] 'adsc-python-script)
(global-set-key [f7] 'adsc-python-module)
(global-set-key [f9] 'adsc-file-created)
(global-set-key [C-f9] 'adsc-last-update)
(global-set-key [C-S-f9] 'adsc-update-history)

;; Multiple Cursors
(global-set-key (kbd "C-?") 'mc/edit-lines)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "C-<") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C->") 'mc/unmark-next-like-this) ;; Unmark current selection

;; Flycheck
(global-set-key (kbd "C-\\") 'flycheck-list-errors)

(global-set-key [f8] 'neotree-toggle)

;; Open respective .h/.c(c/pp) file
(global-set-key (kbd "C-;") 'ff-find-other-file)
(global-set-key (kbd "C-'") 'find-other-file-other-window)

(provide 'keybinds)
