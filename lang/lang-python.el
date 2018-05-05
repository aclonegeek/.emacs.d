;; -*- lexical-binding: t; -*-

(setq-default python-indent-offset 4
              python-indent-guess-indent-offset nil)

(use-package elpy
  :ensure t
  :defer 2
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
  (remove-hook 'elpy-modules 'elpy-module-flymake))

(provide 'lang-python)
