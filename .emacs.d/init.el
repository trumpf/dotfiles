
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

(when (eq system-type 'windows-nt)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

(setq-default tab-width 4 indent-tabs-mode nil)

;; Backup files nad auto-save files
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

(add-to-list 'load-path "~/.emacs.d/elisp")

;; Enable Cua Mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; For Auto Install
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  (auto-install-compatibility-setup))

;; Python mode
(when (require 'python-mode nil t)
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("python" . python-mode)
                                     interpreter-mode-alist))
  (autoload 'python-mode "python-mode" "Python editing mode." t))

;; To save buffers which have shebang with enabling executable bits
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Anything
(when (require 'anything nil t)
  (setq
   anything-idle-delay 0.3
   anything-input-idle-delay 0.2
   anything-candidate-number-limit 100
   anything-quick-update t
   anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (when (require 'aything-complete nil t)
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    (descbinds-anything-install))

  (add-to-list 'anything-sources 'anything-c-source-emacs-commands)
  (add-to-list 'anything-sources 'anything-c-source-files-in-current-dir)
  (define-key global-map (kbd "C-l") 'anything)
  (define-key global-map (kbd "M-y") 'anything-show-kill-ring))

;; Misc
(setq inhibit-startup-message t)
