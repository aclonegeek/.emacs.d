;; -*- lexical-binding: t; -*-

(use-package flyspell
  :hook (org-mode . flyspell-mode)
  :config
  (setq ispell-program-name "aspell"
        ispell-dictionary   "english"
        flyspell-issue-welcome-flag nil
        flyspell-issue-message-flag nil))

(provide 'pkg-flyspell)
