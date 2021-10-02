;; -*- lexical-binding: t; -*-

(use-package flymake
  :bind (("C-\\" . flymake-show-diagnostics-buffer)
         ("M-["  . flymake-goto-prev-error)
         ("M-]"  . flymake-goto-next-error))
  :hook ((emacs-lisp-mode . flymake-mode)
         (emacs-lisp-mode . (lambda ()
                              (remove-hook 'flymake-diagnostic-functions
                                           'elisp-flymake-checkdoc t))))
  :config
  (setq flymake-no-changes-timeout nil)
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

(provide 'pkg-flymake)
