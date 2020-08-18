(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (mapc (lambda (package)
	  (when (not (package-installed-p package))
	    (package-install package)))
	packages)
  (delete-other-windows))

;; Instalar extensiones
(defun init--install-packages ()
  (packages-install
   '(auto-complete
     yasnippet
     yasnippet-snippets
     iedit)))

;; (defun init--install-packages ()
;;   (packages-install
;;    '(auto-complete
;;      yasnippet
;;      yasnippet-snippets
;;      paredit
;;      magit)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Iniciar auto-compleatdo en emacs
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Iniciar yasnippet en emacs
(require 'yasnippet)
;; Use only own snippets, do not use bundled ones
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; Iniciar iedit en emacs
(require 'iedit)

(provide 'setup-package)
