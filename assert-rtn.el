;;; assert-rtn.el --- A more functional implementation of `assert'
;; Author: Neil Smithline
;; Maintainer: 
;; Copyright (C) 2012, Neil Smithline, all rights reserved.;; Created: Wed May 30 20:01:22 2012 (-0400)
;; Version: 1.0
;; Last-Updated: 
;;           By: 
;;     Update #: 0
;; URL: 
;; Keywords: 
;; Compatibility: 
;; 
;; Features that might be required by this library:
;;
;;   font-lock-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; As the `assert' special form does not return a meaningful value, it
;; frequently disrupts a functional style of programming. It is common
;; to use `progn' or `prog1' to work around this.
;;
;; `assert-rtn' behaves like `assert' but allows you to specify a
;; return value, raising the `assert' functionality to that of
;; functional programming.
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

(defmacro assert-rtn (rtn-value form &rest args)
  "`assert' with the addition of a return value.
rtn-value will only be evaluated if assertion passes.
Equivalent to:
  (progn 
     (eval (concat 'assert form args))
     (eval rtn-value))" 
  `(progn 
     (assert ,form ,@args)
     ,rtn-value))

(defconst assert-rtn-font-lock-keywords 
  '(("(\\(assert-rtn\\)[[:space:]]+" (1 font-lock-warning-face))
  "`font-lock-mode' regexp for `assert-rtn' in `emacs-lisp-mode'."))

;; Add `assert-rtn' keywords to `font-lock-keywords'.  for
;; `emacs-lisp-mode-hook' and `lisp-interaction-mode-hook'.
(add-hook 'emacs-lisp-mode-hook 
	  #'(lambda () (font-lock-add-keywords nil assert-rtn-font-lock-keywords)))
(add-hook 'lisp-interaction-mode-hook 
	  #'(lambda () (font-lock-add-keywords nil assert-rtn-font-lock-keywords)))

(provide 'assert-rtn)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; assert-rtn.el ends here
