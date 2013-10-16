
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

;; Python mode
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; To save buffers which have shebang with enabling executable bits
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Misc
(setq inhibit-startup-message t)
