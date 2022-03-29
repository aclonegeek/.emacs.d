;;; colourful-darkness-theme.el --- Colourful-Darkness theme -*- lexical-binding: t; -*-

;; Copyright (C) 2021-2022 Randy Taylor

;; Author: Randy Taylor
;; URL: https://git.sr.ht/~randy/.emacs.d/tree/master/item/lisp/colourful-darkness-theme.el
;; Version: 0.0.1

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;; A theme of colourful darkness.

;;; Code:

;; Highlight operators.
(defface font-lock-operator-face
  '((t (:inherit default)))
  "Basic face for operator."
  :group 'basic-faces)

(let ((operators
       '((c-mode      "[+=*/&|~^<>!?-]")
         (c++-mode    "[+=*/&|~^<>!?-]")
         (rust-mode   "[+=*/&|~^<>!?-]")
         (python-mode "[+=*/&|~^<>!?-]")
         (js-mode     "[+=*/&|~^<>!?-]")
         )))
  (dolist (o operators)
    (font-lock-add-keywords
     (car o)
     `((,(cadr o) 0 'font-lock-operator-face)))))

(deftheme colourful-darkness)
(let* ((black   "#000000")
      (white   "#ffffff")
      (red     "#ff0000")
      (green   "#00ff00")
      (yellow  "#ebc930")
      (magenta "#ff00ff")
      (cyan    "#00ffff")
      (bluish  "#5f00ff")
      (orange  "#fc7f00")
      (gray    "#bebebe")
      (dark-gray "#222222")

      (dark-green "#008000")
      (dark-red   "#800000"))

  (custom-theme-set-faces
   'colourful-darkness
   `(default                                  ((t (:background ,black :foreground ,white))))

   `(cursor                                   ((t (:background ,white))))
   `(region                                   ((t (:inverse-video t))))
   `(highlight                                ((t (:foreground ,black :background ,cyan))))
   `(hl-line                                  ((t (:background ,black))))
   `(fringe                                   ((t (:foreground ,white :background ,black))))
   `(show-paren-match-face                    ((t (:background ,yellow))))
   `(show-paren-match                         ((t (:foreground ,white :background ,cyan :bold t))))
   `(show-paren-mismatch                      ((t (:background ,yellow))))
   `(isearch                                  ((t (:foreground ,black :background ,yellow))))
   `(lazy-highlight                           ((t (:foreground ,black :background ,yellow))))
   `(vertical-border                          ((t (:foreground ,gray))))
   `(minibuffer-prompt                        ((t (:foreground ,white :weight normal))))
   `(default-italic                           ((t (:italic t))))
   `(link                                     ((t (:foreground ,cyan :underline t))))
   `(error                                    ((t (:foreground ,red))))
   `(yellow                                   ((t (:foreground ,yellow))))
   `(success                                  ((t (:foreground ,green))))
   `(line-number                              ((t (:foreground ,yellow :background ,black))))
   `(line-number-current-line                 ((t (:foreground ,yellow :background ,black))))
   `(trailing-whitespace                      ((t (:foreground nil :background ,yellow))))

   `(ffap                                     ((t (:foreground ,white))))

   `(mode-line                                ((t (:foreground ,white :background ,black))))
   `(mode-line-inactive                       ((t (:foreground ,white :background ,black))))
   `(mode-line-buffer-id                      ((t (:foreground ,white :background nil))))
   `(mode-line-highlight                      ((t (:foreground ,yellow :box nil :weight normal))))
   `(mode-line-emphasis                       ((t (:foreground ,white))))

   `(font-lock-preprocessor-face              ((t (:foreground ,bluish))))
   `(font-lock-builtin-face                   ((t (:foreground ,cyan))))
   `(font-lock-comment-face                   ((t (:foreground ,cyan))))
   `(font-lock-operator-face                  ((t (:foreground ,yellow))))
   `(font-lock-negation-char-face             ((t (:foreground ,magenta))))
   `(font-lock-reference-face                 ((t (:foreground ,magenta))))
   `(font-lock-constant-face                  ((t (:foreground ,magenta))))
   `(font-lock-doc-face                       ((t (:foreground ,red))))
   `(font-lock-function-name-face             ((t (:foreground ,cyan :bold nil))))
   `(font-lock-keyword-face                   ((t (:bold nil :foreground ,yellow))))
   `(font-lock-string-face                    ((t (:foreground ,magenta))))
   `(font-lock-type-face                      ((t (:foreground ,green))))
   `(font-lock-variable-name-face             ((t (:foreground ,white))))
   `(font-lock-yellow-face                    ((t (:foreground ,yellow :background ,black))))
   `(font-lock-regexp-grouping-backslash      ((t (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct      ((t (:foreground ,yellow))))

   `(dired-directory                          ((t (:inherit font-lock-keyword-face))))

   `(company-preview-common                   ((t (:foreground ,yellow :background ,black))))
   `(company-scrollbar-thumb                  ((t (:background ,black))))
   `(company-scrollbar-track                  ((t (:background ,black))))
   `(company-tooltip                          ((t (:background ,black))))
   `(company-tooltip-common                   ((t (:bold t :foreground ,yellow))))
   `(company-tooltip-deprecated               ((t (:strike-through t))))
   `(company-tooltip-selection                ((t (:bold t :foreground ,white :background ,dark-gray))))
   `(company-tooltip-annotation               ((t (:foreground ,orange))))
   `(company-tooltip-annotation-selection     ((t (:bold t :foreground ,green))))

   `(completions-annotations                  ((t (:bold t :foreground ,yellow))))
   `(completions-common-part                  ((t (:foreground ,yellow))))

   `(icomplete-selected-match                 ((t (:background ,black))))

   `(org-document-title                       ((t (:bold t :foreground ,green :height 1.2))))
   `(org-level-1                              ((t (:bold t :foreground ,cyan :height 1.1))))
   `(org-level-2                              ((t (:bold t :foreground ,green))))
   `(org-level-3                              ((t (:bold t :foreground ,magenta))))
   `(org-level-4                              ((t (:bold t :foreground ,red))))
   `(org-level-5                              ((t (:bold t :foreground ,yellow))))
   `(org-code                                 ((t (:inherit link))))
   `(org-hide                                 ((t (:foreground ,white))))
   `(org-date                                 ((t (:underline t :foreground ,white))))
   `(org-footnote                             ((t (:underline t :foreground ,white))))
   `(org-link                                 ((t (:underline t :foreground ,white))))
   `(org-special-keyword                      ((t (:foreground ,yellow))))
   `(org-block                                ((t (:foreground ,white :background ,black :extend t))))
   `(org-quote                                ((t (:inherit org-block :slant italic))))
   `(org-verse                                ((t (:inherit org-block :slant italic))))
   `(org-todo                                 ((t (:box (:line-width 1 :color ,red) :foreground ,red :bold nil))))
   `(org-done                                 ((t (:box (:line-width 1 :color ,green) :foreground ,green :bold nil))))
   `(org-yellow                               ((t (:underline t :foreground ,yellow))))
   `(org-scheduled                            ((t (:foreground ,green))))
   `(org-scheduled-today                      ((t (:foreground ,cyan :weight normal :height 1.2))))
   `(org-ellipsis                             ((t (:foreground ,white))))
   `(org-verbatim                             ((t (:foreground ,white))))
   `(org-document-info-keyword                ((t (:foreground ,green))))
   `(org-sexp-date                            ((t (:foreground ,white))))
   `(org-table                                ((t (:foreground ,white :background ,black))))

   ;; bisect
   `(magit-bisect-bad                         ((t (:foreground ,red))))
   `(magit-bisect-good                        ((t (:foreground ,green))))
   `(magit-bisect-skip                        ((t (:foreground ,yellow))))
   ;; blame
   `(magit-blame-date                         ((t (:foreground ,orange))))
   `(magit-blame-heading                      ((t (:foreground ,yellow :background ,black :extend t))))
   ;; branch
   `(magit-branch                             ((t (:foreground ,cyan :weight normal))))
   `(magit-branch-current                     ((t (:foreground ,cyan))))
   `(magit-branch-local                       ((t (:foreground ,cyan))))
   `(magit-branch-remote                      ((t (:foreground ,green))))
   `(magit-cherry-equivalent                  ((t (:foreground ,magenta))))
   `(magit-cherry-unmatched                   ((t (:foreground ,orange))))
   ;; diff
   `(magit-diff-added                         ((t (:foreground ,white :background ,dark-green))))
   `(magit-diff-added-highlight               ((t (:foreground ,white :background ,dark-green))))
   `(magit-diff-removed                       ((t (:foreground ,white :background ,dark-red))))
   `(magit-diff-removed-highlight             ((t (:foreground ,white :background ,dark-red))))
   `(magit-diff-base                          ((t (:foreground ,black :background ,orange :extend t))))
   `(magit-diff-base-highlight                ((t (:foreground ,orange :background ,black :extend t))))
   `(magit-diff-context                       ((t (:foreground ,white :extend t))))
   `(magit-diff-context-highlight             ((t (:foreground ,white :background ,black))))
   `(magit-diff-file-header                   ((t (:foreground ,white :background ,black))))
   `(magit-diff-file-heading                  ((t (:bold t :foreground ,yellow))))
   `(magit-diff-file-heading-highlight        ((t (:background ,black))))
   `(magit-diff-file-heading-selection        ((t (:background ,black))))
   `(magit-diff-hunk-heading                  ((t (:foreground ,yellow :background ,black))))
   `(magit-diff-hunk-heading-highlight        ((t (:background ,black))))
   `(magit-diff-lines-heading                 ((t (:foreground ,yellow :background ,red :extend t))))
   `(magit-diffstat-added                     ((t (:foreground ,green))))
   `(magit-diffstat-removed                   ((t (:foreground ,red))))
   `(magit-dimmed                             ((t (:foreground ,cyan))))
   `(magit-filename                           ((t (:foreground ,magenta))))
   `(magit-hash                               ((t (:foreground ,cyan))))
   `(magit-header-line                        ((t (:inherit nil))))
   ;; hunk
   `(magit-hunk-heading                       ((t (:background ,yellow))))
   `(magit-hunk-heading-highlight             ((t (:background ,yellow))))
   ;; log
   `(magit-log-author                         ((t (:foreground ,yellow))))
   `(magit-log-date                           ((t (:foreground ,white))))
   `(magit-log-graph                          ((t (:foreground ,cyan))))
   ;; process
   `(magit-mode-line-process                  ((t (:foreground ,orange))))
   `(magit-mode-line-process-error            ((t (:foreground ,red))))
   `(magit-process-ok                         ((t (:inherit success))))
   `(magit-process-ng                         ((t (:inherit error))))
   ;; reflog
   `(magit-reflog-amend                       ((t (:foreground ,magenta))))
   `(magit-reflog-checkout                    ((t (:foreground ,cyan))))
   `(magit-reflog-cherry-pick                 ((t (:foreground ,green))))
   `(magit-reflog-commit                      ((t (:foreground ,green))))
   `(magit-reflog-merge                       ((t (:foreground ,green))))
   `(magit-reflog-other                       ((t (:foreground ,cyan))))
   `(magit-reflog-rebase                      ((t (:foreground ,magenta))))
   `(magit-reflog-remote                      ((t (:foreground ,cyan))))
   `(magit-reflog-reset                       ((t (:inherit error))))
   `(magit-refname                            ((t (:foreground ,cyan))))
   `(magit-section-heading                    ((t (:foreground ,magenta))))
   `(magit-section-heading-selection          ((t (:foreground ,orange :extend t))))
   `(magit-section-highlight                  ((t (:background ,black :extend t))))
   ;; sequence
   `(magit-sequence-drop                      ((t (:foreground ,red))))
   `(magit-sequence-head                      ((t (:foreground ,cyan))))
   `(magit-sequence-part                      ((t (:foreground ,yellow))))
   `(magit-sequence-stop                      ((t (:foreground ,green))))
   ;; signature
   `(magit-signature-bad                      ((t (:inherit error))))
   `(magit-signature-error                    ((t (:inherit error))))
   `(magit-signature-expired                  ((t (:foreground ,orange))))
   `(magit-signature-good                     ((t (:inherit success))))
   `(magit-signature-revoked                  ((t (:foreground ,magenta))))
   `(magit-signature-untrusted                ((t (:foreground ,yellow))))
   ;; tag
   `(magit-tag                                ((t (:foreground ,orange))))

   ;; tree-sitter
   `(tree-sitter-hl-face:property             ((t (:inherit font-lock-variable-name-face))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'colourful-darkness)

;;; colourful-darkness-theme.el ends here
