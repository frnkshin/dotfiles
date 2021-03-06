;;; user-whichkeys --- configuration for whichkeys mode
;;; Commentary:

;;; Code:

(require 'which-key)

;; Enable which-key-mode
(which-key-mode 1)

;; Set up where which-key shows up
(which-key-setup-side-window-bottom)

;; Take over the minibuffer
(which-key-setup-minibuffer)

;; Delay for minibuffer items to appear
(setq which-key-idle-delay 0.3)

;; Add items to minibuffer
(which-key-add-key-based-replacements "SPC b" "buffer")
(which-key-add-key-based-replacements "SPC f" "file")
(which-key-add-key-based-replacements "SPC p" "packages")
(which-key-add-key-based-replacements "SPC q" "power")
(which-key-add-key-based-replacements "SPC t" "tree")
(which-key-add-key-based-replacements "SPC w" "window")
(which-key-add-key-based-replacements "SPC z" "zoom")

(provide 'user-whichkeys)

;;; user-whichkeys.el ends here
