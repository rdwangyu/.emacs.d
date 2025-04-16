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
(tool-bar-mode -1)
(when (display-graphic-p) (toggle-scroll-bar -1))
(savehist-mode 1)
(setq c-default-style "linux"
      c-basic-offset 4)

(global-set-key (kbd "C-;") 'avy-goto-char)

(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode t))

(use-package vterm
  :ensure t
  :config
  (setq vterm-max-scrollback 10000)
  (setq vterm-shell "/bin/bash")
  (define-key vterm-mode-map (kbd "C-c C-c") 'vterm-send-C-c))
(defun my/vterm-new ()
  (interactive)
  (let ((buf (generate-new-buffer-name "*vterm*")))
    (vterm buf)))
(global-set-key (kbd "C-c n") 'my/vterm-new)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c++-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package treemacs
  :ensure t
  :config
  (treemacs-load-theme "Default"))

(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs)
  :commands (lsp-treemacs-call-hierarchy))
(global-set-key (kbd "C-c l c h") 'lsp-treemacs-call-hierarchy)
(global-set-key (kbd "C-c l f r") 'lsp-find-references)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(with-eval-after-load 'lsp-mode
  (require 'flycheck)
  (setq lsp-prefer-flycheck t))

(use-package clang-format
  :ensure t
  :hook (c++-mode . (lambda ()
                      (local-set-key (kbd "C-c f") 'clang-format-buffer))))
(setq clang-format-style-option "file")

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)


(use-package ace-window
  :ensure t)
(global-set-key (kbd "M-o") 'ace-window)

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)


(use-package popwin
  :ensure t)
(require 'popwin)
(popwin-mode 1)

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))
(use-package pdf-view-restore
  :ensure t
  :hook (pdf-view-mode . pdf-view-restore-mode))
(setq pdf-view-restore-filename "~/.emacs.d/custom-pdf-restore-file")

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t))

(set-frame-font "Monaco 10" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(indent-guide xterm-color popwin lsp-ui flycheck company clang-format ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'tramp)
(setq tramp-default-method "ssh")
;;;(global-set-key (kbd "C-c s") 
;;;                (lambda () (interactive) 
;;;                  (find-file "/ssh:greatwall@192.168.2.192:dev/dy-gold-recovery-sys")))

(defun open-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c e") 'open-emacs-config)

(provide 'init)
