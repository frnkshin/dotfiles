;;; languages --- languages configuration

;;; Commentary:
;;; Code:

(require 'flycheck)
(require 'company)
(require 'web-mode)
(require 'nvm)
(require 'rjsx-mode)

(defun setup-flycheck ()
  "Config for flycheck."
  ;; turn on flychecking globally
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers '(javascript-jshint)))
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  ;; customize flycheck temp file prefix
  (setq-default flycheck-temp-prefix ".flycheck")
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers '(json-jsonlist))))

(defun launch-company ()
  "Config for company."
  (add-hook 'after-init-hook 'global-company-mode)
  (eval-after-load 'company
    '(progn
       (define-key company-active-map (kbd "TAB") 'company-select-next)
       (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
       (define-key company-active-map [tab] 'company-select-next)))
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  (add-hook 'python-mode-hook 'anaconda-mode)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2))

(defun setup-web-mode ()
  "Config for web dev."
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-hook 'js2-mode-hook 'ac-js2-mode)
  (setq ac-js2-evaluate-calls t)
  (setq ac-js2-external-libraries '("~/dev/legilog/node_modules/propublica-congress-node/index.js")))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(defun become-multilingual ()
  (groovy-mode)                                  ; groovy-mode init

  (setq inferior-lisp-program "/usr/bin/sbcl")   ; slime for clisp
  (setq slime-contribs '(slime-fancy))
  (slime-setup '(slime-fancy slime-company)) ;; slime-fancy slime-company))
  (add-hook 'lisp-mode-hook
            (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook
            (lambda () (inferior-slime-mode t))))

(setup-flycheck)
(setup-web-mode)
(launch-company)
(become-multilingual)

(provide 'languages)
