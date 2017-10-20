;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; add loading directory 
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; ------------------------------------------------------------
;; General 
;; ------------------------------------------------------------
					;(require 'color-theme)

;(color-theme-euphoria)

(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq backup-directory-alist '(("." . "~/.emacs.d/.backup")))
(setq backup-by-copying t)


(global-font-lock-mode t)
(setq enable-recursive-minibuffers t)
(setq column-number-mode t) 
(setq inhibit-startup-message t) 
(setq default-fill-column 72)


(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq x-select-enable-clipboard t)

;(global-linum-mode t);; column number 
;(setq linum-format "%d ") ;; not copy line number

(mapcar
 (function (lambda (setting)
	          (setq auto-mode-alist
			   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\.bash" . sh-mode)
   ("\\.sh" . sh-mode)
   ("\\.bds" . java-mode)   
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

;;
(setq user-full-name "Zhang (Frank) Cheng")
(setq user-mail-address "zhangc518@gmail.com")



;; ------------------------------------------------------------
;; Package 
;; ------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; ------------------------------------------------------------
;; package 
;; ------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command
   "/projects/ps-epigen/software/miniconda3/envs/bds_atac/bin/pandoc")
 '(package-selected-packages
   (quote
    (magit egg edit-indirect better-defaults ein flycheck py-autopep8 elpy material-theme ess markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'material t) ;; load material theme
;; ------------------------------------------------------------
;; python
;; ref:https://realpython.com/blog/python/emacs-the-best-python-editor/
;; ------------------------------------------------------------
(when (not package-archive-contents)
  (package-refresh-contents))


;(defvar myPackages
 ; '(better-defaults
 ;   ein
 ;   elpy
 ;   flycheck
 ;   material-theme
 ;   py-autopep8));

;(mapc #'(lambda (package)
;    (unless (package-installed-p package)
;      (package-install package)))
;      myPackages)
(elpy-enable)
                                        ;(elpy-use-ipython)
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(setq python-shell-interpreter-args "--simple-prompt --pprint")


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; ipython
;(defun ipython ()
;    (interactive)
;    (term "/projects/ps-epigen/software/miniconda3/envs/bds_atac/bin/ipython"))

;; ------------------------------------------------------------
;; markdown
;; ------------------------------------------------------------



 (add-hook 'markdown-mode-hook
           (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook
                        'check-parens
                        nil t))))

;; ------------------------------------------------------------
;; git 
;; ------------------------------------------------------------

(global-set-key (kbd "C-x g") 'magit-status)


;;------------------------------------------------------------
;; ESS
;; https://www.emacswiki.org/emacs/EmacsSpeaksStatistics
;;------------------------------------------------------------

 (setq ess-eval-visibly nil) ; ESS will not print the evaluated commands, also speeds up the evaluation 
 (setq ess-ask-for-ess-directory nil) ;if you don't want to be prompted each time you start an interactive R session

(setq ess-use-auto-complete 'script-only)
;(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)

;;https://stackoverflow.com/questions/12805873/changing-indentation-in-emacs-ess

(add-hook 'ess-mode-hook
      (lambda ()
        (ess-set-style 'C++ 'quiet)
        ;; Because
        ;;                                 DEF GNU BSD K&R C++
        ;; ess-indent-level                  2   2   8   5   4
        ;; ess-continued-statement-offset    2   2   8   5   4
        ;; ess-brace-offset                  0   0  -8  -5  -4
        ;; ess-arg-function-offset           2   4   0   0   0
        ;; ess-expression-offset             4   2   8   5   4
        ;; ess-else-offset                   0   0   0   0   0
        ;; ess-close-brace-offset            0   0   0   0   0
        (add-hook 'local-write-file-hooks
              (lambda ()
            (ess-nuke-trailing-whitespace)))))
;;(setq ess-nuke-trailing-whitespace-p 'ask)
;; or even
(setq ess-nuke-trailing-whitespace-p t)
;; Perl
(add-hook 'perl-mode-hook
      (lambda () (setq perl-indent-level 4)))

;;------------------------------------------------------------
;; https://www.emacswiki.org/emacs/InsertingTodaysDate
;; insert time c-x c-d
;;------------------------------------------------------------
;; ====================
;; insert date and time

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
;       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
;       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key "\C-x\C-d" 'insert-current-date-time)
(global-set-key "\C-x\C-t" 'insert-current-time)


;;------------------------------------------------------------
;; Time Stamp 
;; https://www.emacswiki.org/emacs/TimeStamp
;;------------------------------------------------------------
(add-hook 'before-save-hook 'time-stamp)
(add-hook 'write-file-hooks 'time-stamp)
;  in the first 8 lines 
;   Time-stamp: <>
;   Time-stamp: " "

; (setq time-stamp-pattern  "8/Time-stamp:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S %u\\\\?[\">]") ; default 

(setq time-stamp-pattern  "8/Time-stamp:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S\\\\?[\">]") ;

(defun insert-timestamp-tag ()
  "Insert the timestamp tag; only works in the first 5 lines to allow automatic update"
  (interactive)
  (insert "Time-stamp: <>")
  (insert "\n")
  )
(global-set-key "\C-x\C-t" 'insert-timestamp-tag)


