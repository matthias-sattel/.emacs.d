;;(setq package-enable-at-startup nil)
;;(package-initialize)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))



;; Set up load path
(add-to-list 'load-path settings-dir)

;; Set up appearance early
;(require 'appearance)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango)))
 '(custom-safe-themes
   (quote
    ("9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (yaml-mode puppet-mode pretty-lambdada powerline org-projectile nyan-mode multiple-cursors moe-theme markdown-mode magit-find-file magit-filenotify helm-projectile helm-firefox flycheck-pos-tip expand-region company clojure-cheatsheet auto-complete adoc-mode))))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Setup packages
(require 'package)
(package-initialize)
(when (not (package-installed-p 'dash))
      (package-install 'dash))

(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(auto-complete
     async
     cider
     clojure-cheatsheet
     clojure-mode
     company
     ;;dash
     epl
     expand-region
     git-commit
     helm
     helm-core
     helm-firefox
     helm-projectile
     magit
     magit-filenotify
     magit-find-file
     magit-popup
     markdown-mode
     multiple-cursors
     org-projectile
     ;org-habit
     pkg-info
     pretty-lambdada
     projectile
     puppet-mode
     queue
     seq
     spinner
     with-editor
     ; appearance
     moe-theme
     ;leuven-theme
     nyan-mode
     powerline
     ; stuff to check out
     ;paredit
     ;move-text				
     ;gist
     ;htmlize
     ;visual-regexp
     ;; fill-column-indicator
     flycheck
     flycheck-pos-tip
     ;flycheck-clojure
     ;; flx
     ;; f
     ;; flx-ido
     ;; dired-details
     ;; css-eldoc
     ;; yasnippet
     ;; smartparens
     ;; ido-vertical-mode
     ;; ido-at-point
     ;; simple-httpd
     ;; guide-key
     ;; nodejs-repl
     ;; restclient
     ;; highlight-escape-sequences
     ;; whitespace-cleanup-mode
     ;; elisp-slime-nav
     ;; dockerfile-mode
     ;; clojure-mode
     ;; clojure-mode-extra-font-locking
     ;; groovy-mode
     ;; prodigy
     ;; cider
     ;; yesql-ghosts
					;string-edit
     adoc-mode
     yaml-mode
     org-jira
     powershell
     plantuml-mode

     ;; JavaScript support
     js2-mode
     js2-refactor
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(require 'customization)

(require 'setup-helm)

;org mode
(eval-after-load 'org '(require 'setup-org))

;plantuml mode
(require 'setup-plantuml)

;(require 'setup-org)

(eval-after-load 'flycheck '(require 'setup-flycheck))

(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))

;appearance
(require 'appearance)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'setup-jira)

(require 'setup-js2)

(setq next-line-add-newlines t)
