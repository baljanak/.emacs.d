(require 'package)



(setq package--init-file-ensured t ; Don't modify init
      package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)
(package-install 'exec-path-from-shell)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Ensure we have use-package
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
(require 'use-package)

(require 'ido)
(setq ido-everywhere t)
(setq ido-default-buffer-method 'selected-window)
(ido-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

(require 'whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Auto update packages
(use-package auto-package-update
  :ensure t
  :demand t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 30)
  (auto-package-update-maybe))

;; ;; Fira Code
;; ;; brew tap homebrew/cask-fonts
;; ;; brew cask install font-fira-code
;; ;; Install fira code symbols:
;; ;; https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip
;; (package-install 'fira-code-mode)
;; (use-package fira-code-mode
;;   :custom (fira-code-mode-disabled-ligatures '("x" "[]")) ;; List of ligatures to turn off
;;   :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes

(provide 'package-config)
