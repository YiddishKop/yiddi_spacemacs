;;; packages.el --- zilong-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2014-2016 zilongshanren
;;
;; Author: guanghui <guanghui8827@gmail.com>
;; URL: https://github.com/zilongshanren/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

;; the %i would copy the selected text into the template
;;http://www.howardism.org/Technical/Emacs/journaling-org.html
;;add multi-file journal

;; 我的一個模板用來收藏一些好的代碼,模板會要求我輸入語言
;; 我希望這個代碼在被收集到snippet.org時能自動歸類到對應語言的
;; headline下,如果沒有這種語言就新建一個top heading.
;; ------------------------------------------------------------------------
;; yiddi/match-and-get 用來獲取這個自己輸入的這個語言的字符串
;; DONE 但是後來發現,在文字真正錄入之前已經確定了要存儲的目的file和headline的位置
;;      但這次編程仍然學到了一些知識
;; (defun yiddi/match-and-get (bf)
;;   "match and get the string between bg-str and end-str in bf"
;;   (interactive)
;;   (let* ((len1 (length "#+BEGIN_SRC"))
;;          (begin  (+ len1  (string-match "\\#\\+BEGIN_SRC" bf)))
;;          (end (string-match "\n" bf begin)))
;;     ;; 由於 string-match 只匹配開始位置,所以要加上這個string的長度
;;     (substring bf (1+ begin) end)))

;; (defun yiddi/insert-to-or-create-prop-hd ()
;;   (interactive)
;;   (let* ((bf (org-capture-get :buffer))
;;          (hd (yiddi/match-and-get bf)))
;;     (goto-char (point-min))
;;     (if (re-search-forward
;;          (format org-complex-heading-regexp-format (regexp-quote hd))
;;          nil t)
;;         (goto-char (point-at-bol))
;;       (goto-char (point-max))
;;       (or (bolp) (insert "\n"))
;;       (insert "* " hd "\n")
;;       (beginning-of-line 0))))
;; ------------------------------------------------------------------------
(defconst zilongshanren-org-packages
  '(
    (org :location built-in)
    ;; org-mac-link ;; yiddi:never use
    org-octopress
    org-pomodoro
    deft
    ;; org-tree-slide
    ;; ox-reveal
    ;; worf
    ;; org-download
    ;; plain-org-wiki
    )
  )

