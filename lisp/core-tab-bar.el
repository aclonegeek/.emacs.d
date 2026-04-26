;; -*- lexical-binding: t; -*-

(use-package tab-bar
  :bind (("C-x t n" . tab-bar-new-tab))
  :hook (after-init . (lambda ()
                        (tab-bar-mode)
                        (tab-rename "misc")))
  :config (setq tab-bar-show nil
                tab-bar-close-button-show nil
                tab-bar-tab-hints t
                tab-bar-format '(tab-bar-format-tabs tab-bar-separator)))

(advice-add 'project-switch-project :before #'rjt--switch-to-tab)

(defun rjt--switch-to-tab (dir)
  (let* ((name (file-name-nondirectory (directory-file-name dir))))
    (tab-bar-switch-to-tab name)))

(provide 'core-tab-bar)
