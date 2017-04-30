(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Mirror most popular text editor's C-backspace functionality (for the most part)
(global-set-key [C-backspace] 'backward-kill-word)

;; THEME
(require 'doom-themes)
(setq doom-enable-bold t
      doom-enable-italic t)
(load-theme 'doom-molokai t)

;; MULTPILE CURSORS
(require 'multiple-cursors)
(global-set-key (kbd "C-?") 'mc/edit-lines)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "C-<") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C->") 'mc/unmark-next-like-this) ;; Unmark current selection

(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-c C-v") 'duplicate-line)
(defun duplicate-line ()
  "Copy the current line and paste it on to a new line."
  (interactive)
  (kill-whole-line)
  (yank)
  (yank)
  (previous-line))

(global-set-key (kbd "C-d") 'select-word)
(defun select-word ()
  "Selects the current word."
  (interactive)
  (backward-word)
  (set-mark (point))
  (forward-word))

;; NEOTREE
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; NLINUM
(require 'nlinum)
(add-hook 'prog-mode-hook 'nlinum-mode)

(require 'all-the-icons)

;; PROJECTILE
(require 'projectile)
(projectile-global-mode)

;; MODE-LINE
(line-number-mode -1)
(defvar +modeline-height 29)
(defvar +modeline-bar-width 3)

;; Disable GUI stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; Open respective .h/.c(c/pp) file
(global-set-key (kbd "C-;") 'ff-find-other-file)
(global-set-key (kbd "C-'") 'find-other-file-other-window)

(defun find-other-file-other-window ()
  "Finds the corresponding file in another window."
  (interactive)
  (if (not (one-window-p))
      (delete-other-windows))
  (split-window-right)
  (other-window 1)
  (ff-find-other-file))

;; Enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Disable backup files
(setq make-backup-files nil)

;; Disable newline automatically added at end of file
(setq mode-require-final-newline nil)

;; 4 spaces instead of tabs
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(defun reload-config()
  "Reload emacs config."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun edit-config()
  "Edit emacs config."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (doom-molokai)))
 '(custom-safe-themes
   (quote
    ("227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" default)))
 '(ido-enable-flex-matching nil)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (rainbow-delimiters projectile all-the-icons-dired nlinum neotree multiple-cursors doom-themes org)))
 '(server-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 136 :width normal :foundry "outline" :family "Droid Sans Mono")))))
