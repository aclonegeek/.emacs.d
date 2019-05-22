;; -*- lexical-binding: t; -*-

(use-package multiple-cursors
  :ensure t
  :bind (("C-?"     . mc/edit-lines)
         ("C-,"     . mc/mark-previous-like-this)
         ("C-."     . mc/mark-next-like-this)
         ("C-c C-." . mc/mark-all-like-this)
         ("C-<"     . mc/unmark-previous-like-this)
         ("C->"     . mc/unmark-next-like-this)))

(provide 'pkg-multiple-cursors)
