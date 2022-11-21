;; -*- lexical-binding: t; -*-

(setq-default c-basic-offset 4)

(use-package cmake-mode
  :defer t)

;; To disable clang-format on save with .dir-locals.el:
;; ((nil . ((eval . (remove-hook 'before-save-hook #'clang-format-buffer t)))))
(use-package clang-format
  :hook ((c-mode c++-mode) . (lambda ()
                               (add-hook 'before-save-hook
                                         #'clang-format-buffer
                                         nil
                                         t))))

(add-hook 'c-mode-hook 'c-ts-mode)
(add-hook 'c++-mode-hook 'c++-ts-mode)

(provide 'lang-c)
