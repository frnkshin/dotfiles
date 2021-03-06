;;; package --- summary

;;; Commentary:
;; init.el that is run first to initialize my Emacs configuration

;;; Code:

;; initialize melpa and package
(defun sys-config/melpa ()
  "Set up system package manager."
  (require 'package)
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
         (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
    (add-to-list 'package-archives (cons "melpa" url) t))
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize))

(defvar base-dir)
(defun user-config/dependencies ()
  "Set up user defendency settings."
  ;; Create base directory for user *.el files
  (setq base-dir (expand-file-name "/home/amuro/.emacs.d/lisp" user-emacs-directory))

  ;; Create location for custom.el
  (setq custom-file (expand-file-name "/home/amuro/.emacs.d/custom.el" user-emacs-directory))
  (load custom-file)

  ;; Add base directory to the load-path
  (add-to-list 'load-path base-dir)

  ;; Require modese
  (require 'user-helm)
  (require 'user-shackle)
  (require 'user-whichkeys)
  (require 'user-evil-leaders)
  (require 'user-evil)
  (require 'visual)
  (require 'org-indent)
  (require 'languages))

(defun user-config/variables ()
  "Set up user variables."
  ;; Hide startup screen, t: inhibit, nil: un-inhibit
  (setq inhibit-startup-screen t)
  ;; Select tabs/spaces for indents, t: tabs, nil: spaces
  (setq-default indent-tabs-mode nil) ; use spaces
  ;; Set tab width, num: number of spaces
  (setq-default tab-width 4)
  ;; Hide menubar, -1
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  ;; Hide toolbar, -1
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  ;; Hide scroolbar, -1
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  ;; Create a directory for backup files
  (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
        backup-by-copying t
        version-control t
        delete-old-versions t
        kept-new-versions 20
        kept-old-versions 5))

(defun run ()
  "Main init function."
  (sys-config/melpa)
  (user-config/dependencies)
  (user-config/variables))

(run)

;;; init.el ends here
