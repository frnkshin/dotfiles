;;; user-evil-leaders --- configuration for evil-leaders mode
;;; COmmentary:

;;; Code:

(require 'evil-leader)
(require 'persp-mode)
(require 'winner)

(defun show-home ()
  "Custom function to show home buffer."
  (interactive)
  ;; (dashboard-refresh-buffer)
  (switch-to-buffer "*dashboard*"))

(defun split-window-vertical ()
  "Custom function to split window."
  (interactive)
  (progn
    (split-window-horizontally)
    (balance-windows)))

(defun split-window-vertical-and-focus ()
  "Custom function to split window."
  (interactive)
  (progn
    (split-window-horizontally)
    (balance-windows)
    (other-window 1)))

(defun split-window-horizontal ()
  "Custom function to split window."
  (interactive)
  (progn
    (split-window-vertically)
    (balance-windows)))

(defun split-window-horizontal-and-focus ()
  "Custom function to split window."
  (interactive)
  (progn
    (split-window-vertically)
    (balance-windows)
    (other-window 1)))

(defhydra hydra-window ()
  "
Movement^^        ^Split^         ^Switch^		^Resize^
----------------------------------------------------------------
_h_ ←             _v_ vertical    _f_ind files  _[_ X←
_j_ ↓             _s_ horizontal  _s_wap        _]_ X→
_k_ ↑             _z_ undo        _d_elete      _{_ X↑
_l_ →             _r_ reset       ^ ^           _}_ X↓
_q_ quit          ^ ^             ^ ^           _B_ balance
"
  ("h" windmove-left )
  ("j" windmove-down )
  ("k" windmove-up )
  ("l" windmove-right )
  ("[" evil-window-decrease-width)
  ("]" evil-window-increase-width)
  ("{" evil-window-decrease-height)
  ("}" evil-window-increase-height)
  ("B" balance-windows)
  ("f" helm-find-files)
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
   )
  ("s" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
   )
  ("S" save-buffer)
  ("d" delete-window)
  ("z" (progn
         (winner-undo)
         (setq this-command 'winner-undo)))
  ("r" winner-redo)
  ("q" nil)
  )

(defun elect-leaders ()
  "Configure evil-leaders."
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
    "bb" 'persp-switch-to-buffer

    "pl" 'list-packages
    "bh" 'show-home

    "tt" 'neotree-toggle
    "ts" 'neotree-show
    "th" 'neotree-hide
    "tr" 'neotree-refresh

    "<ESC>" 'keyboard-quit
    "TAB" 'bs-cycle-next
    "<backtab>" 'bs-cycle-previous

    "wv" 'split-window-vertical
    "ws" 'split-window-horizontal
    "wV" 'split-window-vertical-and-focus
    "wS" 'split-window-horizontal-and-focus
    "w." 'hydra-window/body))

(winner-mode)
(elect-leaders)

(provide 'user-evil-leaders)

;;; user-evil-leaders.el ends here
