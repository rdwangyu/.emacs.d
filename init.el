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

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((c++-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package clang-format
  :ensure t
  :hook (c++-mode . (lambda ()
                      (local-set-key (kbd "C-c f") 'clang-format-buffer))))
(setq clang-format-style-option "file")


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

(provide 'init)
