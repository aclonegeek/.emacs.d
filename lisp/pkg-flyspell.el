;; -*- lexical-binding: t; -*-

(use-package flyspell
  :hook (org-mode . flyspell-mode)
  :config
  (setq ispell-program-name "aspell"
        ispell-dictionary   "english"))

(provide 'pkg-flyspell)
