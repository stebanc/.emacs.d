;; Establecer el camino a las dependencias
(setq custom-config-directory
      (expand-file-name "settings" user-emacs-directory))

;; Configurar la ruta de carga
(add-to-list 'load-path custom-config-directory)

;; Mantenga la configuración personalizada de emacs en un archivo separado
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Requiere todo...

(require 'apariencia)
(require 'theme)
(require 'setup-package)
(require 'setup-custom)

