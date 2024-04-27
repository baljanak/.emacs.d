;;Space-Cadet Keyboard Layout
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)

;; Frame customization
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; ;; Set default font
;; (set-face-attribute 'default nil
;;                     :family "Fira Code"
;;                     :height 120
;;                     :weight 'normal
;;                     :width 'normal)

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    tramp
    use-package
    exec-path-from-shell
    whitespace
    ido
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    company
    magit                           ;; Git integration
    ;; material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
;; (load-theme 'material-light t)      ;; Load material theme
(global-display-line-numbers-mode t)       ;; Enable line numbers globally

;; yes-no
(fset 'yes-or-no-p 'y-or-n-p)

;; exec path
(exec-path-from-shell-initialize)

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; ido
(setq ido-everywhere t)
(setq ido-default-buffer-method 'selected-window)
(ido-mode 1)

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)
;; (remove-hook 'elpy-modules 'elpy-module-flymake)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(setq-default flycheck-flake8-maximum-line-length 120)


;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; blacken
(add-hook 'python-mode-hook 'blacken-mode)

;; Enable company
(global-company-mode t)

(setq python-indent-offset 2)


;; User-Defined init.el ends here


;; (load "$HOME/.emacs.d/package.el")
;; (load "$HOME/.emacs.d/go.el")
;; (load "$HOME/.emacs.d/git.el")
;; (load "$HOME/.emacs.d/python.el")
;; (load "$HOME/.emacs.d/dockerfile.el")
