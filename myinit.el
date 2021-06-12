(setq auto-save-default nil)

;; recentf stuff
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "<f1>") 'recentf-open-files)

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
  (setq TeX-auto-save t)
  (setq TeX-PDF-mode t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  ;; (setq-default TeX-master nil) ;; Make emacs aware of multi-file projects
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  (add-hook 'LaTeX-mode-hook (lambda ()
			       (push
				'("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t :help "Run latexmk on file")
				TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
	'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

  )
