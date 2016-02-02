;org mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org_archive$" . org-mode))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;(require 'org-habit)
;(require 'org-helpers)
;(require 'org-pomodoro)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-directory (if (boundp 'user-org-dir)
			user-org-dir
		      "~/Documents/Org"))
(setq org-agenda-files (list (if (boundp 'user-org-agenda-dir)
				  user-org-agenda-dir
				"~/Documents/Org")))
;(setq org-agenda-files (list "c:/dev/org/Improvements.org"
;			     ))

(define-key global-map (kbd "M-<f6>") 'org-capture)

(provide 'setup-org)
