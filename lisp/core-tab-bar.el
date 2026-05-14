;; -*- lexical-binding: t; -*-

(defun rjt--clean-new-tab-buffer-list (_tab)
  "Reset frame buffer-list parameters so a new tab starts clean.
Otherwise, new tabs would inherit the originating tab's frame buffer-list"
  (set-frame-parameter nil 'buffer-list nil)
  (set-frame-parameter nil 'buried-buffer-list nil))

(defun rjt--new-tab-placeholder ()
  "Create a hidden placeholder buffer for newly created tabs."
  (get-buffer-create " *rjt-tab*"))

(defun rjt--switch-to-tab (dir)
  (let* ((name (file-name-nondirectory (directory-file-name dir))))
    (tab-bar-switch-to-tab name)))

(use-package tab-bar
  :bind (("C-x t n" . tab-bar-new-tab))
  :hook (after-init . (lambda ()
                        (tab-bar-mode)
                        (tab-rename "misc")))
  :config (setq tab-bar-close-button-show nil
                tab-bar-format '(tab-bar-format-tabs tab-bar-separator)
                tab-bar-new-tab-choice #'rjt--new-tab-placeholder
                tab-bar-show nil
                tab-bar-tab-hints t))

(add-hook 'tab-bar-tab-post-open-functions #'rjt--clean-new-tab-buffer-list)
(advice-add 'project-switch-project :before #'rjt--switch-to-tab)

(provide 'core-tab-bar)
