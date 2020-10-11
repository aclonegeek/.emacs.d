;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :hook (prog-mode . projectile-mode)
  :config
  (setq projectile-enable-caching    t
        projectile-indexing-method   'alien
        projectile-completion-system #'icomplete-projectile-vertical-completion
        projectile-generic-command   "fd . -0")
  (add-to-list 'projectile-globally-ignored-directories ".clangd"))

(defun icomplete-projectile-vertical-completion (prompt choices)
  "Provide vertical completion for projectile."
  (interactive)
  (icomplete-vertical-do ()
    (completing-read prompt choices)))

(provide 'pkg-projectile)
