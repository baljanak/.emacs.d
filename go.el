(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOROOT")

(package-install 'go-mode)
(package-install 'go-eldoc)
(package-install 'go-rename)
(package-install 'company-go)

;; go get golang.org/x/tools/cmd/godoc
;; go get golang.org/x/tools/cmd/gorename
;; go get github.com/nsf/gocode
;; go get golang.org/x/tools/cmd/cover
;; go get golang.org/x/tools/cmd/goimports
;; go get golang.org/x/tools/cmd/oracle
;; go get github.com/dougm/goflymake
;; go get golang.org/x/tools/cmd/vet

(add-hook 'go-mode-hook 'flyspell-prog-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(load-file "$GOPATH/src/github.com/dougm/goflymake/go-flymake.el")

(require 'compile)
(defun go-compile ()
  (set (make-local-variable 'compile-command) "go build -v && go test -v && go install"))
(add-hook 'go-mode-hook 'go-compile)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))
