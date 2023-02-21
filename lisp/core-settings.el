;; -*- lexical-binding: t; -*-

(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (eq system-type 'windows-nt))

(setq-default
 package-native-compile t

 ring-bell-function #'ignore
 visible-bell nil

 ;; Disable backups and lockfiles.
 auto-save-list-file-prefix nil
 make-backup-files nil
 create-lockfiles  nil

 ;; 4 spaces instead of tabs.
 indent-tabs-mode nil
 tab-width 4
 tab-stop-list (quote (4 8))
 tab-always-indent 'complete

 auto-composition-mode nil
 mouse-wheel-progressive-speed nil

 ;; Optimizations.
 auto-mode-case-fold nil ;; Don't pass twice over auto-mode-alist.
 auto-window-vscroll nil
 line-move-visual nil
 inhibit-compacting-font-caches t
 bidi-display-reordering 'left-to-right
 bidi-paragraph-direction 'left-to-right
 bidi-inhibit-bpa t
 fast-but-imprecise-scrolling t
 redisplay-skip-fontification-on-input t

 ;; Let Emacs read more from the process.
 read-process-output-max (* 1024 1024)

 ;; Don't render cursors or regions in non-focused windows.
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil)

(setq use-short-answers t)

(setq save-interprogram-paste-before-kill t)

;; Completion.
(setq completion-ignore-case t
      read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-styles '(basic partial-completion flex)
      completion-show-help nil
      completions-format 'vertical)

;; Compilation
(setq-default compilation-always-kill t
              compilation-scroll-output t)

;; Dired.
(setq-default dired-kill-when-opening-new-dired-buffer t)

;; ElDoc.
(setq eldoc-documentation-strategy #'eldoc-documentation-compose)

;; Proced.
(setq-default proced-auto-update-flag t)
(setq-default proced-auto-update-interval 1)
(setq-default proced-enable-color-flag t)

;; tree-sitter.
(setq-default treesit-font-lock-level 4)
(push '(c-mode . c-ts-mode) major-mode-remap-alist)
(push '(c++-mode . c++-ts-mode) major-mode-remap-alist)
(push '(c-or-c++-mode . c-or-c++-ts-mode) major-mode-remap-alist)
(push '(conf-toml-mode . toml-ts-mode) major-mode-remap-alist)
(push '(csharp-mode . csharp-ts-mode) major-mode-remap-alist)
(push '(css-mode . css-ts-mode) major-mode-remap-alist)
(push '(java-mode . java-ts-mode) major-mode-remap-alist)
(push '(js-mode . javascript-ts-mode) major-mode-remap-alist)
(push '(js-json-mode . json-ts-mode) major-mode-remap-alist)
(push '(python-mode . python-ts-mode) major-mode-remap-alist)
(push '(ruby-mode . ruby-ts-mode) major-mode-remap-alist)
(push '(sh-mode . bash-ts-mode) major-mode-remap-alist)
(add-to-list 'auto-mode-alist
                 '("\\(?:CMakeLists\\.txt\\|\\.cmake\\)\\'" . cmake-ts-mode))
(add-to-list 'auto-mode-alist
                 '("\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\)\\'"
                   . dockerfile-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))

;; VC.
(remove-hook 'find-file-hook 'vc-refresh-state)
(setq vc-handled-backends '(Git))

(use-package grep
  :straight nil
  :bind ([f5] . rjt-grep-find)
  :config
  (defun rjt-grep-find ()
    (interactive)
    (let* ((proj (project-current))
           (default-directory (if proj
                                  (project-root proj)
                                default-directory
                                )))
      (call-interactively #'grep-find)))
  (setq grep-program "rg")
  (grep-apply-setting
     'grep-find-command
     '("rg --no-heading -H '' -g=''" . 21)))

(setq vc-follow-symlinks t)

(delete-selection-mode 1)
(electric-pair-mode 1)

(defun minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun minibuffer-exit-hook ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold 16777216))))

(add-hook 'minibuffer-setup-hook #'minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook  #'minibuffer-exit-hook)

(add-hook 'after-save-hook #'garbage-collect)
(add-function :after after-focus-change-function #'garbage-collect)

(add-hook 'after-save-hook  #'executable-make-buffer-file-executable-if-script-p)

;;
;; PGTK.
;;
;; Reduce frame operation latency.
(setq pgtk-wait-for-event-timeout 0.001)

;;
;; Windows.
;;
(when IS-WINDOWS
  (setq default-directory (expand-file-name (getenv "UserProfile")))
  ;; Windows-specific optimizations.
  (setq w32-get-true-file-attributes nil
        w32-pipe-buffer-size         (* 64 1024)))

(provide 'core-settings)
