(require 'cl)

(setq load-path (append
                 '(
		   "~/.emacs.d/packages/builtin_packages/auto-complete"
		   "~/.emacs.d/packages/builtin_packages/anything"
		   "~/.emacs.d/packages/builtin_packages/grep-edit"
		   )
                 load-path))

(defvar package-base-dir "~/.emacs.d/packages/builtin_packages")

(defun package-path-basename (path)
  (file-name-sans-extension (file-name-nondirectory path)))

(defun package-directory (files)
  (concat package-base-dir "/"
          (package-path-basename (car files))))

(provide 'package)
