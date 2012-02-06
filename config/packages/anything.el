(require 'anything)
(require 'anything-startup)
(define-key global-map (kbd "C-c ;") 'anything)

(require 'anything-gtags)
(define-key global-map (kbd "C-x t")
  (lambda ()
    "Tag jump using gtags and `anything'."
    (interactive)
    (let* ((initial-pattern (regexp-quote (or (thing-at-point 'symbol) ""))))
      (anything (list anything-c-source-gtags-select
                      ))
      "Find Tag: " nil)))
