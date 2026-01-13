;; (package! org-roam-bibtex
;;   :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;; 
;; ;; When using org-roam via the `+roam` flag
;; (unpin! org-roam)
;; 
;; ;; When using bibtex-completion via the `biblio` module
;; (unpin! bibtex-completion helm-bibtex ivy-bibtex)

(unpin! evil-collection)
(package! xquery-mode)
(package! evil-matchit)
(package! ttl-mode)
(package! sparql-mode)
(package! dokuwiki)
(package! dokuwiki-mode)
(package! biblio)
(package! ebib)
(package! ox-ipynb
  :recipe (:host github :repo "jkitchin/ox-ipynb"))
(package! ox-wk)
(package! ox-gfm)
(package! ox-reveal)
(package! denote)
(package! plantuml-mode)
(package! typst-ts-mode
  :recipe (:host sourcehut :repo "meow_king/typst-ts-mode"))
(package! jest-test-mode)
(package! geiser-racket)
(package! keycast)
(package! rnc-mode)
(package! nov)
;; (package! xslide
;;   :recipe (:host github :repo "tkg/xslide"))
