;;; config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Triplicate A Code" :size 20))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 20))

(defun async-shell-command-no-window
    (command &optional buffer-name)
  (interactive)
  (let*
      ((bfr-name (or buffer-name shell-command-buffer-name-async))
       (display-buffer-alist
        (list
         (cons
          bfr-name
          (cons #'display-buffer-no-window nil)))))
       (async-shell-command
        command bfr-name)))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Stefan Schuh"
      user-mail-address "stefan.schuh@obvsg.at")

(setq doom-theme 'doom-oksolar-light)

(map! :leader
      :desc "window switcher" "w p" #'other-window)

(custom-set-faces!
  '(aw-leading-char-face
    :foreground "black" :background "#F92660"
    :weight bold :height 2.5 :box (:line-width 10 :color "#F92660")))

(map! :leader
      (:prefix ("z" . "zoom/resize")
               "z" #'+hydra/text-zoom/body
               "n" #'+hydra/window-nav/body))

(map! "C-ö"             #'embark-act
      (:map minibuffer-local-map
       "C-ö"            #'embark-act
       "C-ü"            #'embark-select
       "C-c C-ü"        #'embark-act-all
       "C-c C-ö"        #'embark-export))

(setq calendar-week-start-day 1)

(setq doom-localleader-key "ü")

(map! :map global-map
      :desc "ex"
      :nv "ä" #'evil-ex)

(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command)

(global-evil-matchit-mode 1)

(setq abbrev-file-name (concat doom-private-dir "my-abbrevs"))
(set-default 'abbrev-mode t)
(setq save-abbrevs 'silently)

(add-to-list 'load-path (concat (getenv "HOME") "/.config/doom/lisp/")  )

(setq sort-fold-case t)

(setq case-replace nil)

(defun org-babel-edit-prep:python (babel-info)
  (setq-local buffer-file-name (->> babel-info caddr (alist-get :tangle)))
  (lsp))

(use-package! denote
  :init
  (setq denote-directory (expand-file-name "~/projects/notes/"))
  (setq denote-known-keywords '("basex" "emacs" "meeting" "xquery"))
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories))

(map! :after denote
      :leader
      (:prefix ("d" . "denote")
               "n" #'denote))

;; (autoload 'drools-mode "drools-mode")
(require 'drools-mode)

(defun set-extension-mode (extension mode)
  (setq auto-mode-alist
	(cons (cons (concat "\\" extension "\\'") mode)
	      auto-mode-alist) ) )

(set-extension-mode ".drl" 'drools-mode)
(set-extension-mode ".dslr" 'drools-mode)
(set-extension-mode ".src" 'drools-mode)

(setq geiser-guile-binary "guile3.0")

(after! typescript-mode
  (setq typescript-indent-level 2)
  )

(add-hook 'typescript-mode-hook 'jest-test-mode)

(map! :after typescript-mode
      :map typescript-mode-map
      :localleader
      (:prefix ("t" . "test")
       :desc "rerun last test command" "a" #'jest-test-rerun-test
       :desc "run jest on file" "f" #'jest-test-run
       :desc "run all tests in project" "p" #'jest-test-run-all-tests
       :desc "run the it/test/describe block at the current point" "t" #'jest-test-run-at-point))

(set-popup-rule! "^\\*jest-test-compilation\\*" :select t :size 0.45)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((typescript . t)
   ))

(add-hook 'markdown-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'markdown-toc-refresh-toc nil 't)))

(setq markdown-fontify-code-blocks-natively t)

(setq org-attach-store-link-p 'attached)

(setq org-link-file-path-type 'relative)

(map! :after org
      :map org-mode-map
      :localleader
      doom-localleader-key #'org-ctrl-c-ctrl-c)

;; lualatex preview
(setq org-latex-pdf-process
  '("lualatex -shell-escape -interaction nonstopmode %f"
    "lualatex -shell-escape -interaction nonstopmode %f"))

(setq luamagick '(luamagick :programs ("lualatex" "convert")
       :description "pdf > png"
       :message "you need to install lualatex and imagemagick."
       :use-xcolor t
       :image-input-type "pdf"
       :image-output-type "png"
       :image-size-adjust (1.0 . 1.0)
       :latex-compiler ("lualatex -interaction nonstopmode -output-directory %o %f")
       :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O")))

(add-to-list 'org-preview-latex-process-alist luamagick)

(setq org-preview-latex-default-process 'luamagick)

(use-package! ox-gfm)

(use-package! ox-reveal)
(setq org-reveal-root "~/opt/reveal.js")

(setq org-noter-notes-search-path '("~/Nextcloud/literatur/notes/"))

(map! :leader
       :desc "org-noter-insert-note" "n i" #'org-noter-insert-note
       :desc "org-noter-insert-precise-note" "n I" #'org-noter-insert-precise-note)

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("p" . "src python"))

(defun my-babel-to-buffer ()
  "A function to efficiently feed babel code block result to a separate buffer"
  (interactive)
  (org-open-at-point)
  (org-babel-remove-result))

(map! :after org
      :map org-mode-map
      :localleader (:prefix ("u" . "prefix")
                            doom-localleader-key #'my-babel-to-buffer))

(after! org
  (setq org-directory "~/Nextcloud/org"
        org-attach-id-dir "~/Nextcloud/org/attach")
  (add-to-list 'org-agenda-files "~/Nextcloud/org" "~/projects/")
  
  (require 'org-tempo)
  
  (add-to-list 'org-structure-template-alist '("p" . "src python"))
  (setq org-default-notes-file (concat org-directory "/refile.org"))
  (setq local-meetings-file (concat org-directory "/meetings.org"))
  ;; Capture templates
  (setq org-capture-templates
        (quote (("t" "To Do" entry (file org-default-notes-file)
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("b" "Bearbeiten" entry (file org-default-notes-file)
                 "* TODO Bearbeiten: %:subject\n%U\n%a\n%i\n" :immediate-finish t)
                ("r" "Antworten ([r]eply)" entry (file org-default-notes-file)
                 "* TODO Antwort an %:from bezüglich %:subject\nSCHEDULED: %t\n%U\n%a\n" :immediate-finish t)
                ("n" "Notiz" entry (file org-default-notes-file)
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ;; ("j" "Journal" entry (file+datetree org-journal-file)
                ;;  "* %?\n%U\n" :clock-in t :clock-resume t)
                ("B" "Besprechung" entry (file+olp+datetree local-meetings-file)
                 "* %?\n%U" :clock-in t :clock-resume t)
                ("T" "Telefonat" entry (file org-default-notes-file)
                 "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                )))
  (setq org-attach-store-link-p 'attached)
  ;; lualatex preview
  (setq org-latex-pdf-process
    '("lualatex -shell-escape -interaction nonstopmode %f"
      "lualatex -shell-escape -interaction nonstopmode %f"))
  
  (setq luamagick '(luamagick :programs ("lualatex" "convert")
         :description "pdf > png"
         :message "you need to install lualatex and imagemagick."
         :use-xcolor t
         :image-input-type "pdf"
         :image-output-type "png"
         :image-size-adjust (1.0 . 1.0)
         :latex-compiler ("lualatex -interaction nonstopmode -output-directory %o %f")
         :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O")))
  
  (add-to-list 'org-preview-latex-process-alist luamagick)
  
  (setq org-preview-latex-default-process 'luamagick)
  (after! ox-latex
    (add-to-list 'org-latex-classes
                 '("koma-article"
                   "\\documentclass[12pt,a4paper]{scrartcl}
                  \\usepackage[english,ngerman]{babel}
                  \\usepackage{microtype}
                  \\usepackage{tgpagella}
                  \\linespread{1.05}
                  \\usepackage[scale=.9]{tgheros}
                  \\usepackage{tgcursor}
                  \\usepackage{paralist}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("koma-article-big"
                   "\\documentclass[16pt,a4paper]{scrartcl}
                  \\usepackage[english,ngerman]{babel}
                  \\usepackage{microtype}
                  \\usepackage{tgpagella}
                  \\linespread{1.05}
                  \\usepackage[scale=.9]{tgheros}
                  \\usepackage{tgcursor}
                  \\usepackage{paralist}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    )
  (require 'ob-xquery)
  (add-to-list 'org-babel-load-languages '(xquery . t))
  (add-to-list 'org-structure-template-alist '("x". "src xquery"))
  (use-package! ox-twiki)
  (use-package! ox-gfm)
  (defun my/org-insert-datetree-heading ()
     (interactive)
     (org-insert-heading)
     (insert (get-date))
     (insert "\n"))
  
  (defun get-date ()
    (interactive)
    (let* ((dt (org-read-date))
           (year (string-to-number (substring dt 0 4)))
           (month (string-to-number (substring dt 5 7)))
           (day (string-to-number (substring dt 8 10))))
      (format-time-string "%Y-%m-%d %A" (org-encode-time 0 0 0 day month year))))
  
  ;; keybinding
  (map! :after org
        :map org-mode-map
        :localleader
        (:prefix ("ö" . "test")
         "h" #'my/org-insert-datetree-heading))
  (defun local-org-extract-src-content (name)
    (save-excursion
      (org-babel-goto-named-src-block name)
      (org-element-property :value (org-element-at-point))))
  )

(setq plantuml-default-exec-mode 'jar)
(setq org-plantuml-jar-path "~/plantuml.jar")

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

(after! poetry
  (setq poetry-tracking-strategy 'projectile))

(if (equal (assoc "\\.rkt\\'" auto-mode-alist) '("\\.rkt\\'" . scheme-mode))
    (setf (cdr (assoc "\\.rkt\\'" auto-mode-alist)) 'racket-mode)
  (add-to-list 'auto-mode-alist ' ("\\.rkt\\'" . racket-mode)))

(setq geiser-default-implementation 'racket)

(set-formatter! 'html-tidy '("tidy -q -indent --indent-spaces 2") :modes '(html-mode web-mode))
(set-formatter! 'xml-tidy '("tidy" "-q" "-w" "-xml" "-indent" "--indent-spaces 2" "--literal-attributes" ) :modes '(nxml-mode))

(map! :after nxml-mode
      :map nxml-mode-map
      :localleader
      (:prefix ("t" . "test")
       "t" #'run-xspec-on-file
       "b" #'browse-xspec-report-url
       "r" #'rerun-last-xspec-test))

(use-package! xquery-mode
  :config
  (require 'basex))

(map! :after xquery-mode
      :map xquery-mode-map
      :localleader
      (:prefix ("r" . "run")
               "b" #'basex-run-buffer
               "r" #'basex-run-region
               "l" #'basex-run-line
               "o" #'basex-run-src-block))

(after! nxml-mode
  (add-to-list 'rng-schema-locating-files "~/opt/xspec/editors/emacs/schemas.xml")
  (add-to-list 'rng-preferred-prefix-alist '("http://www.jenitennison.com/xslt/xspec" . "x"))
  (setq last-xspec-test nil)
  (defun run-xspec-on-file (&optional xspec-file-name)
    "Runs xspec on current FILE. If FILE is `nil`, use current-buffer.
  If call with prefix arg, the *Async Shell Command* buffer is not displayed.
  "
    (interactive)
    (let* ((fname (or xspec-file-name (buffer-file-name)))
           (cmd (concat "XSPEC_HTML_REPORT_THEME='classic' xspec " fname)))
      (setq last-xspec-test `(,current-prefix-arg ,fname))
      (if current-prefix-arg
          (async-shell-command-no-window cmd "*XSpec Output*")
        (async-shell-command cmd "*XSpec Output*"))))
  (defun browse-xspec-report-url ()
    (interactive)
    (with-current-buffer "*XSpec Output*"
      (let ((bs (buffer-substring-no-properties (point-min) (point-max))))
        (string-match "\nReport available at \\(.*\\)\n" bs)
        (browse-url (concat "file://" (match-string 1 bs)))))))

(defun rerun-last-xspec-test ()
  "Rerun last XSpec test. Message if there was none."
  (interactive)
  (if last-xspec-test
    (let ((current-prefix-arg (car last-xspec-test))
          (fname (cadr last-xspec-test)))
      (run-xspec-on-file fname))
    (message "No XSpec test to re-run.")))

(after! ispell
  (if (equal system-type 'gnu/linux)
      (progn
        (setq ispell-program-name "hunspell")
        (setq ispell-dictionary "de_AT,en_US")
        ;; ispell-set-spellchecker-params has to be called
        ;; before ispell-hunspell-add-multi-dic will work
        (ispell-set-spellchecker-params)
        (ispell-hunspell-add-multi-dic "de_AT,en_US"))
    (setq ispell-dictionary "german8"))
  )

(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/mu4e-1.10.8/")

(setq mu4e-sent-messages-behavior 'sent)

(setq +mu4e-alert-bell-cmd nil)

(after! mu4e
   ;; load package to be able to capture emails for GTD
   ;; (require 'org-mu4e)
   (setq mu4e-maildir-shortcuts
           '(("/work/Inbox" . ?i)
             ("/schuhu/INBOX" . ?s)
             ("/gmail/INBOX" . ?g)
             ("/schuhu_mjn/INBOX" . ?m)
             ("/stefanschuh/INBOX" . ?p)
             ))
   
   (setq +mu4e-main-bullet "*")
   (setq
    mu4e-confirm-quit nil ; quit without asking
    mu4e-use-fancy-chars nil ; don't use icons, they mess up the linespacing
    mu4e-attachment-dir "~/Downloads"
    mu4e-maildir (expand-file-name "~/Maildir")
    mu4e-get-mail-command "mbsync work schuhu gmail stefanschuh"
    mu4e-update-interval 120 ;; check for updates every n seconds
    sendmail-program (executable-find "msmtp")
    send-mail-function #'smtpmail-send-it
    message-sendmail-f-is-evil t
    message-sendmail-extra-arguments '("--read-envelope-from")
    message-send-mail-function #'message-send-mail-with-sendmail)
   (set-email-account! "work"
                       '((user-mail-address . "stefan.schuh@obvsg.at")
                         (user-full-name . "Stefan Schuh")
                         (mu4e-drafts-folder . "/Work/Drafts")
                         (mu4e-sent-folder . "/Work/Sent")
                         (mu4e-trash-folder . "/Work/Trash")
                         (mu4e-refile-folder . "/Work/Archiv")
                         (mu4e-compose-signature . (concat
   
   "Stefan Schuh     Die Österreichische Bibliothekenverbund und Service\n"
   "                                               Gesellschaft m. b. H.\n"
   "Tel: +43 1 4035158-65                  A-1020 Wien, Raimundgasse 1/3"
   ))
                         ))
   (set-email-account! "schuhu"
                       '((mu4e-sent-folder . "/schuhu/Gesendet")
                         (mu4e-drafts-folder . "/schuhu/Drafts")
                         (mu4e-trash-folder . "/schuhu/Papierkorb")
                         (mu4e-refile-folder . "/schuhu/Archiv")
                         (user-mail-address . "stefan@schuhu.at")
                         (user-full-name . "Stefan Schuh")
                         (mu4e-compose-signature . (concat
                                                    "Stefan Schuh\n"
                                                    "Maria-Pachleitner-Straße 51/10\n"
                                                    "8053 Graz"))))
   
   (set-email-account! "Stefanschuh"
                       '((mu4e-sent-folder . "/stefanschuh/Sent")
                         (mu4e-drafts-folder . "/stefanschuh/Drafts")
                         (mu4e-trash-folder . "/stefanschuh/Trash")
                         (mu4e-refile-folder . "/stefanschuh/Archive")
                         (user-mail-address . "email@stefanschuh.at")
                         (user-full-name . "Stefan Schuh")
                         (mu4e-compose-signature . (concat
                                                    "Stefan Schuh\n"
                                                    "Maria-Pachleitner-Straße 51/10\n"
                                                    "8053 Graz"))))
   
   (set-email-account! "mjn-schuhu"
                       '((mu4e-sent-folder . "schuhu_mjn/Sent")
                         (mu4e-drafts-folder . "/schuhu_mjn/Drafts")
                         (mu4e-trash-folder . "/schuhu_mjn/Papierkorb")
                         (mu4e-refile-folder . "/schuhu_mjn/Archiv")
                         (user-mail-address . "mjn@schuhu.at")
                         (user-full-name . "Mutant Admin")
                         (mu4e-compose-signature . (concat
                                                    "Dämmergewölbe 3, Die Arche"))
                         ))
   
   (set-email-account! "gmail"
                       '((user-mail-address . "stefan.schuh.ba@gmail.com")
                         (user-full-name . "Stefan Schuh")
                         (mu4e-drafts-folder . "/gmail/drafts")
                         (mu4e-sent-folder . "/gmail/sent")
                         (mu4e-trash-folder ."/gmail/trash")
                         ))
   (setq mu4e-headers-fields
           '((:account-stripe . 1)
             (:human-date . 10)
             (:flags . 6) ; 3 icon flags
             (:from-or-to . 25)
             (:subject)))
   (setq +mu4e-alert-bell-cmd nil)
   (setq mu4e-sent-messages-behavior 'sent)
   )

(after! emacs-everywhere
  (map! :map emacs-everywhere-mode-map
        :desc "finish or C-c C-c"
        :localleader doom-localleader-key #'emacs-everywhere-finish-or-ctrl-c-ctrl-c))

(setq! citar-bibliography '("~/Nextcloud/literatur/bibliographie.bib")
       citar-library-paths '("~/Nextcloud/literatur/files/")
       citar-notes-paths '("~/Nextcloud/literatur/notes/"))

(defvar citar-indicator-files-icons
  (citar-indicator-create
   :symbol (nerd-icons-faicon
            "nf-fa-file_o"
            :face 'nerd-icons-green
            :v-adjust -0.1)
   :function #'citar-has-files
   :padding "  " ; need this because the default padding is too low for these icons
   :tag "has:files"))
(defvar citar-indicator-links-icons
  (citar-indicator-create
   :symbol (nerd-icons-faicon
            "nf-fa-link"
            :face 'nerd-icons-orange
            :v-adjust 0.01)
   :function #'citar-has-links
   :padding "  "
   :tag "has:links"))
(defvar citar-indicator-notes-icons
  (citar-indicator-create
   :symbol (nerd-icons-codicon
            "nf-cod-note"
            :face 'nerd-icons-blue
            :v-adjust -0.3)
   :function #'citar-has-notes
   :padding "    "
   :tag "has:notes"))
(defvar citar-indicator-cited-icons
  (citar-indicator-create
   :symbol (nerd-icons-faicon
            "nf-fa-circle_o"
            :face 'nerd-icons-green)
   :function #'citar-is-cited
   :padding "  "
   :tag "is:cited"))

(setq citar-indicators
      (list citar-indicator-files-icons
            citar-indicator-links-icons
            citar-indicator-notes-icons
            citar-indicator-cited-icons))

(setq dired-listing-switches "-ahlv --time-style=long-iso --group-directories-first")

(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")

;; use biblatex
(setq ebib-bibtex-dialect 'biblatex)

;; always load my main .bib-file
(setq ebib-preload-bib-files '("~/Nextcloud/literatur/bibliographie.bib"))

(setq bibtex-autokey-name-year-separator ""
      bibtex-autokey-year-title-separator ""
      bibtex-autokey-year-length 4
      bibtex-autokey-titleword-length 0
      bibtex-autokey-titlewords 0
      ebib-uniquify-keys t)

(setq ebib-file-search-dirs '("~/Nextcloud/literatur/files"))

(after! ebib
  (setf (alist-get "pdf" ebib-file-associations) nil))

(map!  :leader
       (:prefix ("e" . "ebib")
                "e" #'ebib
                "i" #'ebib-import-entries
                "I" #'ebib-import-file
                "q" #'ebib-quit
                "z" #'ebib-lower))

(map! :after ebib
      :map ebib-index-mode-map
      :localleader
      :desc "Save current database" "s" #'ebib-save-current-database
      :desc "Save all databases" "S" #'ebib-save-all-databases)

(map! :after ebib
      :map ebib-entry-mode-map
      :desc "copy field contents" "y" #'ebib-copy-current-field-contents
      :desc "kill field contents" "d" #'ebib-kill-current-field-contents
      :desc "insert into field" "p" #'ebib-yank-current-field-contents)

(map! :after ebib
      :map ebib-entry-mode-map
      :localleader
      :desc "Save current database" "s" #'ebib-save-current-database
      :desc "Save all databases" "S" #'ebib-save-all-databases)

(after! forge
(add-to-list 'forge-alist
             '("gitlab.obvsg.at"
               "gitlab.obvsg.at/api/v4"
               "gitlab.obvsg.at"
               forge-gitlab-repository)))

(require 'auth-source)
(setq auth-sources '("~/.netrc"))

(require 'mrc)
(mrc-doom-bind-keys)

(font-lock-add-keywords
 'drools-mode
 `(
   ;; tags and indicators
   ("^=\\(00[1-9]\\)"
    (1 font-lock-keyword-face))
   ("^=\\([0-9]\\{3\\}\\) ?\\(..\\).*\\$\\$"
    (1 font-lock-keyword-face)
    (2 font-lock-type-face))
   ;; subfields
   ("\\(\\$\\$.\\)"
    (1 font-lock-function-name-face))
   )
t)
