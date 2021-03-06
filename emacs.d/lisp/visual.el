;;; visual --- my visual configuration

;;; Commentary:
;;; Code:


(require 'rainbow-delimiters)
(require 'rainbow-identifiers)
(require 'spaceline-config)
(require 'dashboard)
(require 'winum)
(require 'neotree)
(require 'sublimity)

;; configuration for basic theme
(defun configure ()
  "Main configuration function."

  ;; general ui
  (load-theme 'gruvbox t)
  (set-face-attribute 'default nil :font "Source Code Pro-10" )
  (set-frame-font "Source Code Pro-10" nil t)
  (setq visual-bell nil)
  (setq ring-bell-function (lambda ()
                             (invert-face 'mode-line)
                             (run-with-timer 0.05 nil 'invert-face 'mode-line)))

                                        ; modeline using spaceline
  (spaceline-spacemacs-theme)
  ;; (eyebrowse-mode t)
  (setq winum-auto-setup-mode-line nil)
  (winum-mode)

  ;; neotree
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size t)
  (setq neo-window-width 30)

  ;; home screen dashboard
  (with-eval-after-load 'projectile
    (page-break-lines-mode 1))
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  (setq dashboard-startup-banner 'logo)

  ;; editor
  (global-linum-mode 1)
  (global-visual-line-mode nil)

  (rainbow-delimiters-mode)
  (rainbow-identifiers-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

  ;; sublimity
  (sublimity-mode 1)

  ;; set-up indents
  (add-hook 'lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'css-mode-hook #'aggressive-indent-mode))

(configure)

(provide 'visual)

;;; visual.el ends here
