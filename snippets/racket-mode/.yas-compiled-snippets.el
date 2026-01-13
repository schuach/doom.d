;;; "Compiled" snippets and support files for `racket-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'racket-mode
                     '(("ümsf" "(subfield (@ (code \"$1\")) $0)" "sxml-subfield"
                        nil nil nil
                        "/home/ss/.config/doom/snippets/racket-mode/sxml-subfield"
                        nil nil)
                       ("ümdf"
                        "(datafield (@ (tag \"$1\") (ind1 \"$2\") (ind2 \"$3\"))\n           (subfield (@ (code \"$4\")) $0))"
                        "sxml-datafield" nil nil nil
                        "/home/ss/.config/doom/snippets/racket-mode/sxml-datafield"
                        nil nil)))


;;; Do not edit! File generated at Tue Nov 18 19:42:56 2025
