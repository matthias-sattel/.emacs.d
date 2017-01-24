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

(setq org-log-done t)

(setq org-capture-templates
      '(
	("a" "Anleitung" entry (file+headline "~/Documents/Org/wissen.org" "Anleitung")
	 "* %?\nBeschreibung:\nErstellt am %U\n\n" :empty-lines 1)
	("b" "Bookmark" entry (file+headline "~/Documents/Org/notes.org" "Bookmarks")
	 "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)
	("s" "System" entry (file+headline "~/Documents/Org/adesso.org" "System")
	 "* %?\n:Beschreibung:\n:Hostname:\n:IP:\n:Anmeldedaten:\n:END:\n\n" :empty-lines 1)
	("t" "Aufgabe" entry (file+headline "~/Documents/Org/gtd.org" "Inbox")
	 "* TODO %?")
	("z" "Zeiteintrag in gtd.org" entry (file+headline "~/Documents/Org/gtd.org" "Inbox")
	 "* ZKTO %? \n  %i" :clock-in t :clock-resume t)
	("j" "Journal" entry (file+datetree "~/Documents/Org/journal.org")
	 "* %?\nEntered on %U\n  %i")
	)
      )

(provide 'setup-org)
