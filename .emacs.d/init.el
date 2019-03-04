;; init.el

;; generate TAGS file
;;fd .go -E debug-files/ | xargs etags

;; global shortcuts
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
;; don't create lockfiles
(setq create-lockfiles nil)

;; refresh open buffers periodically
(global-auto-revert-mode t)

;; adjust buffer window sizes using Shift + Cntl + Arrow Key
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

;;Temporarily maximize active buffer while maintaining buffer layout
(defun toggle-maximize-buffer () "Maximize active buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(global-set-key (kbd "C-x q") 'toggle-maximize-buffer)

(defun term-toggle-line-mode () "Toggle between char and line mode"
    (interactive)
    (if (term-in-line-mode)
      (term-char-mode)
      (term-line-mode)))

(add-hook 'term-mode-hook (lambda ()
   (define-key term-mode-map
     (kbd "C-c j")
     'term-toggle-line-mode)
))

;; disable startup message
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)

; IDO-MODE advanced file buffer 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Show column number
(setq column-number-mode t)

;; highlight matching paren or bracket
(show-paren-mode 1)

;;org-mode
;; write timestamp when TODO's are marked DONE
(setq org-log-done 'time)

;; run go fmt on save
(add-hook 'before-save-hook #'gofmt-before-save)

;; navigate between buffers using Shift-Arrow Key
(windmove-default-keybindings)
			                      
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dimmer-fraction 0.4)
 '(dimmer-use-colorspace :cielab)
 '(package-archives
   (quote
    (("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (groovy-mode zenburn-theme dimmer multi-term go-mode)))
 '(term-bind-key-alist
   (quote
    (("C-c C-c" . term-interrupt-subjob)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-c j" . term-toggle-line-mode)
     ("M-s" . isearch-forward)
     ("M-r" . isearch-backward)
     ("C-m" . term-send-raw)
     ("M-f" . term-send-forward-word)
     ("M-b" . term-send-backward-word)
     ("M-o" . term-send-backspace)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("C-r" . term-send-reverse-search-history)
     ("M-," . term-send-input)
     ("M-." . comint-dynamic-complete)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; install all packages in 'package-selected-packages if they don't exist
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; load theme on startup
(load-theme 'zenburn t)

;; enable dimmer mode
(dimmer-mode)
