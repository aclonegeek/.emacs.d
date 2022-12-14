;; -*- lexical-binding: t; -*-

(use-package project
  :straight (:type built-in)
  :defer t
  :config
  (setq project-switch-commands '((project-find-file "File")
                                  (project-find-dir "Directory")
                                  (project-find-regexp "Regexp")
                                  (project-query-replace-regexp "Query replace")
                                  (project-eshell "Eshell")
                                  ((lambda ()
                                     (interactive)
                                     (magit-status project-current-directory-override))
                                   "Magit" ?m))))

(provide 'core-project)
