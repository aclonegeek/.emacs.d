;; -*- lexical-binding: t; -*- 

(use-package flycheck
  :ensure t
  :defer t
  :bind (("C-\\"    . flycheck-list-errors)
         ("C-x n e" . flycheck-next-error)
         ("C-x p e" . flycheck-previous-error))
  :hook ((emacs-lisp-mode . flycheck-mode)
         (python-mode     . flycheck-mode)
         (rust-mode       . flycheck-mode))
  :config
  (setq-default flycheck-checker-error-threshold 400
                flycheck-disabled-checkers '(emacs-lisp-checkdoc)
                flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'vega-flycheck)
