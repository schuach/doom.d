;;; "Compiled" snippets and support files for `python-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("pmaof"
                        "record.add_ordered_field(\n    pymarc.Field(\n        tag=\"$1\",\n        indicators=[\"$2\", \"$3\"],\n        subfields=[\"$4\", \"$0\"]\n    )\n)"
                        "pymarc.add_ordered_field" nil nil nil
                        "/home/ss/.config/doom/snippets/python-mode/pymarc.add_ordered_field"
                        nil nil)
                       (",psf" "Subfield(code=\"$1\", value=$2)$0"
                        "pymarc-subfield" t nil nil
                        "/home/ss/.config/doom/snippets/python-mode/psf" nil nil)
                       ("mtst"
                        "assert $1.tag == \"$2\"\nassert $1.indicators == [\"$3\", \"$4\"]\nassert $1.subfields == [\n       Subfield(code=\"$5\", value=\"$0\")\n]"
                        "marc assertion test" nil nil nil
                        "/home/ss/.config/doom/snippets/python-mode/marc_assertion_test"
                        nil nil)))


;;; Do not edit! File generated at Tue Nov 18 19:42:56 2025
