;; -*- lexical-binding: t; -*-

(setq-default python-indent-offset 4
              python-indent-guess-indent-offset nil
              flycheck-flake8rc "C:/Users/Randy/.flake8")

(use-package elpy
  :ensure t
  :defer 2
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (remove-hook 'elpy-modules 'elpy-module-highlight-indentation))

(provide 'lang-python)
