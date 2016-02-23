;;; joseph8th.emacs --- Joseph Edwards emacs init.el

;;; Commentary:
;;  Is what it is.

;;; Code:
;   ---------------------------------------------------------------

;; Basic config
(setq user-full-name "Joseph Edwards VIII")
(setq user-mail-address "joseph8th@notroot.us")

;;--------------------------------------------------------------------
;; Set load-path for my *.el files
(setq load-path (cons "~/.emacs.d" load-path))

(package-initialize)
(setq package-enable-at-startup nil)

;; Fullscreen maximized frame in GUI mode
(modify-all-frames-parameters '((fullscreen . maximized)))

;; disable backup
(setq backup-inhibited t)
;; disable auto save
;;(setq auto-save-default nil)

;; Auto-revert to disk on file change
(global-auto-revert-mode t)

;;(setq load-path (cons "~/.emacs.d/org-confluence" load-path))
;;(require 'org-confluence)
(require 'ox-confluence)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(display-time-mode t)
 '(ido-enable-flex-matching t)
 '(org-export-backends (quote (ascii html icalendar latex md confluence)))
 '(show-paren-mode t)
 '(tabbar-separator (quote (0.3)))
 '(tool-bar-mode nil))

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Undo and redo window configurations C-c left and C-c right
(winner-mode 1)

;; Word wrap on vertical split
(setq truncate-partial-width-windows nil)

;; disable backup files
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; disable toolbar-mode in GUI
(tool-bar-mode -1)

;; hide DOS ^M line-endings
(defun dos-remove-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; split window vertically
;; (split-window-right)

;; 256 colors maybe?
(setq load-path (cons "~/.emacs.d/term" load-path))

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'remove-dos-eol)

; ------------------------------------------------------------------------
; Dave's .emacs (Joseph8th's prof)
; UNM version, hacked down for student distribution

;;;;;; Customizing the screen

; Suppresses the menu-bar (I'd rather have the extra line to work with)
;  Comment out (place a ';' at the beginning of) the next line to keep the menu bar

;(menu-bar-mode -1)                          ; I *never* use the stupid thing..

; Show the time in the mode line
(display-time)                              ; how late am I?

; Don't show the 'startup screen'
(setq inhibit-startup-message t)            ; ok I've seen the copyleft &c

;;;;;; Command customizations

;;; Helper functions for customizing a few commands

; ^T - This version always exchanges the prior two chars, so it's
;      context-free as any bozo could tell it should've been all along
(defun dha-ctl-t ()
  (interactive)
  (transpose-chars -1)
  (forward-char 1))

; Send current line to top of screen (on C-c C-l)
(defun dha-line-to-top () (interactive) (recenter 0))

; Finally f@*#$g make switch-to-buffer insist on an
; an existing buffer, unless given a prefix argument
(defun dha-switch-to-buffer (buf)
  (interactive
   (list (read-buffer
	  (if current-prefix-arg
	      "Switch to buffer: " "Switch to existing buffer: ")
	  nil (not current-prefix-arg))))
  (switch-to-buffer buf))

; Plausible suggestions for code from the ACE folks
;(setq-default indent-tabs-mode nil)

(setq-default nuke-trailing-whitespace-p t)

;;; Global key bindings

(global-unset-key "\^Xn")                   ; I mistype ^Xn too much.

(global-unset-key "\^T")                    ; make ^T always transpose
(global-set-key "\^T" 'dha-ctl-t)           ;  previous two chars

(global-unset-key "\^Xb")           ; kill normal switch-to-buffer
(global-set-key "\^Xb" 'dha-switch-to-buffer) ; use mine instead

(global-set-key "\^C\^R" 'replace-string)   ; ^C^R put replace on a key already!
(global-set-key "\^C\^Q" 'query-replace)    ; ^C^Q ditto query replace!
(global-set-key "\^C\^L" 'dha-line-to-top)  ; ^C^L point line to top of window

(global-set-key "\C-xc" 'compile)           ; ^Xc do compilation command
(global-set-key "\C-x*" 'shell)             ; ^X* start or switch to *shell*

;;;Set the region to a C program and then do M-x ctest
(fset 'ctest
   [?\M-w ?\C-x ?\C-f ?T ?e ?s ?t ?. ?c ?\C-m ?\C-x ?h ?\C-w ?\C-y ?\M-y ?\C-  ?\M-> ?\C-w ?\C-x ?\C-s ?\C-x ?c ?\C-a ?\C-k ?g ?c ?c ?  ?- ?g ?  ?- ?W ?a ?l ?l ?  ?- ?a ?n ?s ?i ?  ?- ?P ?\C-? ?p ?e ?d ?a ?n ?t ?i ?c ?  ?T ?e ?s ?t ?. ?c ?  ?- ?o ?  ?T ?e ?s ?t ?\; ?. ?/ ?T ?e ?s ?t ?\C-m ?\C-x ?b ?\C-m])

;;; Keep a much bigger shell command history for M-p
(setq comint-input-ring-size 1000)

;;; Avoid unicodeisms in my shell buffers
(defun my-shell-customizations ()
  "Set shell encoding"
  (set-buffer-process-coding-system 'us-ascii-unix 'us-ascii-unix)
)
(setq shell-mode-hook 'my-shell-customizations)

;;; End of Dave's .emacs
;;; UNM version, hacked down for CS351'ers, 251'ers, 259'ers etc etc

;; ====================================================================
;; Joseph8th's .emacs -- additions to Dave's emacs...
;; --------------------------------------------------------------------

;; Set up the package manager of choice. Supports "el-get" and "package.el"
(setq pmoc "package.el")

;; List of all wanted packages
(setq
 wanted-packages
 '(
   color-theme
   autopair
   auto-complete
   flycheck
   ido-hacks
   ido-vertical-mode
   js3-mode
   magit
   multiple-cursors
   switch-window
   color-theme-sanityinc-tomorrow
   projectile
   helm
   helm-projectile
   fill-column-indicator
   yasnippet
   python
   python-mode
   ipython
   pyenv-mode
   python-django
   django-mode
))

;; Package manager and packages handler
(defun install-wanted-packages ()
  "Install wanted packages according to a specific package manager"
  (interactive)
  (cond
   ;; package.el
   ((string= pmoc "package.el")
    (require 'package)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (add-to-list 'package-archives '("marmelade" . "http://marmalade-repo.org/packages/"))
    (package-initialize)
    (let ((need-refresh nil))
      (mapc (lambda (package-name)
	  (unless (package-installed-p package-name)
	(set 'need-refresh t))) wanted-packages)
      (if need-refresh
	(package-refresh-contents)))
    (mapc (lambda (package-name)
	(unless (package-installed-p package-name)
	  (package-install package-name))) wanted-packages)
    )
   ;; el-get
   ((string= pmoc "el-get")
    (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
    (unless (require 'el-get nil 'noerror)
      (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
    (el-get 'sync wanted-packages))
   ;; fallback
   (t (error "Unsupported package manager")))
  )

;; Install wanted packages
(install-wanted-packages)

;; -------------------------------------------------------------------
;; Mode and config stuff down here
;; -------------------------------------------------------------------
(load-theme 'sanityinc-tomorrow-bright)

(require 'fill-column-indicator)
(setq fci-rule-column 80)

(add-hook 'js3-mode-hook 'fci-mode)

(add-hook 'python-mode-hook 'fci-mode)
(setq python-shell-interpreter "/usr/bin/ipython3")

(add-hook 'emacs-lisp-mode-hook 'fci-mode)

;;; LaTeX support
;;;(load "auctex.el" nil t t)
;;;(load "preview-latex.el" nil t t)

;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode
(global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------

;; Projectile
(projectile-global-mode)

;; Cython mode
;; (require 'cython-mode)

;; web-mode for HTML with embedded code
(require 'web-mode)

;; Go mode
(require 'go-mode)

;; EditorConfig
(load "editorconfig")
(editorconfig-mode 1)

;; php-mode-improved PHP mode
(autoload 'php-mode "php-mode-improved" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(defun my-prep-php-mode ()
    (editorconfig-mode 1)
    (fci-mode 1)
)
(add-hook 'php-mode-hook 'my-prep-php-mode)

(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
	(goto-char (cdr langelem))
	(vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
	(goto-char (cdr langelem))
	(vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; Multiple major modes
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

;; Toggle between PHP & HTML Helper mode.  Useful when working on
;; php files, that can been intertwined with HTML code
(defun toggle-php-html-mode ()
  (interactive)
  "Toggle mode between PHP & Web modes"
  (cond ((string= mode-name "Web")
	 (php-mode))
	((string= mode-name "PHP")
	 (web-mode))))

(global-set-key [f5] 'toggle-php-html-mode)

;; pretty print xml region
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    ;; split <foo><foo> or </foo><foo>, but not <foo></foo>
    (while (search-forward-regexp ">[ \t]*<[^/]" end t)
      (backward-char 2) (insert "\n") (incf end))
    ;; split <foo/></foo> and </foo></foo>
    (goto-char begin)
    (while (search-forward-regexp "<.*?/.*?>[ \t]*<" end t)
      (backward-char) (insert "\n") (incf end))
    (indent-region begin end nil)
    (normal-mode))
  (message "All indented!"))

(eval-after-load 'nxml-mode
  '(define-key nxml-mode-map (kbd "C-c C-f") 'pretty-print-xml-region))

;; ====================================================================
;; Other package configs

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Enable flycheck globally
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; Autopair
;; (add-to-list 'load-path "/path/to/autopair") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; magit
(require 'magit)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; switch-window
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(require 'pyvenv)

;;--------------------------------------------------------------------
;; Org-Mode stuff

(add-to-list 'load-path "~/elisp/org-mode/lisp")
(add-to-list 'load-path "~/elisp/org-mode/contrib/lisp" t)
(require 'org)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (python . t)
   ))

;; IDO
(require 'ido)
(ido-mode t)
(ido-vertical-mode)

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(global-set-key (kbd "C-S-x C-S-f") 'ido-find-file-in-tag-files)


;; ===================================================================
;; AUTO-ADDED STUFF AFTER THIS!!!


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-selected ((t (:inherit tabbar-default :background "gray30" :foreground "gray90"))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background "gray40")))))
