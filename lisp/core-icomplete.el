;; -*- lexical-binding: t; -*-

(use-package icomplete
  :straight nil
  :bind (:map icomplete-minibuffer-map
              ("<tab>"    . icomplete-force-complete)
              ("<return>" . icomplete-force-complete-and-exit)
              ("C-M-j"    . icomplete-fido-exit)
              ("C-n"      . icomplete-forward-completions)
              ("C-p"      . icomplete-backward-completions))
  :hook (after-init . icomplete-vertical-mode)
  :config
  (setq icomplete-compute-delay               0
        icomplete-delay-completions-threshold 0
        icomplete-hide-common-prefix          nil
        icomplete-show-matches-on-no-input    t))

(provide 'core-icomplete)
