;; .emacs for loading preferences
(add-to-list 'load-path "~/.emacs.d")

;; Pending delete mode
(require 'delsel)
(delete-selection-mode 1)

;; scrolling stuff
(set-scroll-bar-mode 'right)
(setq mouse-wheel-progressive-speed nil) 
(setq scroll-preserve-screen-position 1
      scroll-conservatively 100000)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't ask what compile command to use (always use make -k)
(setq compilation-read-command nil)

;; Set dictionary
(setq ispell-dictionary "british")

(set-cursor-color "green")

;; options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdg-open") (output-pdf "xdg-open") (output-html "xdg-open"))))
 '(compilation-window-height 10)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/project/org/work.org")))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(paren-mode (quote blink-paren) t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))

;;(add-to-list 'default-frame-alist '(font .  "Input Mono" ))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(custom-comment-tag ((((class color) (background light)) (:foreground "blue"))))
 '(font-latex-subscript-face ((t (:height 0.8))))
 '(font-latex-superscript-face ((t (:height 0.8))))
 '(font-lock-comment-face ((nil (:foreground "cyan4"))))
 '(font-lock-preprocessor-face ((((class color) (background light)) (:foreground "blue"))))
 '(org-level-1 ((nil (:slant oblique :weight bold :height 1.2 :width normal))))
 '(shell-option-face ((t (:foreground "blue"))) t)
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "blue"))))
 '(speedbar-highlight-face ((((class color) (background light)) (:foreground "" :background "green4")))))


;; Get rid of annoying IDL mode
(setq auto-mode-alist (remove (rassoc 'idl-mode auto-mode-alist) auto-mode-alist))
(setq auto-mode-alist (remove (rassoc 'idlwave-mode auto-mode-alist) auto-mode-alist))


;; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
;; Custom key bindings
;; Skip to previous window
(defun previous-window ()
         "Previous Window"
          (interactive)
          (other-window -1)) 
(global-set-key (kbd "C-x p") 'previous-window)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Load org plans
(defun open-org-file ()
 "Open the org todo list."
 (interactive)
 (find-file "~/project/org/work.org"))
(global-set-key (kbd "C-x O") 'open-org-file) ;; (4)

;; Turn off/on word wrap with C-x w 
(global-set-key (kbd "C-x w") 'toggle-truncate-lines)

;; Compile (ie. run make)
(global-set-key "\C-x\C-m" 'compile)


;; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
;; Other functions

;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; count words: http://www.emacswiki.org/emacs/WordCount
 (defun wc (&optional start end)
   "Prints number of lines, words and characters in region or whole buffer."
   (interactive)
   (let ((n 0)
         (start (if mark-active (region-beginning) (point-min)))
         (end (if mark-active (region-end) (point-max))))
     (save-excursion
       (goto-char start)
       (while (< (point) end) (if (forward-word 1) (setq n (1+ n)))))
     (message "%3d lines, %3d words, %3d characters" (count-lines start end) n (- end start))))


;; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
;; Planner, muse, org etc
(add-to-list 'load-path "~/.emacs.d/elisp")

;; org-mode init file
(defun custom-autoload(&rest args))
(load-file "~/.emacs.d/org-init.el")

;; ESS custom stuff
(load-file "~/.emacs.d/ESS-init.el")

;; MELPA package archives http://melpa.org/
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; -----------------------------------------------------------------------------
;; Git support
;; -----------------------------------------------------------------------------
(require 'magit)
(global-set-key (kbd "C-x g s") 'magit-status)

;; ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
;; AucTeX options
(setq-default TeX-master nil)    ;; suggested by auctex wiki
(setq TeX-parse-self t)          ;; suggested by auctex wiki
(setq TeX-auto-save t)           ;; suggested by auctex wiki
(add-hook 'LaTeX-mode-hook 'flyspell-mode)    ;; Spell checking on with latex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)  ;; Math shortcuts
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ;; Add reftex mode
;;(setq reftex-plug-into-AUCTeX t)
(setq reftex-external-file-finders 
       '(("tex" . "kpsewhich -format=.tex %f") 
        ("bib" . "kpsewhich -format=.bib %f"))) 
;; Get rid of annoying fontified subscripts and superscripts
(eval-after-load "LaTeX-mode" '(fset 'tex-font-lock-suscript 'ignore)) 


;;  Colours
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-oswald)
;;(color-theme-clarity-and-beauty)
;;(color-theme-dark-laptop)
;;(color-theme-hober)

