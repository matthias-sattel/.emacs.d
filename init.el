(package-initialize)

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
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

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
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(async
     cider
     clojure-cheatsheet
     clojure-mode
     company
     dash
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
     pkg-info
     pretty-lambdada
     projectile
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
     ;; flycheck
     ;; flycheck-pos-tip
     ;; flycheck-clojure
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
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(require 'customization)

;appearance
(require 'appearance)