(defun zilongshanren-org/post-init-org-pomodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (zilongshanren/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (zilongshanren/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (zilongshanren/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))

;;In order to export pdf to support Chinese, I should install Latex at here: https://www.tug.org/mactex/
;; http://freizl.github.io/posts/2012-04-06-export-orgmode-file-in-Chinese.html
;;http://stackoverflow.com/questions/21005885/export-org-mode-code-block-and-result-with-different-styles
(defun zilongshanren-org/post-init-org ()
  (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (progn
      ;; ----------------------
      ;; yiddi:add, need company in org-mode
      ;; (spacemacs|disable-company org-mode)
      ;; ----------------------
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "," 'org-priority)
      (require 'org-compat)
      (require 'org)
      ;; (add-to-list 'org-modules "org-habit")
      (add-to-list 'org-modules 'org-habit)
      (require 'org-habit)
      ;; ----------------------
      ;; yiddi:comment
      ;; org-protocol should add here
      ;; ----------------------
      (setq org-refile-use-outline-path 'file)
      (setq org-outline-path-complete-in-steps nil)
      (setq org-refile-targets
            '((nil :maxlevel . 4)
              (org-agenda-files :maxlevel . 4)))
      ;; config stuck project
      (setq org-stuck-projects
            '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

      (setq org-agenda-inhibit-startup t) ;; ~50x speedup
      (setq org-agenda-span 'day)
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (setq org-agenda-window-setup 'current-window)
      (setq org-log-done t)

      ;; 加密文章
      ;; "http://coldnew.github.io/blog/2013/07/13_5b094.html"
      ;; org-mode 設定
      (require 'org-crypt)

      ;; 當被加密的部份要存入硬碟時，自動加密回去
      (org-crypt-use-before-save-magic)

      ;; 設定要加密的 tag 標籤為 secret
      (setq org-crypt-tag-matcher "secret")

      ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
      ;; (但是子項目還是會被加密喔)
      (setq org-tags-exclude-from-inheritance (quote ("secret")))

      ;; 用於加密的 GPG 金鑰
      ;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
      (setq org-crypt-key nil)

      ;; (add-to-list 'auto-mode-alist '("\.org\\'" . org-mode))

      (setq org-todo-keywords
            (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                    (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)")
                    ;; yiddi:add for questions in my head
                    (sequence "UNSOLVED(u)" "|" "SOLVED(v@/!)")
                    (sequence "IMAGING(i)" "ORGINAZE(o!)" "RUNNING(r!)" "|" "FINISH(f@/!)")
                    (sequence "MESSY(e)"  "|" "CLEAR(l)")
                    )))
      ;; yiddi:add to customize the appearence of todo keywords
      (setq org-todo-keyword-faces
            '(
              ("UNSOLVED" . org-warning)
              ("SOLVED" . "dark green")
              ("MESSY" . org-warning)
              ("CLEAR" . "dark green")
              ("IMAGING" . org-warning)
              ("ORGINAZE" . "dark yellow")
              ("RUNNING" . "dark green")
              ("FINISH" . "dark blue")
              ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      (setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'zilongshanren/org-insert-src-block)))
      (require 'ox-publish)
      (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\tolerance=1000
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
                                        \\lstset{
                                        %行号
                                        numbers=left,
                                        %背景框
                                        framexleftmargin=10mm,
                                        frame=none,
                                        %背景色
                                        %backgroundcolor=\\color[rgb]{1,1,0.76},
                                        backgroundcolor=\\color[RGB]{245,245,244},
                                        %样式
                                        keywordstyle=\\bf\\color{blue},
                                        identifierstyle=\\bf,
                                        numberstyle=\\color[RGB]{0,192,192},
                                        commentstyle=\\it\\color[RGB]{0,96,96},
                                        stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                                        %显示空格
                                        showstringspaces=false
                                        }
                                        "
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

      ;; {{ export org-mode in Chinese into PDF
      ;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
      ;; and you need install texlive-xetex on different platforms
      ;; To install texlive-xetex:
      ;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
      ;; }}
      (setq org-latex-default-class "ctexart")
      (setq org-latex-pdf-process
            '(
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "rm -fr %b.out %b.log %b.tex auto"))

      (setq org-latex-listings t)

      ;;reset subtask
      (setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

      ;; (add-hook 'org-after-todo-state-change-hook 'org-subtask-reset)

      (setq org-plantuml-jar-path
            (expand-file-name "~/.spacemacs.d/plantuml.jar"))
      (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

      ;; yiddi:add
      ;; 1.  http://emacs.stackexchange.com/questions/28441/org-mode-9-unable-to-eval-code-blocks
      ;; DONE solve org9.0 babel cannot work
      ;; 2.  https://lists.gnu.org/archive/html/emacs-orgmode/2016-04/msg00298.html
      ;; DONE solve shell <- sh
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((perl . t)
         (ruby . t)
         ;; yiddi:comment
         ;; (sh . t)
         ;; yiddi:add
         ;; ------
         (shell . t)
         ;; ------
         (dot . t)
         (js . t)
         (latex .t)
         (python . t)
         (emacs-lisp . t)
         (plantuml . t)
         (C . t)
         (ditaa . t)
         ;; yiddi:add
         ;; -------
         (calc . t)
         (java . t)
         ;; (rst . t)
         ;; -------
         ))



      (require 'ox-md nil t)
      ;; copy from chinese layer
      (defadvice org-html-paragraph (before org-html-paragraph-advice
                                            (paragraph contents info) activate)
        "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
        (let* ((origin-contents (ad-get-arg 1))
               (fix-regexp "[[:multibyte:]]")
               (fixed-contents
                (replace-regexp-in-string
                 (concat
                  "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
          (ad-set-arg 1 fixed-contents)))

      ;; define the refile targets
      (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
      (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-file-question (expand-file-name "question.org" org-agenda-dir))
      (setq org-agenda-file-brainstom (expand-file-name "brainstom.org" org-agenda-dir))
      (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
      (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
      (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-files (list org-agenda-dir))

      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )

      (setq org-capture-templates
            '(
              ;; 快速收集就是GTD中的inbox，這裏收集所有在你腦中的東西
              ;; 撰寫時即需通過refile功能加入某個分支：
              ;; 可以當下解決的，立即解決，或者找人解決，注明PERSON
              ;; 不能解決的分步驟解決，並將其上升爲project,通過org-refile 發送到其他三個文件中做詳細部署。
              ;; ;; 短時間內完成不了，必須分步驟完成，就升級其爲project。
              ;; ;; 家庭，個人，工作
              ;; --------------心得-----------------
              ;; :empty-line 1 是說在當前capture放置到目的地時是否添加1個換行.一般都需要,不然下次在capture就亂了
              ;; --------------已知 error---------------------
              ;; 經過實驗,clock-resume 工作並不如文檔所說,他並沒有暫停當前任務的計時
              ("t" "任務收集: TODO-Inbox" entry (file+headline org-agenda-file-gtd "Inbox")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("a" "雜問收集: Question" entry (file+headline org-agenda-file-question "Question")
               "*** UNSOLVED  %?
                    :INFO:
                    :from-file:\t%F
                    :add-time: \t%U
                    :END:
                    :LOGBOOK:
                        1.
                        2.
                    :END: "
               :empty-lines 1)
              ;; yiddi:comment 知識收集需要及時做 org-refile
              ("j" "知識收集: Journal by manual" entry (file+datetree org-agenda-file-journal)
               "* MESSY %?\n  %i\n"
               :empty-lines 1)
              ;; yiddi:add used for collection of some doc or book or org converted from html
              ("e" "知識收集: Journal by emacs" entry (file+datetree org-agenda-file-journal)
               "* MESSY %?\n%c\nLink:\t%a\nFile:\t%F\n"
               :empty-lines 1)
              ;; yiddi:add 用來給當前Clock-In的任務補充記錄和信息
              ("c" "瑣信收集: Add to Clock-In" checkitem (clock)
               "%?\t %U"
               :empty-lines 1)
              ;; yiddi:add to collect good source code block-------------------------------
              ;; TODO (file+function "path/to/file" function-finding-location), use this to find the node
              ;; which indentical with inputed language to add
              ("s" "代碼收集: Code Snippet" entry (file+headline org-agenda-file-code-snippet "Code Snippet")
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n%c\n#+END_SRC\nLink:\t%a\nFile:\t%F\n")
              ("b" "奇思收集: Brainstom" entry (file+headline org-agenda-file-brainstom "Brainstom")
               "* IMAGING [#B] %?\n  %i\n %U"
               :empty-lines 1)
              ;; yiddi:add to coordinate with org-capture extension in chrome. -----------
              ;; Must Not modify the hotkey 'p' and 'L', they are defined by chrome extension: org-capture
              ("p" "------------Chome Clip" entry (file+datetree org-agenda-file-journal)
               "* MESSY %? \nSource: %u, %c\n\n\n%i\n"
               :empty-lines 1)
              ("L" "------------Chrom Link" entry (file+datetree org-agenda-file-journal)
               "* MESSY %? [[%:link][%:description]] \nCaptured On: %U"
               :empty-lines 1)
              ;; yiddi:comment 這個template相當於對當前文件做簡單的位置記錄
              ("l" "------------links" entry (file+headline org-agenda-file-note "Quick notes")
               "* [#C] %?\n  %i\n %a \n %U"
               :empty-lines 1)
              ;; -------------------------------------------------------------------------
              ))
      ;; yiddi:add for reminders
      ;; Erase all reminders and rebuilt reminders for today from the agenda
      (defun bh/org-agenda-to-appt ()
        (interactive)
        (setq appt-time-msg-list nil)
        (org-agenda-to-appt))

      ;; Rebuild the reminders everytime the agenda is displayed
      (add-hook 'org-agenda-finalize-hook 'bh/org-agenda-to-appt 'append)

      ;; This is at the end of my .emacs - so appointments are set up when Emacs starts
      (bh/org-agenda-to-appt)

      ;; Activate appointments so we get notifications
      (appt-activate t)

      ;; If we leave Emacs running overnight - reset the appointments one minute after midnight
      (run-at-time "24:01" nil 'bh/org-agenda-to-appt)
      ;; --------------------------------------------------------------

      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-compact-blocks t)
      (setq org-agenda-custom-commands
            '(
              ;; yiddi:add
              ;; http://doc.norang.ca/org-mode.html
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              ("w" . "任务安排")
              ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
              ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "项目安排")
              ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"cocos2d-x\"")
              ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"zilongshanren\"")
              ("W" "Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))

      (defvar zilongshanren-website-html-preamble
        "<div class='nav'>
<ul>
<li><a href='http://zilongshanren.com'>博客</a></li>
<li><a href='/index.html'>Wiki目录</a></li>
</ul>
</div>")
      (defvar zilongshanren-website-html-blog-head
        " <link rel='stylesheet' href='css/site.css' type='text/css'/> \n
    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>")
      (setq org-publish-project-alist
            `(
              ("blog-notes"
               :base-directory "~/org-notes"
               :base-extension "org"
               :publishing-directory "~/org-notes/public_html/"

               :recursive t
               :html-head , zilongshanren-website-html-blog-head
               :publishing-function org-html-publish-to-html
               :headline-levels 4       ; Just the default for this project.
               :auto-preamble t
               :exclude "gtd.org"
               :exclude-tags ("ol" "noexport")
               :section-numbers nil
               :html-preamble ,zilongshanren-website-html-preamble
               :author "zilongshanren"
               :email "guanghui8827@gmail.com"
               :auto-sitemap t          ; Generate sitemap.org automagically...
               :sitemap-filename "index.org" ; ... call it sitemap.org (it's the default)...
               :sitemap-title "我的wiki"     ; ... with title 'Sitemap'.
               :sitemap-sort-files anti-chronologically
               :sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
               )
              ("blog-static"
               :base-directory "~/org-notes"
               :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
               :publishing-directory "~/org-notes/public_html/"
               :recursive t
               :publishing-function org-publish-attachment
               )
              ("blog" :components ("blog-notes" "blog-static"))))



      (add-hook 'org-after-todo-statistics-hook 'zilong/org-summary-todo)
      ;; used by zilong/org-clock-sum-today-by-tags

      (define-key org-mode-map (kbd "s-p") 'org-priority)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "tl" 'org-toggle-link-display)
      (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)

      ;; hack for org headline toc
      (defun org-html-headline (headline contents info)
        "Transcode a HEADLINE element from Org to HTML.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
        (unless (org-element-property :footnote-section-p headline)
          (let* ((numberedp (org-export-numbered-headline-p headline info))
                 (numbers (org-export-get-headline-number headline info))
                 (section-number (and numbers
                                      (mapconcat #'number-to-string numbers "-")))
                 (level (+ (org-export-get-relative-level headline info)
                           (1- (plist-get info :html-toplevel-hlevel))))
                 (todo (and (plist-get info :with-todo-keywords)
                            (let ((todo (org-element-property :todo-keyword headline)))
                              (and todo (org-export-data todo info)))))
                 (todo-type (and todo (org-element-property :todo-type headline)))
                 (priority (and (plist-get info :with-priority)
                                (org-element-property :priority headline)))
                 (text (org-export-data (org-element-property :title headline) info))
                 (tags (and (plist-get info :with-tags)
                            (org-export-get-tags headline info)))
                 (full-text (funcall (plist-get info :html-format-headline-function)
                                     todo todo-type priority text tags info))
                 (contents (or contents ""))
                 (ids (delq nil
                            (list (org-element-property :CUSTOM_ID headline)
                                  (org-export-get-reference headline info)
                                  (org-element-property :ID headline))))
                 (preferred-id (car ids))
                 (extra-ids
                  (mapconcat
                   (lambda (id)
                     (org-html--anchor
                      (if (org-uuidgen-p id) (concat "ID-" id) id)
                      nil nil info))
                   (cdr ids) "")))
            (if (org-export-low-level-p headline info)
                ;; This is a deep sub-tree: export it as a list item.
                (let* ((type (if numberedp 'ordered 'unordered))
                       (itemized-body
                        (org-html-format-list-item
                         contents type nil info nil
                         (concat (org-html--anchor preferred-id nil nil info)
                                 extra-ids
                                 full-text))))
                  (concat (and (org-export-first-sibling-p headline info)
                               (org-html-begin-plain-list type))
                          itemized-body
                          (and (org-export-last-sibling-p headline info)
                               (org-html-end-plain-list type))))
              (let ((extra-class (org-element-property :HTML_CONTAINER_CLASS headline))
                    (first-content (car (org-element-contents headline))))
                ;; Standard headline.  Export it as a section.
                (format "<%s id=\"%s\" class=\"%s\">%s%s</%s>\n"
                        (org-html--container headline info)
                        (org-export-get-reference headline info)
                        (concat (format "outline-%d" level)
                                (and extra-class " ")
                                extra-class)
                        (format "\n<h%d id=\"%s\">%s%s</h%d>\n"
                                level
                                preferred-id
                                extra-ids
                                (concat
                                 (and numberedp
                                      (format
                                       "<span class=\"section-number-%d\">%s</span> "
                                       level
                                       (mapconcat #'number-to-string numbers ".")))
                                 full-text)
                                level)
                        ;; When there is no section, pretend there is an
                        ;; empty one to get the correct <div
                        ;; class="outline-...> which is needed by
                        ;; `org-info.js'.
                        (if (eq (org-element-type first-content) 'section) contents
                          (concat (org-html-section first-content "" info) contents))
                        (org-html--container headline info)))))))

      )))

(defun zilongshanren-org/init-org-mac-link ()
  (use-package org-mac-link
    :commands org-mac-grab-link
    :init
    (progn
      (add-hook 'org-mode-hook
                (lambda ()
                  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))
    :defer t))

(defun zilongshanren-org/post-init-ox-reveal ()
  (setq org-reveal-root "file:///Users/guanghui/.emacs.d/reveal-js"))

(defun zilongshanren-org/init-org-octopress ()
  (use-package org-octopress
    :commands (org-octopress org-octopress-setup-publish-project)
    :init
    (progn
      (evilified-state-evilify org-octopress-summary-mode org-octopress-summary-mode-map)
      (add-hook 'org-octopress-summary-mode-hook
                #'(lambda () (local-set-key (kbd "q") 'bury-buffer)))
      (setq org-blog-dir blog-admin-dir)
      (setq org-octopress-directory-top org-blog-dir)
      (setq org-octopress-directory-posts (concat org-blog-dir "source/_posts"))
      (setq org-octopress-directory-org-top org-blog-dir)
      (setq org-octopress-directory-org-posts (expand-file-name  "blog" blog-admin-dir))
      (setq org-octopress-setup-file (concat org-blog-dir "setupfile.org"))

      )))


(defun zilongshanren-org/init-org-tree-slide ()
  (use-package org-tree-slide
    :init
    (spacemacs/set-leader-keys "oto" 'org-tree-slide-mode)))


(defun zilongshanren-org/init-org-download ()
  (use-package org-download
    :defer t
    :init
    (org-download-enable)))

(defun zilongshanren-org/init-plain-org-wiki ()
  (use-package plain-org-wiki
    :init
    (setq pow-directory "~/org-notes")))

(defun zilongshanren-org/init-worf ()
  (use-package worf
    :defer t
    :init
    (add-hook 'org-mode-hook 'worf-mode)))

(defun zilongshanren-org/post-init-deft ()
  (progn
    (setq deft-use-filter-string-for-filename t)
    (spacemacs/set-leader-keys-for-major-mode 'deft-mode "q" 'quit-window)
    (setq deft-recursive t)
    (setq deft-extension "org")
    (setq deft-directory deft-dir)))
;;; packages.el ends here
