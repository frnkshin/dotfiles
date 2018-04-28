;;; user-shackle --- contains configuration for Shackle-Mode
;;; COmmentary:
;;; Code:

(require 'shackle)
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4)))
(shackle-mode)

(provide 'user-shackle)

;;; user-shackle.el ends here
