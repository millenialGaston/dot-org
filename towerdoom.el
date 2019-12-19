(require 'printing)		; load printing package
(setq pr-path-alist
	    '((unix      "." "/bin" ghostview mpage PATH)
	      (ghostview "/usr/bin/gsview")
	      (mpage     "/usr/bin/mpage")))
(setq pr-ps-name       'lps)
(setq pr-ps-printer-alist '((lpss "lp" nil "-d" "HLL2390DW")))
(pr-update-menus t)

(setq bibtex-completion-format-citation-functions
      '((org-mode . bibtex-completion-format-citation-ebib)
        (latex-mode    . bibtex-completion-format-citation-cite)
        (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
        (default       . bibtex-completion-format-citation-default)))

(setq bibtex-completion-display-formats
      '((article       . "${author:36} ${title:*} ${journal:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (inbook        . "${author:36} ${title:*} Chapter ${chapter:32} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (incollection  . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (inproceedings . "${author:36} ${title:*} ${booktitle:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
        (t             . "${author:36} ${title:*} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")))

(bind-key (kbd "M-y") 'helm-show-kill-ring)
(bind-key (kbd "M-o") 'company-complete)

(bind-key (kbd "M-p") nil)
(bind-key (kbd "M-p l") 'org-cliplink)
(bind-key (kbd "M-p v") 'org-brain-visualize)
(bind-key (kbd "M-p a") '+popup/raise)
(bind-key (kbd "M-p c") 'org-id-get-create)
(bind-key (kbd "M-p r") 'slime-repl)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c f") 'counsel-fzf)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)

(use-package rg
  :bind (("C-c l" . 'counsel-rg)
         ("C-c r" . 'counsel-projectile-rg))
  :config
  (rg-enable-default-bindings))

(require 'org-tempo)
(setq tempo-interactive t)
(tempo-define-template "my-property"
                       '(":PROPERTIES:" p ":END:" >)
                       "<p"
                       "Insert a property tempate")
(tempo-define-template "name"
                       '("#+NAME:" (p "Name : " name)  >)
                       "<n"
                       "Insert name")
(tempo-define-template "attr-org"
                       '("#+ATTR_ORG: :width 400")
                       "<o")

(run-with-idle-timer 20 t 'evil-normal-state)

(setq-default
 evil-escape-key-sequence "jk"
 evil-escape-unordered-key-sequence "true")

(evil-define-key nil evil-insert-state-map
  "\C-f" 'evil-forward-char
  "\C-b" 'evil-backward-char
  "\C-k" 'kill-line
  "\C-y" 'evil-paste-after)

(require 'engine-mode)
(engine-mode t)

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(defengine libgen-articles
  "http://gen.lib.rus.ec/scimag/?q=%s")

(defengine libgen-books
  "http://gen.lib.rus.ec/search.php?req=%s")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s"
  :keybinding "p")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

(defengine goodreads
  "https://www.goodreads.com/search?q=%s"
  :keybinding "r")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine amazon
  "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s"
  :keybinding "a")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "h")

(defengine google-maps
  "http://maps.google.com/maps?q=%s"
  :docstring "Mappin' it up."
  :keybinding "m")

(defengine project-gutenberg
  "http://www.gutenberg.org/ebooks/search/?query=%s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine twitter
  "https://twitter.com/search?q=%s")

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; Log the time when a TODO item was finished
(setq org-log-done 'time)

;; Specify global tags with fast tag selection
(setq org-tag-alist '((:startgroup . nil) ("@school" . ?o) ("@home" . ?h) (:endgroup . nil)
                      ("computer" . ?c) ("reading" . ?r) ("udem" . ?u) ("!udem" . ?!) ("!aux" . ?a)
                      ("grocery" . ?g) ("homework" . ?w) ("research" . ?r)))

;; Effort and global properties
(setq org-global-properties '(("Effort_ALL". "0 0:10 0:20 0:30 1:00 1:30 2:00 3:00 4:00 6:00 8:00")))

;; Set global Column View format
(setq org-columns-default-format '"%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM(Clock)")

(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.personal/org/inbox.org" "tasks")
         "* todo %?\n:PROPERTIES:\n:Created: %U\n:Linked: %A\n:END:\n %i"
         :prepend t)

        ("s" "Started" entry (file+headline "~/.personal/org/inbox.org" "tasks")
         "* started %?\n %i" :clock-in t :clock-keep t :prepend t)

        ("j" "Journal" entry (file+olp+datetree "~/.personal/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")

        ("b" "Books" entry (file+headline "~/notes/books.org" "Books")
         "* %(read-string \"Title: \")\n
          :PROPERTIES: Pages: %(number-to-string (read-number \"Pages:\")):END:\n
          Author: %(read-string \"Author: \")\n")

        ("w" "Web site" entry
         (file "")
         "* %a :website:\n\n%U %?\n\n%:initial")

        ("c" "Contact" entry (file+headline "~/.personal/org/contacts.org" "Friends")
         "* %(read-string \"Name: \")\n
          :PROPERTIES:\n
          :EMAIL: %(read-string \"emacs: \")\n
          :END:")

        ("Q" "quote org capture" entry
         (file+headline ,"~/.personal/org/inbox.org" "browsing")
         "* %?%:description Added %U
#+BEGIN_QUOTE
%x
#+END_QUOTE" :immediate-finish t)))

(use-package company
  :init
  (setq company-tooltip-align-annotations t)
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .2)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))
(define-key global-map (kbd "C-.") 'company-files)

(setq slime-contribs '(slime-fancy slime-asdf))
(setq inferior-lisp-program "sbcl --dynamic-space-size 10000")
(setq inferior-julia-program-name "/usr/bin/julia")
(setq python-python-command "/usr/bin/ipython")

(use-package js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-to-list 'load-path "/home/gaston/.opam/4.07.1/share/emacs/site-lisp")
(require 'ocp-indent)


;; (setq erlang-root-dir "/usr/lib/erlang")
;; (add-to-list 'load-path "/usr/lib/erlang/lib/tools-3.2.1/emacs")
;; (add-to-list 'load-path "~/dotfiles/emacsy/packages/stable-packages/ob-erlang")
;; (add-to-list 'exec-path "/usr/lib/erlang/bin")
;; (require 'erlang-start)
;; (require 'ob-erlang)

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(require 'lsp)
(require 'lsp-ui)
;;(require 'lsp-haskell)
;;(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; (add-to-list 'load-path
             ;; "/home/sole/.opam/default/share/emacs/site-lisp/")
;; (require 'ocp-indent)
(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")

(set-default-font "Iosevka Nerd Font 12")
(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 130)
(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font")
(set-face-attribute 'variable-pitch nil :family "EtBembo")


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-frame-parameter (selected-frame) 'alpha '(87 . 87))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq-default tab-width 2)
(setq c-basic-indent 2)
(setq artist-aspect-ratio 2.0)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(use-package doom-themes)
;; (load "~/temp/dotfiles/emacsy/packages/my-doom-themes-ext-org.el")

(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(doom-themes-org-config)

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))
(load-theme 'doom-nord)

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))
(doom-modeline 1)
(setq doom-modeline-major-mode-icon t)

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(let* ((variable-tuple
        (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "en_US")
(bind-key "C-c I"
          (lambda ()
            (interactive)
            (ispell-change-dictionary "fr_CA")
            (flyspell-buffer)))

(bind-key "C-c E"
          (lambda ()
            (interactive)
            (ispell-change-dictionary "en_GB")
            (flyspell-buffer)))

(setq reftex-default-bibliography '("~/academic/biblio/master-bib.bib"))

(setq org-ref-bibliography-notes "~/academic/biblio/orgRefNotes.org"
      org-ref-default-bibliography '("~/academic/biblio/master-bib.bib")
      org-ref-pdf-directory "~/academic/biblio/papers/")

(setq bibtex-completion-bibliography '("~/academic/biblio/master-bib.bib")
      bibtex-completion-library-path "~/academic/biblio/papers/"
      bibtex-completion-notes-path "~/academic/biblio/helm-bibtex-notes")

(setq bibtex-completion-pdf-field "file")
(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (start-process "evince" "*helm-bibtex-evince*" "/usr/bin/evince"
                       fpath)))

(setq bibtex-dialect 'biblatex)

(setq org-directory "~/.personal/org")
(setq org-agenda-files '("~/.personal/org"))
(setq org-modules '(org-wikinodes org-w3m org-bbdb org-bibtex
                                  org-docview org-gnus org-info org-irc org-mhe org-rmail org-eww))

(setq org-attach-dir-relative t)
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ;

(setq org-babel-lisp-eval-fn 'sly-eval)
(setq org-cycle-separator-lines 2)


(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-mode)
  (warn "toc-org not found"))

(setq org-blank-before-new-entry '((heading . auto) (plain-list-item . auto)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-latex-pdf-process
      (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f %f"))

(use-package evil-org
  :commands evil-org-mode
  :after org
  :init
  (add-hook 'org-mode-hook 'evil-org-mode)
  :config

  (evil-define-key 'normal evil-org-mode-map
    "<" 'org-metaleft
    ">" 'org-metaright
    "-" 'org-cycle-list-bullet
    (kbd "TAB") 'org-cycle)
  ;; normal & insert state shortcuts.
  (mapc (lambda (state)
          (evil-define-key state evil-org-mode-map
            (kbd "C-;") 'ober-eval-block-in-repl
            (kbd "M-;") 'ober-eval-in-repl
            (kbd "M-l") 'org-metaright
            (kbd "M-h") 'org-metaleft
            (kbd "M-k") 'org-metaup
            (kbd "M-j") 'org-metadown
            (kbd "M-L") 'org-shiftmetaright
            (kbd "M-H") 'org-shiftmetaleft
            (kbd "M-K") 'org-shiftmetaup
            (kbd "M-J") 'org-shiftmetadown))
        '('normal 'insert)))

(add-to-list 'load-path "~/macs/packages/")
(require 'yasnippet)
(use-package yasnippet-snippets)
(use-package helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(setq yas-snippet-dirs
      '("~/macs/snippets"))
(yas-global-mode 1)

(require 'ob-shell)
(require 'ox-md)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)
(with-eval-after-load "ob"
  (require 'org-babel-eval-in-repl))
(require 'eval-in-repl)
