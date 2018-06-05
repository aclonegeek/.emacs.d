;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure t
  :defer t
  :commands yas-minor-mode
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(provide 'vega-yasnippet)
