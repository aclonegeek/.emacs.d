;; -*- lexical-binding: t; -*-

(use-package vertico
  :bind (:map vertico-map
              ([C-backspace] . vertico-directory-delete-word))
  :hook (after-init . vertico-mode))

(use-package vertico-indexed
  :hook (vertico-mode . vertico-indexed-mode))

(use-package vertico-multiform
  :hook (vertico-mode . vertico-multiform-mode)
  :config
  ;; https://github.com/minad/vertico/wiki#customize-sorting-based-on-completion-category
  (defun sort-directories-first (files)
    (setq files (vertico-sort-alpha files))
    (nconc (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
           (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))

  ;; https://github.com/minad/vertico/wiki#candidate-display-transformations-custom-candidate-highlighting
  (defvar +vertico-transform-functions nil)

  (cl-defmethod vertico--format-candidate :around
    (cand prefix suffix index start &context ((not +vertico-transform-functions) null))
    (dolist (fun (ensure-list +vertico-transform-functions))
      (setq cand (funcall fun cand)))
    (cl-call-next-method cand prefix suffix index start))

  (defun +vertico-highlight-directory (file)
    "If FILE ends with a slash, highlight it as a directory."
    (if (string-suffix-p "/" file)
        (propertize file 'face 'marginalia-file-priv-dir) ; or face 'dired-directory
      file))

  (setq vertico-multiform-categories
        '((file
           (vertico-sort-function . sort-directories-first)
           (+vertico-transform-functions . +vertico-highlight-directory)))))

(provide 'pkg-vertico)
