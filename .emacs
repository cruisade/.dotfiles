(package-initialize)

; :binds
(global-set-key (kbd "C-w") 'backward-kill-word)


; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)


; :packages
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-to-list 'load-path "~/.emacs.d/package-sources/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
