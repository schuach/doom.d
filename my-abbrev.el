;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev
;; from http://ergoemacs.org/emacs/emacs_abbrev_mode.html

(define-abbrev-table 'global-abbrev-table
  '(
    ;; Beginnen immer mit z, zwecks Eindeutigkeit. Können keine Interpunktion enthalten.

    ;; Allgemeine Abkürzungen
    ("zie" "Internet Explorer")
    ("zgc" "Google Chrome")
    ("zff" "Firefox")

    ;; bibliotheksspezifische Begriffe
    ("zkatin" "Katalogisiererinnen und Katalogisierer")
    ("zva" "Verantwortlichkeitsangabe")
    ("zds" "Datensatz")
    ("zdss" "Datensätze")
    ("zhss" "Hochschulschrift")
    ("zhssn" "Hochschulschriften")
    ("zbib", "Bibliothek")
    ("zbibar" "Bibliothekar")
    ("zhb" "Hauptbibliothek")
    ;; RDA
    ("zbkz" "Beziehungskennzeichnung")
    ("zoa" "Open Access")

    ;; Symbole
    ("zqa" "∀x")
    ("zqe" "∃x")

    ;; Self
    ("zsts" "Stefan Schuh")
    ))

;; define abbrev for specific major mode
;; the first part of the name should be the value of the variable major-mode of that mode
;; e.g. for go-mode, name should be go-mode-abbrev-table
(define-abbrev-table 'mu4e-compose-mode-abbrev-table
  '(
    ("sgk" "Sehr geehrte Kolleginnen und Kollegen,\n")
    ("lk" "Liebe Kolleginnen und Kollegen,\n")
    ("sgh" "Sehr geehrter Herr")
    ("sgf" "Sehr geehrte Frau")
    ("mfgs" "mit freundlichen Grüßen\nStefan Schuh")
    ("Lgs" "Liebe Grüße\nStefan")
    ("lgs" "liebe Grüße\nStefan")
    ("lgjsv" "liebe Grüße\nJosef, Stefan und Verena")
    ("jsv" "Josef, Stefan und Verena")
    ("jlssvs" "Josef Labner\nStefan Schuh\nVerena Schaffner")
    ))

