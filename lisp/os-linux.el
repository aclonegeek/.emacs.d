;; -*- lexical-binding: t; -*-

;; Required because emacs and emacsclient have differing
;; exec-path's; emacsclient is missing cargo, meaning no
;; rust things work on it. This fixes it.
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(provide 'os-linux)
