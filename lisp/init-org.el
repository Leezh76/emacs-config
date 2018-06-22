
(with-eval-after-load 'org
  (setq org-agenda-files '("~/Documents/learn_emacs/"))
  (setq org-src-fontify-natively t)
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/learn_emacs/GTD.org" "agenda")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))
  )

;; (org-babel-do-load-languages
;;     (quote org-babel-load-languages)
;;     (quote
;;         (
;;             (emacs-lisp . t)
;;             (java . t)
;;             (dot . t)
;;             (ditaa . t)
;;             (R . t)
;;             (python . t)
;;             (ruby . t)
;;             (gnuplot . t)
;;             (clojure . t)
;;             (sh . t)
;;             (ledger . t)
;;             (org . t)
;;             (plantuml . t)
;;             (latex . t)
;;         )
;;     )
;; )


;; r aka remeber 
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
