;; -*- lexical-binding: t; -*-

(setq-default python-shell-interpreter "python3"
              python-indent-offset 4
              python-indent-guess-indent-offset nil
              ;; TODO(randy): Make this crossplatform.
              flycheck-pylintrc "~/.flake8"
              flycheck-pylintrc "~/.pylintrc")

(use-package lsp-python-ms
  :defer t
  :hook (python-mode . (lambda () (require 'lsp-python-ms)(lsp-deferred))))

(provide 'lang-python)
