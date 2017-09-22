;; setting jar path for plantuml
(setq plantuml-jar-path
      "~/Dev/Tools/PlantUML/plantuml.jar")
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

;; integration to org mode
(add-to-list
  'org-src-lang-modes '("plantuml" . plantuml))

(provide 'setup-plantuml)
