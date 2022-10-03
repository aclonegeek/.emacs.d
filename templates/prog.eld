prog-mode

(todo "TODO: " :post (comment-region (line-beginning-position) (line-end-position)))
(todome "TODO(rtaylor): " :post (comment-region (line-beginning-position) (line-end-position)))
(fixme "FIXME: " :post (comment-region (line-beginning-position) (line-end-position)))
(fixmeme "FIXME(rtaylor): " :post (comment-region (line-beginning-position) (line-end-position)))
