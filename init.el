;;Space-Cadet Keyboard Layout
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)

;; Frame customization
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load "$HOME/.emacs.d/package.el")
(load "$HOME/.emacs.d/go.el")
(load "$HOME/.emacs.d/git.el")
(load "$HOME/.emacs.d/python.el")
