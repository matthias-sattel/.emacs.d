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
	("t" "Tutorial" entry (file+headline "~/Documents/Org/notes.org" "Tutorial")
	 "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n*** Beschreibung\n "
	 )
	("b" "Bookmark" entry (file+headline "~/Documents/Org/notes.org" "Bookmarks")
	 "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)
;	("s" "System" entry (file+headline "~/Documents/Org/adesso.org" "System")
;	 "* %?\n:Beschreibung:\n:Hostname:\n:IP:\n:Anmeldedaten:\n:END:\n\n" :empty-lines 1)
	("a" "Aufgabe" entry (file+headline "~/Documents/Org/gtd.org" "Inbox")
	 "* TODO %?")
	("z" "Zeiteintrag in gtd.org" entry (file+headline "~/Documents/Org/gtd.org" "Inbox")
	 "* ZKTO %? \n  %i" :clock-in t :clock-resume t)
	("j" "Journal" entry (file+datetree "~/Documents/Org/journal.org")
	 "* %?\nEntered on %U\n  %i")
	("p" "Projekt" entry (file+headline "~/Documents/Org/notes.org" "Projekte")
	 "** %?")
	("f" "Frage" entry (file+headline "~/Documents/Org/notes.org" "FAQ")
	 "** %?")
	("s" "Schulung" entry (file+headline "~/Documents/Org/notes.org" "Schulung")
	 "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n :empty-lines 1 \n*** Auftraggeber\n*** Ziel (gesamt)\n*** Termin(e)\n*** Teilnehmer\n*** Agenda (gesamt)\n*** Material: Sammlung aller Materialien\n*** Vorraussetzungen\n*** Ablaufplan (kann auch mehrere Termine umfassen)\n**** Hallo :-)\n**** Ziel\n**** Agenda vorstellen (Teilagenda)\n**** Arbeitsschritte\n***** Ziel/Fragestellung\n***** Vorraussetzungen/Abhängigkeiten\n***** Anleitung, evtl. mit Beispiel\n***** Abschluß\n**** Fragerunde\n**** Review/Abschluss"
	 )
	)
      )

;(setq org-tag-alist '((:startgrouptag)
;		      ("Adesso")
;		      (:grouptags)
;		      ("PSLife")
;		      ("Insure")
;		      (:endgrouptag)
;		      (:startgroup)
;		      ("PSLife")
;		      (:grouptags)
;		      ("Bestand")
;		      ("Debeka")
;		      (:endgroup)))
;
					;(add-to-list 'org-agenda-custom-commands
					;             '("W" "Weekly review"
					;               agenda ""
					;               ((org-agenda-span 'week)
					;                (org-agenda-start-on-weekday 0)
					;                (org-agenda-start-with-log-mode t)
					;                (org-agenda-skip-function
					;                 '(org-agenda-skip-entry-if 'nottodo 'done))
					;                 )))
					;
(provide 'setup-org)
