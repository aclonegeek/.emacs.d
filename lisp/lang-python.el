;; -*- lexical-binding: t; -*-

(setq-default python-shell-interpreter "python3"
              python-indent-offset 4
              python-indent-guess-indent-offset nil
              ;; TODO: Make this crossplatform.
              flycheck-flake8rc "C:/Users/Randy/.flake8")

(use-package elpy
  :ensure t
  :defer 2
  :config
  (elpy-enable)
  (setq elpy-rpc-python-command "python3")
  (setq elpy-rpc-backend "jedi")
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (remove-hook 'elpy-modules 'elpy-module-highlight-indentation))

(provide 'lang-python)
