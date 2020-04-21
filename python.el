;; Default indent
(setq python-indent-offset 4)

;; Jedi
(use-package jedi
  :ensure t
  :defer t
  :config
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  :hook (python-mode . jedi:setup))

;; Company mode
(use-package company-jedi
  :ensure t
  :defer t
  :after (jedi company helm-company)
  :hook (python-mode . (lambda () (add-to-list 'company-backends 'company-jedi))))

(provide 'python-config)
