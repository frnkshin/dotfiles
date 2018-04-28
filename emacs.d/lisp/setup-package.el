(require 'package)

(defun add-melpa ()
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
         (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
    (add-to-list 'package-archives (cons "melpa" url) t))
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))))

(add-melpa)
(package-initialize)

(provide 'setup-package)
