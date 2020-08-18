;; Desactive la interfaz del mouse al inicio
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Sin pantalla de bienvenida
(setq inhibit-startup-message t)

;; Titulo emacs para el editor
(setq frame-title-format "emacs")

;; Color indigo para el cursor
(set-cursor-color "#3949ab")

;; Realzado de la línea donde se encuentra al cursor
(global-hl-line-mode 1)

(provide 'apariencia)
