;; -*- lexical-binding: t; -*-

(use-package icomplete
  :bind (:map icomplete-minibuffer-map
              ("<tab>"    . icomplete-force-complete)
              ("<return>" . icomplete-force-complete-and-exit)
              ("C-n"      . icomplete-forward-completions)
              ("C-p"      . icomplete-backward-completions))
  :config
  (setq icomplete-compute-delay               0
        icomplete-delay-completions-threshold 0))

(use-package icomplete-vertical
  :hook ((after-init . icomplete-mode)
         (after-init . icomplete-vertical-mode)))

(provide 'pkg-icomplete)
