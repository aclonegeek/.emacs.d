;; -*- lexical-binding: t; -*-

(use-package multiple-cursors
  :bind (("C-?"     . mc/edit-lines)
         ("C-,"     . mc/mark-previous-like-this)
         ("C-."     . mc/mark-next-like-this)
         ("C-c C-." . mc/mark-all-like-this)
         ("C-<"     . mc/unmark-previous-like-this)
         ("C->"     . mc/unmark-next-like-this))
  :init
  (setq mc/always-run-for-all t))

(provide 'pkg-multiple-cursors)
