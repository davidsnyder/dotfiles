;; refresh open buffers periodically
(global-auto-revert-mode t)

; flymake syntax warnings on file save
(require 'flymake)

; IDO-MODE advanced file buffer 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

;; highlight matching paren or bracket
(show-paren-mode 1)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			                      ("melpa" . "http://melpa.org/packages/")))
			                      
(put 'erase-buffer 'disabled nil)
