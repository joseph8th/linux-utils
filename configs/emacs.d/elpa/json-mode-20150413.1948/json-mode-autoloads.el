;;; json-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (json-mode-beautify json-mode-show-path json-mode)
;;;;;;  "json-mode" "json-mode.el" (22047 60137 241242 351000))
;;; Generated autoloads from json-mode.el

(autoload 'json-mode "json-mode" "\
Major mode for editing JSON files

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(autoload 'json-mode-show-path "json-mode" "\


\(fn)" t nil)

(autoload 'json-mode-beautify "json-mode" "\
Beautify / pretty-print the active region (or the entire buffer if no active region).

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("json-mode-pkg.el") (22047 60137 318955
;;;;;;  103000))

;;;***

(provide 'json-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; json-mode-autoloads.el ends here
