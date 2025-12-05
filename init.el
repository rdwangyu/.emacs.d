(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
(eval-when-compile
  (require 'use-package))

(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode t))
(use-package lsp-mode
  :ensure t
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (csharp-mode . lsp)
	 )
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l")
  )
(use-package flycheck
  :ensure t
  :init
  (setq flycheck-global-modes '(not t))
  :hook
  (c++-mode . flycheck-mode)
  (c-mode . flycheck-mode)
  (csharp-mode . flycheck-mode))
(with-eval-after-load 'lsp-mode
  (require 'flycheck)
  (setq lsp-prefer-flycheck t))
(use-package format-all
  :ensure t
  :hook ((c-mode c++-mode csharp-mode) . format-all-mode)
  :config
  (setq format-all-formatters
	'((c-mode          . ("clang-format"))
	  (c++-mode        . ("clang-format"))
	  (csharp-mode     . ("dotnet-csharpier")))))
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)
(use-package ace-window
  :ensure t)
(use-package company
  :ensure t)
(use-package popwin
  :ensure t)
(require 'popwin)
(popwin-mode 1)
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t))
(column-number-mode t)
(electric-pair-mode t)
(add-hook 'prog-mode-hook #'show-paren-mode)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq toggle-scroll-bar -1)
(savehist-mode 1)
(set-frame-font "Monaco 10" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(defun open-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq make-backup-files nil)
(setq c-default-style "linux"
      c-basic-offset 4)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-c l c h") 'lsp-treemacs-call-hierarchy)
(global-set-key (kbd "C-c l f r") 'lsp-find-references)
(global-set-key (kbd "C-c e") 'open-emacs-config)
(global-set-key (kbd "M-o") 'ace-select-window)
(global-set-key (kbd "C-c f") 'format-all-buffer)
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

(provide 'init)
