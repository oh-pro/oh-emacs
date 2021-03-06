(setq auto-save-default nil)
(setq make-backup-files nil)

;; recentf stuff
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "<f1>") 'recentf-open-files)

;; Use cmd key for meta
;; https://superuser.com/questions/297259/set-emacs-meta-key-to-be-the-mac-key
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'super)

(use-package windresize
  :defer t
  :bind
  ("C-c w" . windresize)
  )

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f"))
  :bind
  ([remap other-window] . switch-window))

;; C-c C-, e m
(add-to-list 'org-structure-template-alist '("emacs" . "src emacs-lisp"))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2021/bin/universal-darwin"))

(use-package latex
  :defer t
  :ensure auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :bind
  (:map LaTeX-mode-map
	("M-n" . outline-next-heading)
	("M-p" . outline-previous-heading)
	("C-c C-c" . TeX-command-run-all)
	("C-c l" . TeX-error-overview))

  :config
  ;; basic configuration
  (setq TeX-auto-save t)
  (setq TeX-save-query nil)
  ;; (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  ;; (setq-default TeX-master t)

  ;; start reftex-mode
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  ;; enable source specials or SyncTeX to be enable to compile it to a forward / backword searching.
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

  ;; always start emacs server when viewing in evance for backward search
  (setq TeX-source-correlate-start-server t)

  ;; set preview programs
  (setq TeX-view-program-list
	'(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
  (setq TeX-view-program-selection '((output-pdf "Skim")))
  )
