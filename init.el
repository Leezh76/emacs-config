;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)

(setq ring-bell-function 'ignore)


(define-abbrev-table 'global-abbrev-table '(;;signature
					    ("lee" "leezh")
					    ;;emacs regex
					    ))

(setq cursor-type 'bar)
(setq inhibit-splash-screen 1)
(setq make-backup-files nil)
(setq auto-save-default nil)


(set-face-attribute 'default nil :height 140)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(require 'recentf)
(recentf-mode 1)

(require 'org)
(setq org-src-fontify-natively t)

;;specfic kbd
(global-set-key "\C-x\ \C-r" 'recentf-open-files) 
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;;show paren

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(global-auto-revert-mode t)
(abbrev-mode t)
(delete-selection-mode t)
(global-hl-line-mode t)

;;custom-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (scheme-complete smex solarized-theme hungry-delete company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
