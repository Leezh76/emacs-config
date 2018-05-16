(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("./org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/learn_emacs/GTD.org" "agenda")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;; r aka remeber 
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
