;;specfic kbd
(global-set-key "\C-x\ \C-r" 'recentf-open-files) 
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-x") 'smex)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-key-binding (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "M-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
