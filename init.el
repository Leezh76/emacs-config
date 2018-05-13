;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;;(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
  ;;			   ("melpa" . "https://elpa.emacs-china.org/melpa/"))))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
(require 'cl)
;;add package here
(defvar my/pkgs '(
		 company
		 solarized-theme
		 hungry-delete
		 smex
		 smartparens
		 js2-mode
		 nodejs-repl
		 exec-path-from-shell
		 window-numbering
		 paredit
		 ) "Default packages")
(setq packages-selected-packages 'my/pkgs)
(defun my/pkg-installed-p()
  (loop for pkg in my/pkgs
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (my/pkg-installed-p)
  (message "%s" "Refreshing packages database...")
  (package-refresh-contents)
  (dolist (pkg my/pkgs)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;enable emacs to exec the shell commands
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(global-auto-revert-mode t)

(load-theme 'solarized-light t)

(setq cursor-type 'bar)
(setq inhibit-splash-screen 1)
(setq make-backup-files nil)
(setq auto-save-default nil)

(delete-selection-mode t)
(global-hl-line-mode t)
(set-face-attribute 'default nil :height 140)
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(require 'hungry-delete)
(global-hungry-delete-mode t)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(require 'window-numbering)
(window-numbering-mode t)

;;config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)

;;;my settings
(require 'paredit)
(add-hook 'scheme-mode-hook (lambda ()(paredit-mode 1)))
;;my settings

;;specfic kbd
(global-set-key "\C-x\ \C-r" 'recentf-open-files) 
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;;show paren

;;language
(global-company-mode 1)

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
