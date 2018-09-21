;; -*- lexical-binding: t; -*-

(use-package lsp-java
  :ensure t
  :hook ((java-mode . lsp-java-enable)
         (java-mode . flycheck-mode))
  :config
  (setq lsp-java--workspace-folders (list
                                     ())))

(provide 'lang-java)
