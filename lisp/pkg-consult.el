;; -*- lexical-binding: t; -*-

(use-package consult
  :bind (("C-c i"   . consult-imenu)
         ("C-c k"   . consult-kmacro)
         ("C-x p b" . consult-project-buffer)
         ("M-g e"   . consult-compile-error)
         ("M-g f"   . consult-flymake)
         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-s l"   . consult-line)
         ("M-s g"   . consult-grep)
         ("M-s r"   . consult-ripgrep)))

(provide 'pkg-consult)
