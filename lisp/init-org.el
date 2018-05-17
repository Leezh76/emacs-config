
(with-eval-after-load 'org
  (setq org-agenda-files '("~/Documents/learn_emacs/"))
  (setq org-src-fontify-natively t)
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/learn_emacs/GTD.org" "agenda")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))
  )




;; r aka remeber 
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
