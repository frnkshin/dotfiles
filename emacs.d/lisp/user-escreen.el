;;; user-escreen --- set up escreen configuration for user
;;; Commentary:
;;; Code:

(require 'escreen)
(require 'evil)
(escreen-install)

(define-key evil-motion-state-map (kbd "gt") 'escreen-goto-next-screen)
(define-key evil-motion-state-map (kbd "gT") 'escreen-goto-prev-screen)
(provide 'user-escreen)

;;; user-escreen.el ends here
