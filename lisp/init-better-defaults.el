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

(provide 'init-better-defaults)
