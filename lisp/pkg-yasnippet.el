;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure t
  :commands (yas-reload-all yas-minor-mode)
  :hook ((c-mode c++-mode) . yas-minor-mode))

(provide 'pkg-yasnippet)
