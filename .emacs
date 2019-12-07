; setup OrgMode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(define-key global-map "\C-n" 'org-insert-todo-heading)
(define-key global-map "\C-t" 'org-todo)

; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
