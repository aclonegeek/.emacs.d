;; -*- lexical-binding: t; -*-

(use-package flyspell
  :hook (org-mode . flyspell-mode)
  :bind (:map flyspell-mode-map
              ("C-." . nil)
              ("C-," . nil))
  :config
  (setq ispell-program-name "aspell"
        ispell-dictionary   "english"
        flyspell-issue-welcome-flag nil
        flyspell-issue-message-flag nil))

(provide 'pkg-flyspell)
