;;;
;;;  Pan's .emacs file
;;;


;; Visualization
(show-paren-mode t)
(setq inhibit-startup-message t)
(toggle-menu-bar-mode-from-frame)
(toggle-tool-bar-mode-from-frame)
(toggle-scroll-bar -1)
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color "green")
(column-number-mode 1)
;; Global bindings
(global-set-key [f3] 'shell)
(global-set-key [f4] 'goto-line)
(global-set-key [f5] 'compile)
(global-set-key "\C-h" 'delete-backward-char)

;; FullScreen
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;; Font Locking, Programming Modes, and Compilation settings
;;

(global-font-lock-mode 1)
;; maximum colors
(setq font-lock-maximum-decoration t)

;; extra key bindings
(global-set-key "\M-C" 'compile)
(global-set-key "\C-^" 'next-error)
(global-set-key "\C-\M-g" 'goto-line)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
  ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:
(require 'inf-haskell)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-decl-scan)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook
   (function
    (lambda ()
      (setq haskell-program-name "ghci")
      (setq haskell-ghci-program-name "ghci6"))))

;; Show the whitespace
(setq-default show-trailing-whitespace t)

;; Plx files
(setq auto-mode-alist (cons '("\\.plx$" . perl-mode) auto-mode-alist))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("/home/pan/allthesmallthings/20111/lenguajesFuncionales/agda/DTFL/DTFL/" "/home/pan/allthesmallthings/20111/lenguajesFuncionales/agda/DTFL/DTFL/src/" "/home/pan/allthesmallthings/agda/code/"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; (defvar agda2-version "2.2.11")
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                ("/home/pan/.cabal/share/Agda-2.2.10/emacs-mode/agda2.el")))

(load-file "/home/pan/.cabal/share/Agda-2.2.10/emacs-mode/agda2.el")
(setq ispell-dictionary "spanish")