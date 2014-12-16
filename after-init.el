
;;; System specific stuff
;;;; Make find-function work
(setq source-directory "~/projects/emacs/src")
(setq find-function-C-source-directory "~/projects/emacs/src")

;;;; Fsharp
(setq inferior-fsharp-program "C:/Program Files (x86)/Microsoft SDKs/F#/3.1/Framework/v4.0/Fsi.exe")
(setq fsharp-compiler "C:/Program Files (x86)/Microsoft SDKs/F#/3.1/Framework/v4.0/Fsc.exe")
(add-hook 'fsharp-mode-hook
          (lambda () (setq-local outline-regexp "///+")))

;;;; Common Lisp
(setq slime-lisp-implementations
      '((sbcl ("f:/Programs/SBCL/sbcl.exe")
              :coding-system utf-8-unix)
        (abcl ("F:/Media/Documents/versioned/svn/abcl/abcl.bat"))
        (ccl ("F:/Media/Documents/versioned/svn/ccl/wx86cl.exe"))
        (ccl64 ("F:/Media/Documents/versioned/svn/ccl/wx86cl64.exe"))

        (clisp (nil))))

;;;; System specific fixes

(load-theme 'solarized-dark)
(evil-mode)

(add-hook 'window-setup-hook
          (lambda () (w32-send-sys-command #xf030)))

;;;; hunspell

(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

(after 'ispell
       (add-to-list 'ispell-dictionary-alist '(("english"
                                                "[[:alpha:]]"
                                                "[^[:alpha:]]"
                                                "[']"
                                                t
                                                ("-d" "en_US")
                                                nil
                                                utf-8)))
       (setq-default ispell-program-name "hunspell")
       (setq ispell-local-dictionary-alist ispell-dictionary-alist)
       (setq ispell-hunspell-dictionary-alist ispell-dictionary-alist))

;;;; Geiser

(setq geiser-racket-binary "f:/Programs/Racket/Racket")

;;;; Define important variables

(defvar emacs-config-dir "f:/Media/Dropbox/core-projects/emacs-config/")

;;;; Load system non-specific stuff
(add-to-list 'load-path emacs-config-dir)
(load "config-main.el")
