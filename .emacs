;; .emacs.d/init.el

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
    use-package                     ;; Install use package
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; Black formatting on save
    material-theme                  ;; Theme
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

(require 'use-package)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(tool-bar-mode -1)                  ;; Disable the toolbar
(scroll-bar-mode -1)                ;; Disable the mode
(global-hl-line-mode +1)            ;; Highlight the current line
(delete-selection-mode 1)           ;; Delete selected text


(add-to-list 'default-frame-alist
	     '(font . "Fira Code-16"))
(setq
   backup-directory-alist
    '(("." . "~/.saves/")))    ; don't litter my fs tree

;; Setup icons
(use-package all-the-icons
  :ensure t)

;; Doom Themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config))

;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 35)                  ;; modeline height
  ;; Display icons in the modeline
  (setq doom-modeline-icon (display-graphic-p))
  ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)
  ;; The maximum displayed length of the branch name of version control.
  (setq doom-modeline-vcs-max-length 50)
  )


;; Setup neotree file navigation
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'ascii 'arrow))
;; Change the project root when projectile changes it
(setq projectile-switch-project-action 'neotree-projectile-action)

;; Install which key for helping with keybindings
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Setup magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))



;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)


;; Enable Flycheck - remove flymake and replace it with fly check
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable projectile
(use-package projectile
  :ensure t
  :config

  ;; Tell projectile to search this folder for projects
  (setq projectile-project-search-path '("~/code/" "~/wave/src"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; Enable projectile
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;; Install helm-ag
(use-package helm-ag
  :ensure t)

;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (doom-modeline material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
