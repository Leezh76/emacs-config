(require 'cli-refactor)
(use-package midje-mode
  :ensure t)
(define my-clj-refactor-mode-hook()
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))
(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'midje-mode)
  (add-hook 'clojure-mode-hook #'my-clj-refactor-mode-hook))

(use-package cider
  :ensure t
  :config
  (setq nrepl-popup))

(provide 'init-clojure)
