;; -*- lexical-binding: t; -*-

(use-package project
  :defer t
  :config
  (setq project-switch-commands '((project-find-file "File")
                                  (project-find-dir "Directory")
                                  (project-find-regexp "Regexp")
                                  (project-query-replace-regexp "Query replace")
                                  (project-eshell "Eshell")
                                  (magit-project-status "Magit" ?m))))

(provide 'core-project)
