;;; lisp/marc-mode.el -*- lexical-binding: t; -*-


(define-derived-mode marc-mode text-mode "MARC21"
  "Major mode for editing MARC-Breaker files.")

(font-lock-add-keywords
 'marc-mode
 `(
   ;; tags and indicators
   ("^=?\\(00[1-9]\\)"
    (1 font-lock-keyword-face))
   ("^=?\\([0-9]\\{3\\}\\) ?\\(..\\).*\\$\\$"
    (1 font-lock-keyword-face)
    (2 font-lock-variable-name-face))
   ;; subfields
   ("\\(\\$\\$.\\)"
    (1 font-lock-type-face))
   )
 )

(defgroup marc-mode nil
  "Major mode for marc files editing."
  :group 'languages)

(defcustom marc-mode-hook nil
  "Hook run after entering marc mode."
  :type 'hook
  :options '(turn-on-font-lock))


;; (evil-define-text-object marc-inner-subfield (count &optional beg end type)
;; (evil-select-paren "\\$\\$" "\\$\\$" beg end type count nil))
;; (define-key evil-inner-text-objects-map (kbd "m") 'marc-inner-subfield)

;; (defun my-a-subfield (count)
;;   "Define inner subfield. COUNT."
;;   (interactive "n")
;;   (let* ((pt (point))
;;          (beg (search-backward "$$"))
;;          (end (search-forward-regexp "\\$\\$\\|$")))
;;     (if (< count 0)
;;         (message "%d %d" beg pt)
;;       (message "%d %d" pt end))))

;; (defmacro define-and-bind-text-object (prefix name key start-regex end-regex)
;;   (let ((inner-name (make-symbol (concat prefix "-inner-" name)))
;;         (outer-name (make-symbol (concat prefix "-a-" name))))
;;     `(progn
;;        (evil-define-text-object ,inner-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count nil))
;;        (evil-define-text-object ,outer-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count t))
;;        (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
;;        (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))


;; (define-and-bind-text-object "marc" "subfield" "m" "\\$\\$." "\\$\\$")

;; (defun tst (count &optional beg end type)
;;   (interactive "n")
;;   (let* ((beg (point))
;;          (end (if (> count 0)
;;                   (save-excursion
;;                     (or  (- (search-forward "$$" (save-excursion (end-of-line)) t count) 2
;;                             (end-of-line))
;;                         ))
;;                 (save-excursion
;;                   (+
;;                    (or (search-backward "$$" (save-excursion (beginning-of-line)) t count)
;;                        (beginning-of-line))
;;                    1)))))))

;; (evil-define-text-object marc-inner-subfield (count &optional beg end type)
;;   (tst))
;; define-key evil-inner-text-objects-map (kbd "m") (quote marc-inner-subfield)


(provide 'marc-mode)
