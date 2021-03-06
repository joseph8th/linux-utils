;;; editorconfig-fnmatch-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (editorconfig-fnmatch-p) "editorconfig-fnmatch"
;;;;;;  "editorconfig-fnmatch.el" (22080 53042 447126 901000))
;;; Generated autoloads from editorconfig-fnmatch.el

(autoload 'editorconfig-fnmatch-p "editorconfig-fnmatch" "\
Test whether NAME match PATTERN.

Matching ignores case if `case-fold-search' is non-nil.

PATTERN should be a shell glob pattern, and some zsh-like wildcard matchings can
be used:

*           Matches any string of characters, except path separators (/)
**          Matches any string of characters
?           Matches any single character
\[name]      Matches any single character in name
\[^name]     Matches any single character not in name
{s1,s2,s3}  Matches any of the strings given (separated by commas)
{min..max}  Matches any number between min and max

\(fn NAME PATTERN)" nil nil)

;;;***

;;;### (autoloads nil nil ("editorconfig-fnmatch-pkg.el") (22080
;;;;;;  53042 542258 476000))

;;;***

(provide 'editorconfig-fnmatch-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; editorconfig-fnmatch-autoloads.el ends here
