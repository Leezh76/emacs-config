(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table
  '(;;signature
    ("lee" "leezh")
    ;;emacs regex
    ))
(delete-selection-mode t)
(global-hl-line-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
;;(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;;show paren

;;indent buffer
(defun ident-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning)
  			 (region-end)))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
;;(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(provide 'init-better-defaults)
