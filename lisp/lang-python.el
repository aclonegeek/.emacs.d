;; -*- lexical-binding: t; -*-

(setq-default python-shell-interpreter "python3"
              python-indent-offset 4
              python-indent-guess-indent-offset nil
              ;; TODO: Make this crossplatform.
              flycheck-flake8rc "C:/Users/Randy/.flake8")

(provide 'lang-python)
