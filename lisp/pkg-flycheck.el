;; -*- lexical-binding: t; -*-

(use-package flycheck
  :ensure t
  :bind (("C-\\" . flycheck-list-errors)
         ("M-["  . flycheck-previous-error)
         ("M-]"  . flycheck-next-error))
  :hook (emacs-lisp-mode . flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)
                flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'pkg-flycheck)
