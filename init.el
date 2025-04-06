(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(eval-when-compile
  (require 'use-package))

(electric-pair-mode t)
(add-hook 'prog-mode-hook #'show-paren-mode)
(column-number-mode t)
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(when (display-graphic-p) (toggle-scroll-bar -1))
(savehist-mode 1)
;;(setq display-line-numbers-type 'relative)
(setq c-default-style "linux"
      c-basic-offset 4)

(use-package ace-window
  :ensure t)
(global-set-key (kbd "M-o") 'ace-window)

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

(load-theme 'manoj-dark t)

(use-package popwin
  :ensure t)
(require 'popwin)
(popwin-mode 1)

(set-frame-font "Monaco 10" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" default))
 '(package-selected-packages
   '(org-pomodoro buffer-move solarized-theme popwin melancholy-theme company ace-window)))
