(require 'package)
(setq package-archives
      '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)



(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)



(setq c-default-style "linux"
      c-basic-offset 4)



(use-package eglot
  :ensure nil
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   (python-mode . eglot-ensure)))



(use-package vertico
  :init
  (vertico-mode))
(use-package marginalia
  :init
  (marginalia-mode))




(use-package corfu
  :init
  (global-corfu-mode))
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))


(use-package projectile
  :config
  (projectile-mode +1)
  :bind
  ("C-c p" . projectile-command-map))

(use-package ace-window
  :bind
  ("M-o" . ace-select-window))

(use-package avy
  :bind
  ("M-;" . avy-goto-char))



(use-package magit)


(use-package modus-themes
  :config
  (load-theme 'modus-vivendi t))

(use-package treemacs
  :config
  (treemacs-follow-mode t) ; 自动跟随当前文件
  (treemacs-filewatch-mode t) ; 监听文件变化
  :bind
  ("C-c t" . treemacs)) ; 全局快捷键

(global-hl-line-mode 1)
(column-number-mode t)
(electric-pair-mode 1)
(add-hook 'prog-mode-hook #'show-paren-mode)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq toggle-scroll-bar -1)
(savehist-mode 1)
(set-frame-font "Monaco 10" nil t)
(setq confirm-kill-emacs 'yes-or-no-p)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(defun open-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq make-backup-files nil)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
