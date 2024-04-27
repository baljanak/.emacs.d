;; Default indent
(setq python-indent-offset 4)

;; elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; company
(use-package company
  :ensure t
  :init
  (global-company-mode))

(provide 'python-config)
