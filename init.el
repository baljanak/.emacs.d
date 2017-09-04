;;Space-Cadet Keyboard Layout
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)

(require 'ido)
(setq ido-everywhere t)
(setq ido-default-buffer-method 'selected-window)
(ido-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

(require 'whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)
(package-install 'exec-path-from-shell)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(load "$HOME/.emacs.d/go.el")
(load "$HOME/.emacs.d/git.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode yaml-mode wgrep magit go-rename go-eldoc exec-path-from-shell dockerfile-mode company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 141 :width normal)))))
