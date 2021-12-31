;;; config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Stefan Schuh"
      user-mail-address "stefan@schuhu.at")

(setq doom-theme 'doom-monokai-classic)

(map! :leader
      :desc "window switcher" "w p" #'other-window)

(custom-set-faces!
  '(aw-leading-char-face
    :foreground "black" :background "#F92660"
    :weight bold :height 2.5 :box (:line-width 10 :color "#F92660")))

(setq doom-localleader-key "ü")

(map! :map global-map
      :desc "ex"
      :nv "ä" #'evil-ex)

(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command)

(setq org-directory "~/Nextcloud/org")

(setq org-attach-id-dir "~/Nextcloud/org/attach")

(map! :after org
      :map org-mode-map
      :localleader
      doom-localleader-key #'org-ctrl-c-ctrl-c)

(after! mu4e
   ;; load package to be able to capture emails for GTD
   (require 'org-mu4e)
   (setq mu4e-maildir-shortcuts
           '(("/uni/INBOX" . ?i)
             ("/schuhu/INBOX" . ?s)
             ("/gmail/INBOX" . ?g)
             ))
   
   (setq
    mu4e-confirm-quit nil ; quit without asking
    mu4e-attachment-dir "~/Downloads"
    mu4e-maildir (expand-file-name "~/Maildir")
    mu4e-get-mail-command "mbsync schuhu uni gmail"
    sendmail-program (executable-find "msmtp")
    send-mail-function #'smtpmail-send-it
    message-sendmail-f-is-evil t
    message-sendmail-extra-arguments '("--read-envelope-from")
    message-send-mail-function #'message-send-mail-with-sendmail)
   
       (set-email-account! "schuhu"
                           '((mu4e-sent-folder . "/schuhu/Gesendet")
                             (mu4e-drafts-folder . "/schuhu/Drafts")
                             (mu4e-trash-folder . "/schuhu/Papierkorb")
                             (mu4e-refile-folder . "/schuhu/Archiv")
                             (user-mail-address . "stefan@schuhu.at")
                             (user-full-name . "Stefan Schuh")
                             ( mu4e-compose-signature . (concat
                                                  "Stefan Schuh\n"
                                                  "Maria-Pachleitner-Straße 51/10\n"
                                                  "8053 Graz"))))
   
       (set-email-account! "uni"
                           '(( user-mail-address	     . "stefan.schuh@uni-graz.at" )
                           ( user-full-name	     . "Stefan Schuh" )
                           ( mu4e-compose-signature  .   (concat
                                                           "Mag. Stefan Schuh (B.A.)   https://ub.uni-graz.at/\n"
                                                           "mailto:stefan.schuh@uni-graz.at fon:+43-316-380-1461\n"
                                                           "Universitätsbibliothek Graz, Medienbearbeitung:\n"
                                                           "Universitätsplatz 3a, 8010 Graz"))
                           ;; special folders
                           (mu4e-drafts-folder . "/uni/drafts")
                           (mu4e-sent-folder . "/uni/sent")
                           (mu4e-trash-folder . "/uni/trash")))
       (set-email-account! "gmail"
                           '((user-mail-address . "stefan.schuh.ba@gmail.com")
                             (user-full-name . "Stefan Schuh")
                             (mu4e-drafts-folder . "/gmail/drafts")
                             (mu4e-sent-folder . "/gmail/sent")
                             (mu4e-trash-folder ."/gmail/trash")
                             ))
   )
