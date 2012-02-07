;; load path
(setq load-path (append
                 '("~/.emacs.d"
                   "~/.emacs.d/packages/builtin_packages"
		   "~/.emacs.d/packages/manual"
		   "~/.emacs.d/packages/auto_install"
		   )
                 load-path))

;; exec load path
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH"
	(concat '"/usr/local/bin:" (getenv "PATH")))

;; 
;; locale setting
(set-locale-environment nil)

;;; key bind
;; base
(define-key global-map (kbd "C-h") 'delete-backward-char) ; delete
(define-key global-map (kbd "M-?") 'help-for-help)        ; help
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; indent
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ;
;;(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; comment-out
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; goto-line

;;; grep
;; recursive grep
(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))

;;; Graphics
;; 
(auto-image-file-mode t)

;;; Bar
;; hide mebu bar
(menu-bar-mode -1)
;; hide tool bar
(tool-bar-mode -1)

;;; cursol
;; 
(blink-cursor-mode 0)

;;; eval
;; 
(setq eval-expression-print-length nil)

;;; {}()[]
;; show pair
(show-paren-mode 1)
;; 
(setq show-paren-style 'mixed)

;;; show whitespace space
;; show trailing whitespace 
;;(setq-default show-trailing-whitespace t)

;;; place
;; show palce
(global-hl-line-mode)
;; show column number
(column-number-mode t)
;; show line number
(line-number-mode t)
;; save place
(require 'saveplace)
(setq-default save-place t)

;;;
;; 
(setq kill-whole-line t)
;; 
(setq require-final-newline t)
;; 
(setq next-line-add-newlines nil)

;;; backup
;; backup inhibited
(setq backup-inhibited t)
;; delete auto save files
(setq delete-auto-save-files t)

;;; completion
;; ignore case
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 
(partial-completion-mode t)
;; 
(icomplete-mode 1)

;;; history
;; history length
(setq history-length 10000)
;; save mini-buffer history
(savehist-mode 1)
;; recent file max saved items
(setq recentf-max-saved-items 10000)

;;; compression
;; edit compression file
(auto-compression-mode t)

;;; diff
;; 
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diff option
(setq diff-switches '("-u" "-p" "-N"))

;;; directry
;; enable dired
(require 'dired-x)
;;
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; buffer name
;; buffer name + directry
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; emacs server
;; emacsclient
;; 2011-06-14
(server-start)

;;; more setting
;; buil-in packages
(load "config/builtins")

;; additional packages
(load "config/packages")
