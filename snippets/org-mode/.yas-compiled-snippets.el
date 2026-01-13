;;; "Compiled" snippets and support files for `org-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("<S" "#+NAME: $1\n#+BEGIN_SRC $2\n$0\n#+END_SRC"
                        "org-mode-src-name" nil nil nil
                        "/home/ss/.config/doom/snippets/org-mode/src-with-name"
                        nil nil)
                       ("srcdo"
                        "#+begin_src shell :dir /sudo::\n`(org-edit-special)`\n#+end_src"
                        "src shell sudo" t nil nil
                        "/home/ss/.config/doom/snippets/org-mode/src-shell-sudo"
                        nil nil)
                       ("<spn" "#+begin_src python :noweb yes\n$0\n#+end_src"
                        "source-python-noweb" t nil nil
                        "/home/ss/.config/doom/snippets/org-mode/<spn" nil "")))


;;; Do not edit! File generated at Tue Nov 18 19:42:56 2025
