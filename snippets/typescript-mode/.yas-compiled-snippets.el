;;; "Compiled" snippets and support files for `typescript-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'typescript-mode
                     '(("zmsf" "{code: '$1', value: '$2'},$0" "marcSubfield" t
                        nil nil
                        "/home/ss/.config/doom/snippets/typescript-mode/msf" nil
                        nil)
                       ("zmdf"
                        "{\n  tag: '$1',\n  ind1: '$2',\n  ind2: '$3',\n  subfields: [\n    $0\n  ],\n},"
                        "marcDatafield" t nil nil
                        "/home/ss/.config/doom/snippets/typescript-mode/mdf" nil
                        nil)
                       ("jtit"
                        "  it('handles $1', () => {\n    const rawGroup = {start: true, text: '$2'};\n    const expected = {start: true, open: false, vol: '$3', yr: '$0'};\n    expect(analyzeGroup(rawGroup)).toEqual(expected);\n  });"
                        "jest it() for analyzeGroup" t nil nil
                        "/home/ss/.config/doom/snippets/typescript-mode/jtit"
                        nil nil)))


;;; Do not edit! File generated at Tue Nov 18 19:42:56 2025
