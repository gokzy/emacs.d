(require 'package)

;;; grep-edit
;; 
(add-hook 'grep-setup-hook
          (lambda ()
            (define-key grep-mode-map (kbd "C-c C-c") 'grep-edit-finish-edit)))

;;; Auto Complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (format "%s/auto-complete/dict" package-base-dir))
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))

;;; GTAGS
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-path-style 'relative)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag )
         (local-set-key "\M-r" 'gtags-find-rtag )
         (local-set-key "\M-s" 'gtags-find-symbol )
         (define-key global-map "\M-p" 'gtags-pop-stack )
         ))

(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))


;; auto-install
;;(load "config/packages/auto-install.el")

;; anything.el
(load "config/packages/anything.el")
