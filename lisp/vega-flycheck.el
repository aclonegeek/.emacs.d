;; -*- lexical-binding: t; -*- 

(use-package flycheck
  :ensure t
  :bind (("C-\\" . flycheck-list-errors)
         ("M-["  . flycheck-previous-error)
         ("M-]"  . flycheck-next-error))
  :hook (((c-mode c++-mode) . flycheck-mode)
         (emacs-lisp-mode   . flycheck-mode)
         (python-mode       . flycheck-mode)
         (rust-mode         . flycheck-mode))
  :config
  (setq-default flycheck-checker-error-threshold 400
                flycheck-disabled-checkers '(emacs-lisp-checkdoc)
                flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'vega-flycheck)
