;;; "Compiled" snippets and support files for `nxml-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'nxml-mode
                     '(("xvar" "<xsl:variable name=\"$1\" select=\"$0\" />"
                        "xsl:variable" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/xvar" nil nil)
                       ("xspec"
                        "<x:description xmlns:x=\"http://www.jenitennison.com/xslt/xspec\"\n               xmlns:marc=\"http://www.loc.gov/MARC21/slim\"\n               stylesheet=\"$0\">\n\n  <x:scenario label=\"\">\n    <x:context>\n\n    </x:context>\n    <x:expect label=\"\">\n\n    </x:expect>\n  </x:scenario>\n\n</x:description>"
                        "xspec-template" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/xspec-template"
                        nil nil)
                       ("xslt"
                        "<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"\n                xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"\n                xmlns:utils=\"https://share.obvsg.at/xml/xsl/utils\"\n                xmlns:mrclib=\"https://share.obvsg.at/xml/xsl/mrclib\"\n                exclude-result-prefixes=\"xs utils mrclib\"\n                expand-text=\"yes\"\n                version=\"3.0\">\n\n  <xsl:mode on-no-match=\"shallow-copy\" />\n\n  $0\n\n</xsl:stylesheet>\n"
                        "xslt-boilerplate" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/xslt-boilerplate"
                        nil nil)
                       ("tmatch"
                        "<xsl:template match=\"$1\">\n  $0\n</xsl:template>"
                        "xsl-template-match" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/xsl-template-match"
                        nil nil)
                       ("xat" "<xsl:apply-templates />" "apply-templates-empty"
                        t nil nil "/home/ss/.config/doom/snippets/nxml-mode/xat"
                        nil "")
                       ("xfunc"
                        "<x:scenario label=\"$1\">\n  <x:call function=\"$2\">\n    <x:param name=\"$3\"\n             select=\"\" />\n  </x:call>\n  <x:expect label=\"$0\"\n            select=\"\" />\n</x:scenario>"
                        "x:scenario_func" nil nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/x:scenario_func"
                        nil nil)
                       ("xscen"
                        "<x:scenario label=\"$1\">\n  <x:context>\n  </x:context>\n  <x:expect label=\"$0\">\n  </x:expect>\n</x:scenario>\n"
                        "x:scenario" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/x:scenario"
                        nil nil)
                       ("subf" "<marc:subfield code=\"$1\">$0</marc:subfield>"
                        "subfield" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/subfield" nil
                        nil)
                       ("docst"
                        "<doc:doc scope=\"stylesheet\">\n  <doc:title>$1</doc:title>\n  <doc:includeMd href=\"$2\" />\n  <doc:desc>$0</doc:desc>\n</doc:doc>\n"
                        "doc:doc stylesheet" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/docst" nil "")
                       ("docglob"
                        "<doc:doc scope=\"global\">\n  <doc:title>$1</doc:title>\n  <doc:includeMd href=\"$2\" />\n  <doc:desc>$0</doc:desc>\n</doc:doc>\n"
                        "doc:doc global" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/docglob" nil
                        "")
                       ("datafield"
                        "<marc:datafield tag=\"$1\" ind1=\"$2\" ind2=\"$3\">\n    <marc:subfield code=\"a\">$0</marc:subfield>\n</marc:datafield>\n"
                        "marc:datafield" t nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/datafield" nil
                        nil)
                       ("bf"
                        "<bibliotheca:field type=\"$1\" code=\"$2\">$0</bibliotheca:field>"
                        "bibliotheca:field" nil nil nil
                        "/home/ss/.config/doom/snippets/nxml-mode/bibliotheca:field"
                        nil nil)))


;;; Do not edit! File generated at Tue Nov 18 19:42:56 2025
