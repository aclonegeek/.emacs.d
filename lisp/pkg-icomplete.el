;; -*- lexical-binding: t; -*-

(use-package icomplete
  :bind (:map icomplete-minibuffer-map
              ("<tab>"    . icomplete-force-complete)
              ("<return>" . icomplete-force-complete-and-exit)
              ("C-n"      . icomplete-forward-completions)
              ("C-p"      . icomplete-backward-completions))
  :hook (after-init . icomplete-mode)
  :config
  (setq icomplete-vertical-mode               t
        icomplete-compute-delay               0
        icomplete-delay-completions-threshold 0))

(provide 'pkg-icomplete)
