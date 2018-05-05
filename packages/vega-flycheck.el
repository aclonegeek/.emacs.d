;; -*- lexical-binding: t; -*- 

(use-package flycheck
  :ensure t
  :bind (("C-\\"    . flycheck-list-errors)
         ("C-x n e" . flycheck-next-error)
         ("C-x p e" . flycheck-previous-error))
  :commands flycheck-mode
  :init
  (setq-default flycheck-checker-error-threshold 400
                ;; TODO(randy): Make this cross-platform.
                flycheck-pylintrc "C:/Users/Randy/.pylintrc"
                flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config (global-flycheck-mode))

(provide 'vega-flycheck)
