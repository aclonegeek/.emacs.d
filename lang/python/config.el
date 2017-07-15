(defun python-fn-docstring ()
  "Automatically insert a function docstring."
  (interactive)
  (insert "    \"\"\"Summary goes here.\n\n")
  (insert "    :Parameters:\n")
  (insert "      - `parameter`: type. what.\n\n")
  (insert "    :return: type. what.\n")
  (insert "    :raises something.Error: what/why\n\n")
  (insert "    \"\"\""))



(provide 'config)
