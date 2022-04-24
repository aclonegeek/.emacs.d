;; -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-auto t)
  :hook (prog-mode . corfu-mode)
  :config
  (setq corfu-auto-delay 0
        corfu-auto-prefix 1
        corfu-quit-at-boundary nil))

(use-package kind-icon
  :straight (:host nil :repo "https://git.sr.ht/~randy/kind-text" :branch "kind-text")
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  (setq kind-icon-use-icons nil
        kind-icon-default-fault 'corfu-default))

(provide 'pkg-corfu)
