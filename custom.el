;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(command-log-mode-window-size 50)
 '(company-dabbrev-minimum-length 3)
 '(company-dabbrev-other-buffers nil)
 '(company-show-numbers t)
 '(company-statistics-auto-restore nil)
 '(ctags-update-delay-seconds 1024)
 '(custom-safe-themes
   (quote
    ("704a108ab29ea8fc8feb718a538e9ce45d732dce41e5b04585f43a6352c5519e" default)))
 '(elfeed-feeds (quote ("http://nullprogram.com/feed/")))
 '(erc-nick "zilongshanren")
 '(erc-port 6666)
 '(evil-want-C-i-jump t)
 '(evil-want-Y-yank-to-eol t)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(expand-region-contract-fast-key "V")
 '(expand-region-exclude-text-mode-expansions (quote (html-mode nxml-mode web-mode)))
 '(expand-region-reset-fast-key "r")
 '(fci-rule-color "#151515" t)
 '(global-command-log-mode nil)
 '(helm-buffer-max-length 56)
 '(helm-move-to-line-cycle-in-source t)
 '(ivy-height 18)
 '(lua-documentation-url "http://www.lua.org/manual/5.3/manual.html")
 '(magit-use-overlays nil)
 '(only-global-abbrevs t)
 '(org-agenda-custom-commands
   (quote
    (("w" . "任务安排")
     ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"" nil)
     ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"" nil)
     ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"" nil)
     ("b" "Blog" tags-todo "BLOG" nil)
     ("p" . "项目安排")
     ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"cocos2d-x\"" nil)
     ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"zilongshanren\"" nil)
     ("W" "Weekly Review"
      ((stuck "" nil)
       (tags-todo "PROJECT" nil))
      nil)
     ("i" "Important: Urgent things and Phone calls"
      ((tags "URGENT"
             ((org-agenda-overriding-header "Urgent things to do")))
       (tags "PHONE"
             ((org-agenda-overriding-header "Phone to calls"))))
      nil nil))))
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files (quote (agenda-archives)))
 '(org-capture-templates
   (quote
    (("t" "任務收集: TODO-Inbox" entry
      (file+headline org-agenda-file-gtd "Inbox")
      "* TODO [#B] %?
  %i
" :empty-lines 1)
     ("a" "雜問收集: Question" entry
      (file+headline org-agenda-file-question "Question")
      "*** UNSOLVED  %?
                    :INFO:
                    :from-file:	%F
                    :add-time: 	%U
                    :END:
                    :LOGBOOK:
                        1.
                        2.
                    :END: " :empty-lines 1)
     ("j" "知識收集: Journal by manual" entry
      (file+datetree org-agenda-file-journal)
      "* MESSY %?
  %i
" :empty-lines 1)
     ("e" "知識收集: Journal by emacs" entry
      (file+datetree org-agenda-file-journal)
      "* MESSY %?
%c
 Link:	%a
File:	%F
" :empty-lines 1)
     ("c" "瑣信收集: Add to Clock-In" checkitem
      (clock)
      "%?	 %U" :empty-lines 1)
     ("z" "test: Journal by emacs" entry
      (file+datetree org-agenda-file-journal)
      "* Datetree %?
  %i
 %U" :empty-lines 1)
     ("s" "代碼收集: Code Snippet" entry
      (file+function org-agenda-file-code-snippet yiddi/insert-to-or-create-prop-hd)
      "* %?	%^g
#+BEGIN_SRC %^{language}
%c
#+END_SRC
Link:	%a
File:	%F
")
     ("b" "奇思收集: Brainstom" entry
      (file+headline org-agenda-file-brainstom "Brainstom")
      "* SOMEDAY [#B] %?
  %i
 %U" :empty-lines 1)
     ("p" "------------Chome Clip" entry
      (file+datetree org-agenda-file-journal)
      "* MESSY %?
Source: %u, %c


%i
" :empty-lines 1)
     ("L" "------------Chrom Link" entry
      (file+datetree org-agenda-file-journal)
      "* MESSY %? [[%:link][%:description]]
Captured On: %U" :empty-lines 1)
     ("l" "------------links" entry
      (file+headline org-agenda-file-note "Quick notes")
      "* [#C] %?
  %i
 %a
 %U" :empty-lines 1))))
 '(org-deadline-warning-days 14)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-into-drawer t)
 '(org-pomodoro-play-sounds nil)
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (window-numbering visual-regexp typescript-mode restclient faceup rake pcre2el alert log4e gntp markdown-mode zoutline js2-mode projectile htmlize parent-mode helm helm-core haml-mode gh marshal logito pcache ht flyspell-correct flycheck magit git-commit with-editor iedit anzu evil goto-chg undo-tree elfeed-web simple-httpd org elfeed-goodies ace-jump-mode noflet elfeed popup json-mode tablist magit-popup docker-tramp json-snatcher json-reformat makey diminish swiper ivy web-completion-data dash-functional tern company-quickhelp pos-tip company cmake-mode hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl inf-ruby bind-key yasnippet packed async anaconda-mode pythonic f s ace-window avy request quelpa package-build slime-company slime common-lisp-snippets mu4e-maildirs-extension mu4e-alert popup-fn yiddi-popup-fn pandoc-mode ox-pandoc kanban names chinese-word-at-point ctable orglue org-mac-link epic elfeed-org volatile-highlights vi-tilde-fringe spaceline powerline rainbow-delimiters org-bullets lorem-ipsum highlight-indentation helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds google-translate flx-ido fancy-battery eyebrowse evil-unimpaired evil-mc evil-lisp-state smartparens evil-indent-plus evil-exchange evil-escape evil-ediff evil-args define-word clean-aindent-mode ace-jump-helm-line youdao-dictionary yapfify yaml-mode xterm-color ws-butler wrap-region winum which-key wgrep web-mode web-beautify visual-regexp-steroids uuidgen use-package unfill toc-org tiny tide tagedit solarized-theme smex slim-mode sicp shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv ranger rainbow-mode rainbow-identifiers racket-mode pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails prodigy popwin pip-requirements persp-mode peep-dired pbcopy paradox osx-trash osx-dictionary origami org-pomodoro org-plus-contrib org-octopress open-junk-file ob-restclient ob-http nodejs-repl neotree mwim multi-term move-text mmm-mode minitest markdown-toc macrostep lua-mode live-py-mode lispy linum-relative link-hint less-css-mode launchctl js2-refactor js-doc ivy-hydra info+ indent-guide impatient-mode ibuffer-projectile hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-global hide-comnt help-fns+ helm-github-stars helm-ag graphviz-dot-mode golden-ratio gnuplot glsl-mode gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist ggtags fuzzy flyspell-correct-ivy flycheck-pos-tip flx find-file-in-project fill-column-indicator feature-mode expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-iedit-state evil-anzu etags-select eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav dumb-jump dockerfile-mode docker discover-my-major deft cython-mode counsel company-web company-tern company-statistics company-restclient company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmake-font-lock clojure-snippets clj-refactor cider-eval-sexp-fu chruby bundler bind-map auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-link 4clojure)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((eval setenv "PYTHONPATH" "/Users/guanghui/cocos2d-x/tools/cocos2d-console/plugins:/Users/guanghui/cocos2d-x/tools/cocos2d-console/bin"))))
 '(sp-show-pair-from-inside t t)
 '(tags-revert-without-query t)
 '(vc-follow-symlinks t)
 '(web-mode-markup-indent-offset 2)
 '(ycmd-extra-conf-handler (quote load))
 '(ycmd-extra-conf-whitelist (quote ("~/cocos2d-x/*"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-definition-face ((t (:foreground "#d33682" :slant normal :weight bold))))
 '(ahs-face ((t (:foreground "#d33682" :weight bold))))
 '(command-log-command ((t (:foreground "dark magenta"))))
 '(command-log-key ((t (:foreground "dark cyan"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(git-gutter-fr:added ((t (:foreground "#859900" :weight bold :width extra-expanded))))
 '(iedit-occurrence ((t (:inherit cursor))))
 '(ivy-virtual ((t (:background "skyblue"))))
 '(js2-external-variable ((t (:foreground "plum3"))))
 '(mc/cursor-bar-face ((t (:background "chartreuse3"))))
 '(show-paren-match ((t (:background "dark gray" :foreground "#d33682" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#272822" :foreground "gray" :inverse-video t :weight normal))))
 '(web-mode-current-element-highlight-face ((t (:background "dark gray")))))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
