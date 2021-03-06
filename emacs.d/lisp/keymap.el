;;; keymap.el --- This contains all the short-cut functions.

;;; Commentary:
;; 

(require 'evil-leader)
(require 'which-key)


;;; Code:

(defun show-home ()
  (interactive)
  (switch-to-buffer "*dashboard*")
  (dashboard-refresh-buffer))

(defun smart-split-window-right ()
  (interactive)
  (progn
    (split-window-right)))
;;(balance-windows)))

(defun smart-split-window-below ()
  (interactive)
  (progn
    (split-window-below)))

(defun smart-split-window-right-and-focus ()
  (interactive)
  (progn
    (smart-split-window-right)
    (other-window 1)))

(defun smart-split-window-below-and-focus ()
  (interactive)
  (progn
    (smart-split-window-below)
    (other-window 1)))

(defun minibuffer-keyboard-quit ()
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun zoom-frame ()
  (interactive)
  (progn
    (toggle-zoom-frame)
    (zoom-in/out)))

;; if two same buffers are open, close window only
(defun smart-quit ()
  (interactive)
  (with-eval-after-load 'dashboard
    (if (not (string= "*dashboard*" (buffer-name)))
        (if (> winum--window-count 1)
            (progn
              (kill-buffer (get-buffer (buffer-name)))
              (evil-window-delete))
          (progn
            (kill-buffer (get-buffer (buffer-name)))
            (dashboard-refresh-buffer)))
      (progn
        (evil-window-delete)))))

(defun elect-leaders ()
  (global-evil-leader-mode 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "?"  'helm-M-x
    "1"  'winum-select-window-1
    "2"  'winum-select-window-2
    "3"  'winum-select-window-3
    "4"  'winum-select-window-4
    "5"  'winum-select-window-5
    "6"  'winum-select-window-6
    "7"  'winum-select-window-7
    "8"  'winum-select-window-8
    "9"  'winum-select-window-9

    "qq" 'save-buffers-kill-emacs
    "qr" 'restart-emacs

    "ff" 'helm-find-files
    "fr" 'helm-recentf
    "bb" 'helm-buffers-list

    "pp" 'list-packages
    "bh" 'show-home

    "tt" 'neotree

    "<ESC>" 'keyboard-quit
    "TAB" 'bs-cycle-next
    "<backtab>" 'bs-cycle-previous

    "zf" 'zoom-frame

    "wv" 'smart-split-window-right
    "ws" 'smart-split-window-below
    "wV" 'smart-split-window-right-and-focus
    "wS" 'smart-split-window-below-and-focus))

(which-key-declare-prefixes "SPC w" "window")
(which-key-declare-prefixes "SPC b" "buffer")
(which-key-declare-prefixes "SPC f" "file")
(which-key-declare-prefixes "SPC p" "packages")
(which-key-declare-prefixes "SPC z" "zoom")
(which-key-declare-prefixes "SPC q" "power")

(defun configure-evil ()
  (evil-mode 1)
  (evil-set-initial-state 'package-menu-mode 'motion)

  ;; general evil key setup
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "j") 'evil-next-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "k") 'evil-previous-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "$") 'evil-end-of-visual-line)
  (evil-define-minor-mode-key 'normal 'visual-line-mode (kbd "^") 'evil-beginning-of-visual-line)
  (evil-ex-define-cmd "q" 'smart-quit)
  (evil-ex-define-cmd "sb" 'bookmark-set)
  (evil-ex-define-cmd "db" 'bookmark-delete)

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
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))


(with-eval-after-load "evil" (configure-evil))

(provide 'keymap)

(provide 'keymap)

;;; keymap.el ends here
