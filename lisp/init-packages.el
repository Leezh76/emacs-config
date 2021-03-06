(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;;(setq package-archives '(("gnu" . "https://elpa.emacs-china.org/gnu/")
  ;;			   ("melpa" . "https://elpa.emacs-china.org/melpa/"))))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  ;;(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
  )

(require 'cl)
;;add package here
(defvar my/pkgs '(
		  company
		  use-package
		  solarized-theme
		  hungry-delete
		  smex
		  smartparens
		  js2-mode
		  js2-refactor
		  nodejs-repl
		  exec-path-from-shell
		  window-numbering
		  paredit
		  popwin
		  counsel
		  web-mode
		  expand-region
		  iedit
		  helm-ag
		  flycheck
		  ivy
		  company-flx
		  origami
		  ;;latex
		  auctex
		  cdlatex
		  ;;scheme
		  geiser
		  ;;dot
		  graphviz-dot-mode
		  ;;haskell
		  haskell-mode
		  ;;clojure
		  clojure-mode
		  4clojure
		  ;;markdoen
		  markdown-mode
		  ;;io
		  io-mode
		  ;;scala
		  scala-mode
		  ;;erlang
		  erlang
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
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(require 'window-numbering)
(window-numbering-mode t)

(require 'popwin)
(popwin-mode t)

(require 'paredit)
(add-hook 'scheme-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))

(global-company-mode 1)
(with-eval-after-load 'company
  (company-flx-mode +1))

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.dot\\'" . graphviz-dot-mode)
	 ("\\.hs\\'" . haskell-mode))
       auto-mode-alist))

;; config for web mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)

;;(global-set-key (kbd "M-s e") 'iedit-mode)

(add-hook 'js2-mode 'flycheck-mode)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(require 'origami)
;;(global-origami-mode 1)

(provide 'init-packages)
