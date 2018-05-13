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
		 popwin
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

(require 'hungry-delete)
(global-hungry-delete-mode t)

(require 'smex)
(smex-initialize)

(load-theme 'solarized-light t)

;;(require 'smartparens-config)
;;autoload don't need to require
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(require 'window-numbering)
(window-numbering-mode t)

;;config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'popwin)
(popwin-mode t)

(require 'paredit)
(add-hook 'scheme-mode-hook (lambda () (paredit-mode 1)))

(global-company-mode 1)


(provide 'init-packages)
