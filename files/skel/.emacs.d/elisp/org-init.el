;;-------------------------------------------------------
;;; Org mode init starts here
;; The following lines are always needed.  Choose your own keys.
;(setq load-path (cons "~/.xemacs/elisp/org-mode/lisp" load-path))
(require 'org-install)
;(add-to-list 'load-path "~/.emacs.d/elisp/org-mode/lisp")

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-return-follows-link t)

; the agenda files that org uses to make master lists
(setq org-agenda-files (list "~/project/.org/work.org"
			     "~/project/.org/home.org"))

;; Remember mode for taking notes
(require 'remember)
(global-set-key (kbd "C-c r") 'remember)

;; The master note file
(setq remember-data-file "~/project/.org/notes.org")

;; Use the following template to remember mode
(add-hook 'remember-mode-hook 'org-remember-apply-template) ;; (2)
(setq org-remember-templates
      `(("Notes" ?n " ** %U%^g \n%?\n  %i\n  %a\n" ,remember-data-file bottom)
	("Reading" ?r "* %U%^{Title}        %^g \n%?\n  %i %a\n" ,"~/project/.org/ReadingNotes.org" "Notes")))
(setq remember-annotation-functions '(org-remember-annotation)) 
(setq remember-handler-functions '(org-remember-handler)) 

;; Open the file for reviews
(defun remember-review-file ()
 "Open `remember-data-file'."
 (interactive)
 (find-file-other-window remember-data-file))
(global-set-key (kbd "C-c R") 'remember-review-file) ;; (4)

;; Allow reftex
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )
;;(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; Insert image block into org buffer (keyboard binding below)
(defun org-insert-image (cap lab)
  (interactive "sInsert Caption:\nsInsert Label:")
  (insert (concat "#+CAPTION: " cap "\n"
		  "\t#+LABEL:   " lab "\n"
		  "\t#+ATTR_LaTeX: angle=0,width=\\textwidth\n"))
)

(add-hook 'org-mode-hook 
	  (lambda ()
	    (local-set-key "\M-n" 'outline-next-visible-heading)
	    (local-set-key "\M-p" 'outline-previous-visible-heading)
	    (local-set-key (kbd "C-c i") 'org-insert-image)
	    (local-set-key (kbd "C-c m") 'org-cdlatex-mode)
	    ))

;; gist
;;(require 'org-html5presentation)

;; Publish html
;;(require 'org-publish)
;;(setq org-publish-project-alist
;;      '(
;;	
;;	;; ... add all the components here (see below)...
;;	("org-notes"
;;	 :base-directory "~/project/web/"
;;	 :base-extension "org"
;;	 :publishing-directory "~/www/"
;;	 :recursive t
;;	 :publishing-function org-publish-org-to-html
;;	 :inline-images	org-export-html-inline-images
;;	 :headline-levels 4             ; Just the default for this project.
;;	 :auto-preamble t
;;	 )
;;
;;	("org-static"
;;	 :base-directory "~/project/web/"
;;	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
;;	 :publishing-directory "~/www/"
;;	 :recursive t
;;	 :publishing-function org-publish-attachment
;;	 )
;;
;;	("org-examples"
;;	 :base-directory "~/project/web/examples/"
;;	 :base-extension ".*"
;;	 :publishing-directory "~/www/examples/"
;;	 :recursive t
;;	 :publishing-function org-publish-attachment
;;	 )
;;
;;	("org" :components ("org-notes" "org-static" "org-examples"))
;;	
;;	)
;;      )
