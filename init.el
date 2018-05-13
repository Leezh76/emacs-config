(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-org)
(require 'init-keybindings)
(require 'init-better-defaults)
;;(require 'org)

(setq custom-file
      (expand-file-name
       "lisp/custom.el"
       user-emacs-directory))

(load-file custom-file)
