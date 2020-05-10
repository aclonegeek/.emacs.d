;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure t
  :commands (yas-reload-all yas-minor-mode)
  :hook ((after-init . (lambda () (yas-reload-all)))
         (prog-mode  . (lambda () (yas-minor-mode)))))

(provide 'pkg-yasnippet)
