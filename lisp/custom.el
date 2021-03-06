;;custom-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(haskell-process-args-cabal-repl
   (quote
    ("--ghc-option=-ferror-spans -fshow-loaded-modules")))
 '(markdown-command
   "pandoc -f markdown -t html -s –mathjax –highlight-style pygments")
 '(org-pomodoro-length 40)
 '(package-selected-packages
   (quote
    (scheme-complete smex solarized-theme hungry-delete company)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 50))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
