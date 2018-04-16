;; -*- lexical-binding: t; -*-

(use-package elpy
  :ensure t
  :defer 2
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi"))
;  (setq elpy-rpc-python-command "python3"))

(provide 'config)
