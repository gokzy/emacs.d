(require 'cl)

(setq load-path (append
                 '(
		   "~/.emacs.d/packages/manual"
		   )
                 load-path))

(defvar package-base-dir "~/.emacs.d/packages/manual")

(defun package-path-basename (path)
  (file-name-sans-extension (file-name-nondirectory path)))

(defun package-directory (files)
  (concat package-base-dir "/"
          (package-path-basename (car files))))

(provide 'manual_package)
