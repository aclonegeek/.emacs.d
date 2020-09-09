;; -*- lexical-binding: t; -*-

(use-package which-key
  :ensure t
  :commands which-key-mode
  :hook ((after-init . which-key-mode))
  :config
  (setq which-key-idle-delay        0.1
        which-key-show-early-on-C-h t))

(provide 'pkg-which-key)
