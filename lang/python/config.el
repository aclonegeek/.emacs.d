;; -*- lexical-binding: t; -*-

(use-package elpy
  :ensure t
  :defer 2
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
  (remove-hook 'elpy-modules 'elpy-module-flymake))

(provide 'config)
