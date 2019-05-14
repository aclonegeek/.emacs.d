;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure t
  :commands (yas-minor-mode yas-reload-all)
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(provide 'vega-yasnippet)
