(setq warning-minimum-level :emergency)

(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (cider clojure-mode db-pg pg cobol-mode slime ## typescript-mode lsp-mode rustic symbol-overlay ocp-indent helm utop magit flycheck tuareg caml haskell-mode dashboard workgroups2 company racer markdown-mode)))
 '(safe-local-variable-values
   (quote
    ((mocha-reporter . "spec")
     (mocha-project-test-directory . "test")
     (mocha-options . "--recursive --compilers js:@babel/register")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(setq tab-width 4)
(setq js-indent-level 2)

(setq savehist-additional-variables '(compile-command))
(savehist-mode 1)

(setq racer-rust-src-path "/home/newby/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/")

(setq visible-bell t)

(add-hook 'before-save-hook 'whitespace-cleanup)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
;; (setq ido-show-dot-for-dired t)

(workgroups-mode 1)

(require 'dashboard)
(dashboard-setup-startup-hook)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "/home/newby/.opam/4.10.0/share/emacs/site-lisp")

;; Add the opam lisp dir to the emacs load path
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(add-to-list 'auto-mode-alist '("\\.mligo" . tuareg-mode))

(require 'symbol-overlay)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)

(setq rust-format-on-save t)
(setq rustic-format-on-save t)


(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)

;; set a default font
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

;; specify font for all unicode characters
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))
