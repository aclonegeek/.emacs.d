;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure t
  :commands (yas-minor-mode yas-reload-all)
  :hook (prog-mode . yas-minor-mode))

(provide 'pkg-yasnippet)
