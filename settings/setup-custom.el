;; Sin archivos de respaldo
(setq make-backup-files nil)

;; Resalte paréntesis coincidentes cuando el punto está en ellos.
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Mostrar siempre los números de línea y columna
(setq column-number-mode t)

;; Responder solo 'y' or 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Modo ido
(ido-mode)

;; Iniciar Auto Brackets electric-pair-mode para emacs
(electric-pair-mode 1)

;; Abrir la shell con f12
(global-set-key [f12] 'shell)

(provide 'setup-custom)
