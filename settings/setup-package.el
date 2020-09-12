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
     iedit
     typescript-mode
     tide
     company
     neotree
     all-the-icons)))

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

;; Iniciar neotree en emacs
(require 'neotree)
(require 'all-the-icons)

(global-set-key [f8] 'neotree-toggle)

(unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)

(setq inhibit-compacting-font-caches t)


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

;; Tide mode para emacs
;; (require 'typescript-mode)
;; (require 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

(provide 'setup-package)
