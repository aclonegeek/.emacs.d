;; -*- lexical-binding: t; -*-

(global-set-key [f1] 'shell)
(global-set-key [f2] 'shell-command)

(global-set-key [C-backspace] 'rjt-backward-delete-word)
(global-set-key (kbd "M-d") 'rjt-delete-word)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "M-k") 'kill-line)
(global-set-key (kbd "C-z") 'duplicate-line)
(global-set-key (kbd "C-q") 'rjt-mark-word-backward)
(global-set-key (kbd "M-q") 'rjt-mark-word-forward)

(global-set-key (kbd "C-c r") 'rjt-revert-buffer-no-confirm)

(global-set-key (kbd "C-`") 'rjt-calc-eval-region)

(global-set-key (kbd "C-c a") 'align-regexp)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c t e") 'treesit-explore-mode)
(global-set-key (kbd "C-c t i") 'treesit-inspect-node-at-point)

(unbind-key "C-x m")
(unbind-key "C-x C-c")

(provide 'core-keybinds)
