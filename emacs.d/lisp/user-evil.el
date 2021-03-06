;;; user-evil --- Configuration for evil mode
;;; Commentary:

;;; Code:
(require 'dashboard)
(require 'evil)
(require 'comint)
(require 'persp-mode)


;; eyebrowse
;; (setq-default eyebrowse-new-workspace t)

;; doesn't work
;; (defun get-buffer-count (buf-name)
;;   "Count number of BUF-NAME visible across all workspaces."
;;   (let ((count 0)
;;         (window-list
;;          (mapcar (lambda (window) (cdr (cdr (car (cdr window))))) (eyebrowse--get 'window-configs))))
;;     (dolist (window window-list)
;;       (dolist (screen window count)
;;         (if (or (eq (car screen) 'leaf) (eq (car screen) 'buffer))
;;             (dolist (pair screen)
;;               (if (listp pair)
;;                   (if (and (eq (car pair) 'buffer) (string-equal (nth 1 pair) buf-name))
;;                       (setq count (+ count 1)))
;;                 (if (string-equal pair buf-name)
;;                     (setq count  (+ count 1))))))))
;;     count))

(defun minibuffer-keyboard-quit ()
  "Smart minibuffer quit function."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun smart-quit ()
  "My configuration on quitting windows."
  (interactive)
  (with-eval-after-load 'dashboard
    (if (not (string= "*dashboard*" (buffer-name)))
        (if (> (length (get-buffer-window-list (buffer-name))) 1)
            (remove-window)
          (progn
            (kill-buffer (get-buffer (buffer-name)))
            (evil-window-delete)))
      (if (> (length (get-buffer-window-list (buffer-name))) 1)
          (evil-window-delete)))))

(defun smart-delete ()
  "My configuration for deleting w indows."
  (interactive)
  (with-eval-after-load 'dashboard
    (if (eq (count-windows) 1)
        (switch-to-buffer "*dashboard*")
      (delete-window))))

;; (defun smart-tab ()
;;   "My configuration for creating a new eyebrowse window."
;;   (interactive)
;;   (eyebrowse-create-window-config)
;;   (switch-to-buffer "*dashboard*"))

(defun configure-evil ()
  "Evil Configuration."
  (evil-mode 1)
  (persp-mode 1)
  (evil-set-initial-state 'package-menu-mode 'motion)

  ;; general evil key setup
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "j") 'evil-next-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "k") 'evil-previous-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "$") 'evil-end-of-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "^") 'evil-beginning-of-visual-line)
  (evil-ex-define-cmd "q" 'smart-quit)
  (evil-ex-define-cmd "sb" 'bookmark-set)
  (evil-ex-define-cmd "db" 'bookmark-delete)
  (evil-ex-define-cmd "x" 'smart-delete)

  ;; single esc press to kill helm buffers
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (define-key package-menu-mode-map [escape] 'evil-delete-buffer)

  ;; evil key setup for package-mode
  (evil-define-key 'motion package-menu-mode-map
    "i" 'package-menu-mark-install
    "d" 'package-menu-mark-delete
    "u" 'package-menu-mark-upgrade
    "x" 'package-menu-execute
    "U" 'package-menu-mark-unmark)

  ;; evil key setup for neotree
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "<backtab>") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

  ;; for ielm, comint
  (define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
  (define-key comint-mode-map (kbd "<down>") 'comint-next-input)

  (define-key evil-normal-state-map "gt" 'persp-next)
  (define-key evil-normal-state-map "gT" 'persp-prev)
  (evil-ex-define-cmd "plist" 'persp-switch)
  (evil-ex-define-cmd "pnew" 'persp-add-new))

(with-eval-after-load "evil" (configure-evil))
(configure-evil)

(provide 'user-evil)

;;; user-evil.el ends here
