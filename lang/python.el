(defun python-fn-docstring ()
  "Automatically insert a function docstring."
  (interactive)
  (insert "    \"\"\"Summary goes here.\n\n")
  (insert "    :Parameters:\n")
  (insert "      - `parameter`: type. what.\n\n")
  (insert "    :return: type. what.\n")
  (insert "    :raises something.Error: what/why\n\n")
  (insert "    \"\"\""))

(setq-default flycheck-disabled-checkers '(python-flake8))
(add-hook 'python-mode-hook (lambda ()
                              (flycheck-mode 1)
                              (semantic-mode 1)
                              (setq flycheck-checker 'python-pylint
                                    flycheck-checker-error-threshold 400
                                    flycheck-pylintrc "C:/Users/rtaylor/.pylintrc")))
(setq python-check-command "pylint")
