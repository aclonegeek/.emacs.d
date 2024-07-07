;; -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-auto t)
  :hook (prog-mode . corfu-mode)
  :config
  (corfu-indexed-mode)
  (setq corfu-auto-delay 0
        corfu-auto-prefix 1
        corfu-quit-at-boundary nil
        corfu-quit-no-match t))

(use-package kind-icon
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  (setq kind-icon-use-icons nil
        kind-icon-default-face 'corfu-default))

(provide 'pkg-corfu)
