;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; winum                             ;; yiddi:add to solve "error during redisplay:(eval (propertize...)) in zilongshanren-ui.el"
     ;; restructuredtext                   ;; yiddi:add
     bibtex                             ;; yiddi:add
     scala
     dash                               ;;yiddi:add
     ;; ipython-notebook                   ;;yiddi:add
     (mu4e :variables
        mu4e-account-alist        t
        mu4e-installation-path    "/usr/share/emacs/site-lisp/mu4e");;yiddi:add
     pandoc
     (elfeed :variables
             rmh-elfeed-org-files (list "~/Documents/org-notes/Elfeed/elfeed.org")
             ;; elfeed-enable-web-interface t
             elfeed-db-directory "~/Documents/org-notes/Elfeed/.elfeed")
     ivy
     better-defaults
     github
     ranger
     colors
     prodigy                            ;; yiddi:從emacs內部開啓外部服務
     search-engine
     graphviz
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (vinegar :variables vinegar-reuse-dired-buffer t)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;; https://emacs-china.org/t/2016mbp-quickhelp/1644/16
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t ;;TODO yiddi: add to solve *company-quickhelp*
                      auto-completion-enable-snippets-in-popup t
                      :disabled-for org markdown)
     ;; (osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English") yiddi:never user
     restclient
     (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     (shell :variables shell-default-shell 'eshell)
     docker
     ;; latex
     deft
     markdown
     org
     shaders
     yaml
     react
     (python :variables
             python-test-runner '(nose pytest))
     (ruby :variables ruby-version-manager 'chruby)
     ruby-on-rails
     ;; lua ;; yiddi:never use
     html
     javascript
     (typescript :variables
                 typescript-fmt-on-save nil
                 typescript-fmt-tool 'typescript-formatter)
     emacs-lisp
     common-lisp                        ;yiddi:add
     (clojure :variables clojure-enable-fancify-symbols t)
     racket
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode);; yiddi:may use future
     zilongshanren
     (chinese :variables chinese-enable-fcitx nil
              chinese-enable-youdao-dict t
              )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      monokai-theme
                                      sicp
                                      winum  ;yiddi:add winum
                                      kanban ;yiddi:add to enhance org-mode
                                      elpy
                                      (matlab-mode
                                       :fetcher git
                                       :url "https://git.code.sf.net/p/matlab-emacs/src"
                                       :module "matlab-emacs"
                                       :files ("*.el" "*.m" ("toolbox" "toolbox/*.m") ("templates" "templates/*.srt")))
                                      chinese-pyim-greatdict
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;;DONE yiddi:add, delete *company-quickhelp*
   ;;                delete *org-download* in *dotspacemacs-excluded-packages*
   ;;                delete *evil-ediff*
   dotspacemacs-excluded-packages
   '(magit-gh-pulls magit-gitflow org-projectile evil-mc
                    evil-args evil-exchange evil-unimpaired
                    evil-indent-plus volatile-highlights smartparens
                    spaceline holy-mode skewer-mode rainbow-delimiters
                    highlight-indentation vi-tilde-fringe eyebrowse
                    org-bullets smooth-scrolling org-repo-todo org-timer
                    livid-mode git-gutter git-gutter-fringe  evil-escape
                    leuven-theme gh-md evil-lisp-state spray lorem-ipsum
                    ac-ispell ace-jump-mode auto-complete auto-dictionary
                    clang-format define-word google-translate disaster epic
                    fancy-battery org-present orgit orglue spacemacs-theme
                    helm-flyspell flyspell-correct-helm clean-aindent-mode
                    helm-c-yasnippet ace-jump-helm-line helm-make magithub
                    helm-themes helm-swoop helm-spacemacs-help smeargle
                    ido-vertical-mode flx-ido counsel-projectile
                    window-purpose ivy-purpose helm-purpose spacemacs-purpose-popwin
                    )
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         zenburn
                         monokai
                         ;; sleuven
                         ;; jazz
                         ;; spacemacs-dark
                         ;; spacemacs-light
                         ;; solarized-light
                         ;; solarized-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)

   ;; yiddi:comment new-version(Spacemacs v.0.200.9) spacemacs delete follow line
   ;; dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  ;; yiddi:add to highlight the color of block in org file
  ;; (defface org-block-begin-line
  ;;   '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  ;;   "Face used for the line delimiting the begin of source blocks.")

  ;; (defface org-block-background
  ;;   '((t (:background "#FFFFEA")))
  ;;   "Face used for the source block background.")

  ;; (defface org-block-end-line
  ;;   '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  ;;   "Face used for the line delimiting the end of source blocks.")
  ;; -------------------------------------------------------------------------
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "https://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  (setq tramp-mode nil)

  ;; yiddi: add path to my recorded macro directory
  (load-file "~/.spacemacs.d/Macros/macros")
  ;; yiddi: add python path
  (add-to-list 'exec-path "/home/yiddi/anaconda3/envs/tensorflow/bin")
  (add-to-list 'exec-path "/home/yiddi/anaconda3/envs/tensorflow/lib")
  (add-to-list 'exec-path "/usr/local/cuda-8.0/lib64")
  (setenv "PATH"
          (concat
           "/usr/local/cuda-8.0/lib64" ":"
           (getenv "PATH")
           )
          )
  (setenv "LD_LIBRARY_PATH"
          (concat
           "/usr/local/cuda-8.0/lib64" ":"
           (getenv "LD_LIBRARY_PATH")
           )
          )
  ;; yiddi: hope to solve anaconda-mode server error problem, but failed
  ;; https://github.com/syl20bnr/spacemacs/issues/2961
  (setenv "NO_PROXY" "127.0.0.1" )
  (setenv "no_proxy" "127.0.0.1" )

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; yiddi:never use ss proxy. But it will cause anacond-mode failed.
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))
  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  (setq purpose-mode nil)
  )
(defun dotspacemacs/user-config ()
  ;; FIXME
  ;; some function in this file, not execute as emacs.
  ;; because of the emacs will run from top one by one, so
  ;; i think maybe some function not execute well, so left function not execute.

  ;; ---------------------------------------------------------
  ;; 解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    ;; yiddi:comment out for linux system used only
    ;; (when (and (spacemacs/system-is-mac) window-system)
    (spacemacs//set-monospaced-font "Source Code Pro" "Noto Sans CJK SC" 16 16))
  ;; yiddi: enable winum-mode, to fix window-num can not display in head of mode-line
  (winum-mode)

  ;; yiddi: add configuration about bibtex mode
  (setq org-ref-default-bibliography '("~/Papers/references.bib")
        org-ref-pdf-directory "~/Papers/"
        org-ref-bibliography-notes "~/Papers/notes.org")

  ;; yiddi: add configuration about bibtex mode
  ;; (setq org-ref-open-pdf-function
  ;;       (lambda (fpath)
  ;;         (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))

  ;; Setting Chinese Font
  ;; (when (and (spacemacs/system-is-mswindows) window-system)
  ;;   (setq ispell-program-name "aspell")
  ;;   (setq w32-pass-alt-to-system nil)
  ;;   (setq w32-apps-modifier 'super)
  ;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;     (set-fontset-font (frame-parameter nil 'font)
  ;;                       charset
  ;;                       (font-spec :family "Microsoft Yahei" :size 14))))


  ;; yiddi:add, zilong's configuration is not for linux,so add these lines
  ;; Chinese Font
  ;; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Noto Sans CJK SC" :size 16)))
  ;; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


  (fset 'evil-visual-update-x-selection 'ignore)

  ;; force horizontal split window
  (setq split-width-threshold 120)
  (linum-relative-on)
  ;; TODO yiddi: company-quickhelp-mode not in *company-frontends*
  ;; (add-hook 'after-init-hook 'global-company-mode 'company-quickhelp-mode)
  ;; FIXME yiddi:error, when emacs start, but when I use elementary os , this error disappear
  ;; (spacemacs|add-company-backends :modes text-mode)
  ;; yiddi:add company-backends for common-lisp mode
  ;; (spacemacs|add-company-backends :modes common-lisp-mode)
  ;; TODO yiddi:add to coodinate with org-capture extension in chrome
  (require 'org-protocol)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; temp fix for ivy-switch-buffer
  ;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  ;; yiddi:add to set env by OS $PATH
  ;; I modify 'PATH' to 'LD_LIBRARY_PATH' to store my tensorflow lib path to env of emacs
  ;; http://andrewjamesjohnson.com/setting-environment-variables-in-gui-emacs/
  ;; (defun set-exec-path-from-shell-PATH ()
  ;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $LD_LIBRARY_PATH'")))
  ;;     (setenv "PATH" path-from-shell)
  ;;     (setq exec-path (split-string path-from-shell path-separator))))
  ;; (set-exec-path-from-shell-PATH)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  ;; yiddi:add copy from chinese-pyim website setttings recommended by author
  ;; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  (use-package chinese-pyim
    :ensure nil
    :config
    ;; 激活 basedict 拼音词库
    (use-package chinese-pyim-greatdict
      :ensure nil
      :config (chinese-pyim-greatdict-enable))

    ;; 五笔用户使用 wbdict 词库
    ;; (use-package chinese-pyim-wbdict
    ;;   :ensure nil
    ;;   :config (chinese-pyim-wbdict-gbk-enable))

    (setq default-input-method "chinese-pyim")

    ;; 我使用全拼
    (setq pyim-default-scheme 'quanpin)

    ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
    ;; 我自己使用的中英文动态切换规则是：
    ;; 1. 光标只有在注释里面时，才可以输入中文。
    ;; 2. 光标前是汉字字符时，才能输入中文。
    ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
    (setq-default pyim-english-input-switch-functions
                  '(pyim-probe-dynamic-english
                    pyim-probe-isearch-mode
                    pyim-probe-program-mode
                    pyim-probe-org-structure-template))

    (setq-default pyim-punctuation-half-width-functions
                  '(pyim-probe-punctuation-line-beginning
                    pyim-probe-punctuation-after-punctuation))

    ;; 开启拼音搜索功能
    (setq pyim-isearch-enable-pinyin-search t)

    ;; 使用 pupup-el 来绘制选词框
    (setq pyim-page-tooltip 'popup)

    ;; 选词框显示5个候选词
    (setq pyim-page-length 5)

    ;; 让 Emacs 启动时自动加载 pyim 词库
    (add-hook 'emacs-startup-hook
              #'(lambda () (pyim-restart-1 t)))
    :bind
    (("M-p" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
     ("C-;" . pyim-delete-word-from-personal-buffer)))
  ;; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))

  (defun js-indent-line ()
    "Indent the current line as JavaScript."
    (interactive)
    (let* ((parse-status
            (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (point) (save-excursion (back-to-indentation) (point)))))
      (if (nth 3 parse-status)
          'noindent
        (indent-line-to (js--proper-indentation parse-status))
        (when (> offset 0) (forward-char offset)))))

  (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
  (defun un-indent-by-removing-4-spaces ()
    "remove 4 spaces from beginning of of line"
    (interactive)
    (save-excursion
      (save-match-data
        (beginning-of-line)
        ;; get rid of tabs at beginning of line
        (when (looking-at "^\\s-+")
          (untabify (match-beginning 0) (match-end 0)))
        (when (looking-at (concat "^" (make-string tab-width ?\ )))
          (replace-match "")))))

  (defun zilongshanren/toggle-major-mode ()
    (interactive)
    (if (eq major-mode 'fundamental-mode)
        (set-auto-mode)
      (fundamental-mode)))
  (spacemacs/set-leader-keys "otm" 'zilongshanren/toggle-major-mode)

  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-spelling-checking-on)

  ;; https://github.com/syl20bnr/spacemacs/issues/7749
  (defun spacemacs/ivy-persp-switch-project (arg)
    (interactive "P")
    (ivy-read "Switch to Project Perspective: "
              (if (projectile-project-p)
                  (cons (abbreviate-file-name (projectile-project-root))
                        (projectile-relevant-known-projects))
                projectile-known-projects)
              :action (lambda (project)
                        (let ((persp-reset-windows-on-nil-window-conf t))
                          (persp-switch project)
                          (let ((projectile-completion-system 'ivy)
                                (old-default-directory default-directory))
                            (projectile-switch-project-by-name project)
                            (setq default-directory old-default-directory)))))))

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  )
