;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

(setq package-list '(async
                     cider
                     cl-lib
                     clojure-mode
                     clojure-mode-extra-font-locking
                     dash
                     epl
                     evil
                     evil-escape
                     evil-leader
                     evil-nerd-commenter
                     exec-path-from-shell
                     git-commit
                     goto-chg
                     helm
                     ido-completing-read+
                     ido-ubiquitous
                     magit
                     magit-popup
                     paredit
                     pkg-info
                     projectile
                     queue
                     rainbow-delimiters
                     s
                     seq
                     smex
                     spinner
                     tagedit
                     undo-tree
                     which-key
                     with-editor))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Fetch available package list
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; For leader key
(load "evil-leader-cust.el")
;; For evil
(load "evil-mode-cust.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

;; Load which-key
(load "which-key-cust.el")

(evil-escape-mode)
