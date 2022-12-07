;; -*- lexical-binding: t; -*-

(use-package project
  :straight (:type built-in)
  :bind (:map project-prefix-map
              ("m" . magit-status))
  :config
  (setq project-switch-commands '((project-find-file "File")
                                  (project-find-dir "Directory")
                                  (project-find-regexp "Regexp")
                                  (project-query-replace-regexp "Query replace")
                                  (project-eshell "Eshell")
                                  (magit-status "Magit"))))

(provide 'core-project)
