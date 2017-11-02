;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Frank Cheng's dotemacs file
;;; Last modified time
;;; Time-stamp: <2009-07-15 星期三 18:59:56 K.T>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(server-start)


;;-------------------------------------------------------------------
;;load path
;;-------------------------------------------------------------------
;(setq load-path (cons "~/mylisp" load-path))
(add-to-list 'load-path "~/.emacs.d/elpa/muse-3.12/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")


;;-------------------------------------------------------------------
;;color
;;-------------------------------------------------------------------

;; -*- mode: Emacs-Lisp -*-
;;;    Time-stamp:    ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ==================================================
;; MY SETINGS FOR EMACS
;; ref:http://forum.ubuntu.org.cn/viewtopic.php?f=68&t=136768
;; ==================================================
;;关闭烦人的出错时的提示声
(setq visible-bell t)
;;禁用启动信息
(setq inhibit-startup-message t) 
;;显示列号
(setq column-number-mode t)
;;鼠标点击粘贴
(setq mouse-yank-at-point t)
;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东
(setq kill-ring-max 200)
;;把 fill-column 设为 60. 这样的文字更好读。
(setq default-fill-column 72)
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。
;;编辑 Makefile 的时候也不用担心，
;;因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)
;;防止页面滚动时跳动， scroll-margin 3 
;;可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
      scroll-conservatively 10000)
;;把缺省的 major mode 设置为 text-mode,
;;而不是几乎什么功能也没有的 fundamental-mode.
(setq default-major-mode 'text-mode)
;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)
;;在标题栏显示buffer的名字
(setq frame-title-format "emacs@%b")
;;直接打开图片
(auto-image-file-mode t)
;;进行语法加亮
(global-font-lock-mode t)
;;把这些缺省禁用的功能打开。
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;设置一下备份时的版本控制，这样更加安全。
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq backup-directory-alist '(("." . "~/.emacs.d/.backup")))
(setq backup-by-copying t)


;;设置有用的个人信息。这在很多地方有用
(setq user-full-name "Zhang (Frank) Cheng")
(setq user-mail-address "zhangc518@gmail.com")

;;让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;;; global flyspell
;;(setq global-flyspell-mode t)

;;;emacs 支持外部粘贴
 (setq x-select-enable-clipboard t)


;;-------------------------------------------------------------------
;;ibuffer.el
;;把 C-x C-b 那个普通的 buffer menu 换成非常方便的 ibuffer 啦！ 
;;--------------------------------------------------------------------
;;使用了 desktop 之后有可能使你同时有几十个 buffer 同时打开着。有时你想把其中一;;些关闭，有时你想在某些 buffer 里寻找某个 regexp。这个时候你可以用 ibuffer，它;;有跟 dired 相似的界面。可以对 buffer 进行各种标记，排序，隐藏，查找，替换。;;;;非常好用。看看这个抓图就是我限定显示 emacs-lisp-mode 和 c-mode 的 buffer，按 ;;major mode 名称排序，并做上一些记号的情况。 

;;我常用的一个功能是，用 %-n 标记符合某种名字的 buffer，然后按 "O" 在这些buffer;;里寻找我需要的字串。比如在所有打开的后缀为 html 的 buffer 里寻找 "Emacs" 字样;;，得到如下结果。
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;-------------------------------------------------------------------
;;browse-kill-ring.el
;;方便的在 kill-ring 里寻找需要的东西。
;;--------------------------------------------------------------------
;;你是不是经常按 C-y 放进一个 kill-ring 里的单元。然后 M-y，M-y，…… 来寻找你需
;;;要的很久以前剪切下来的东西？很费事吧？用了 browse-kill-ring 就好了。你只需要
;;;把它绑定到一个热键，比如 C-c k: 就能出现这样一个buffer。[查看图形] 

;;kill-ring 里的内容都可以方便的浏览，粘贴。具体操作请在这个 buffer 里 C-h m 或;;者 ?. 
;(require 'browse-kill-ring)
;(global-set-key [(control c)(k)] 'browse-kill-ring)
;(browse-kill-ring-default-keybindings)
;;-------------------------------------------------------------------
;;ido.el
;;你可能用过 iswitchb。但是当有很多buffer时，iswitchb 还是很慢。你可以使用ido。
;;这是我见过的最方便的切换buffer，寻找文件的扩展了。
;;--------------------------------------------------------------------
(require 'ido)
(ido-mode t)
;;-------------------------------------------------------------------
;;swbuff 
;;使用这个，你就可以方便的在最近编辑的 buffer 之间切换了。
;;切换的时候会出现一个小窗口显示附近的buffer，就像翻页一样。
;;--------------------------------------------------------------------
;(require 'swbuff)
;(global-set-key [(control c)(p)] 'swbuff-switch-to-previous-buffer)
;(global-set-key [(control c)(n)] 'swbuff-switch-to-next-buffer)
;(setq swbuff-exclude-buffer-regexps 
;     '("^ " "\\*.*\\*"))

;(setq swbuff-status-window-layout 'scroll)
;(setq swbuff-clear-delay 1)
;(setq swbuff-separator "|")
;(setq swbuff-window-min-text-height 1)
;;-------------------------------------------------------------------
;;tabbar.el
;; Windows 样式的编辑器上面的 tab 
;;--------------------------------------------------------------------
(require 'tabbar)
(setq tabbar-mode t)
(global-set-key [(control c)(up)] 'tabbar-backward-group)
(global-set-key [(control c)(down)] 'tabbar-forward-group)
(global-set-key [(control c)(right)] 'tabbar-backward)
(global-set-key [(control c)(left)] 'tabbar-forward)
;;;改变 tabbar-buffer-groups-function
;;;tabbar 本来提供了一个机制，让你可以自己确定 tab 属于哪组，只要修改 tabbar-bu;;;ffer-groups-function 就行了。 
(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)

(defun tabbar-buffer-ignore-groups (buffer)
  "Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Process")
      )
     ((member (buffer-name)
              '("*scratch*" "*Messages*"))
      '("Common")
      )
     ((eq major-mode 'dired-mode)
      '("Dired")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      '("Help")
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      '("Mail")
      )
     (t
      (list 
       "default"  ;; no-grouping
       (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
           mode-name
         (symbol-name major-mode)))
      )
     
     )))
;;-------------------------------------------------------------------
;;speedbar
;; 自带
;;--------------------------------------------------------------------
;;这个是 Emacs 自带的。M-x speedbar 就可以启动它。它可以让你 方便的浏览文件，你
;;还可以显示文件里的标题，函数，变量…… 
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(global-set-key [(f4)] 'speedbar-get-focus)
;;在你编辑不同的文件时，它可以显示当前文件所在目录里的相关文 件和它们的信息，
;;;比如文件是否需要重新编译，elisp文件是否已 经编译，…… 等等
;;-------------------------------------------------------------------
;;tabbar
;; 自带
;;--------------------------------------------------------------------
;;  Tabbar还是很眩的一个插件。下载tabbar插件，然后加载之。在王垠的笔记里
;;  有一段对tabbar的操作键定义：
 

;(require 'tabbar)
;(tabbar-mode)
;(define-prefix-command 'lwindow-map)
;(global-set-key (kbd "<M-up>") 'tabbar-backward-group)
;(global-set-key (kbd "<M-down>") 'tabbar-forward-group)
;(global-set-key (kbd "<M-left>") 'tabbar-backward)
;(global-set-key (kbd "<M-right>") 'tabbar-forward)

;;    在原来的设置中使用super键来帮定实现tab的移动，但是在Windows下怎么
;;都不灵，就设成了M前缀了。这样就可以使用这些快捷键在这些tabbar中移动了。
;;我基本就使用这些功能，差不多也足够平时的使用了。 
;;-------------------------------------------------------------------
;;table.el
;; “所见即所得”
;;--------------------------------------------------------------------

;;非常酷的一个扩展。可以“所见即所得”的编辑一个文本模式的表格。就跟很多字处理程
;;序那样操作，可以识别文本文件里本来就存在的表格，而且可以把表格输出为 HTML 和 
;;TeX。
(autoload 'table-insert "table" "WYGIWYS table editor")

;;-------------------------------------------------------------------
;;recentf.el
;; 最近打开的文件
;;--------------------------------------------------------------------
(require 'recentf)
(recentf-mode 1)
;;;;你可以把不常用的C-x C-r 绑定到这样一个函数：
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
	 (tocpl (mapcar (function 
			 (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
	 (prompt (append '("File name: ") tocpl))
	 (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl))))) 

(global-set-key [(control x)(control r)] 'recentf-open-files-compl)
;;这样你就可以 C-x C-r 然后 TAB 列出最近打开文件列表了。 
;;-------------------------------------------------------------------
;;rect-mark.el
;;
;;--------------------------------------------------------------------
;;你是不是觉得 Emacs 的“矩形区域操作”不太直观？使用这个包之后矩形 region会被真
;;;正显示成一个矩形。可以使你的矩形操作大大方便。 

;;如果你已经有了一个 region。你可以使用 C-x r C-x 把它显示为一个矩形。如果你刚
;;;开始设定一个矩形区域，你可以使用 C-x r 作为你的 set-mark-command 的前缀，比如 
;;C-x r C-SPC。那么区域会被显示为矩形。
;;-------------------------------------------------------------------
;;hippie-expand
;;
;;--------------------------------------------------------------------
;;这个是 Emacs 自带的功能，可是知道它的人不多。很多人用的是M-/ (dabbrev-expand) 
;;这样的东西。 hippie-expand 要强大的多。因为它可以使用扩展函数任意扩充！你可
;;以把你的 M-/ 绑定到 hippie-expand，马上就可以体会到它的方便。
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbolsymbol-partially
	try-complete-lisp-symbol))
;;-------------------------------------------------------------------
;;括号匹配
;;
;;--------------------------------------------------------------------
;;这是一个很小的函数。你是不是觉得 Emacs 在匹配的括号之间来回跳转的时候按 C-M-
;;f 和 C-M-b 太麻烦了？vi的 % 就很方便，我们可以把 % 设置为匹配括号。可是你想输
;;入 % 怎么办呢？ 
;;一个很巧妙的解决方案就是，当 % 在括号上按下时，那么匹配括号，否则输入一个 %
;;。你只需要在 .emacs 文件里加入这些东西就可以达到目的：
(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;;-------------------------------------------------------------------
;;临时记号
;;
;;--------------------------------------------------------------------
;;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以使用 bookm
;;ark 或者寄存器。但是这些实在是太慢了。你多想拥有vi那样的 ma, mb, 'a, 'b 的操
;;;作。现在你可以用几行 elisp 达到类似的目的：
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))
;;当你按 C-. 时就做了一个记号。然后你可以到别处，按 C-, 就可以在这两点之间来回
;;跳转了。这虽然没有 vi 的 26 个 mark 多，但是你仔细想想，vi的26个 mark，你通常
;;能用到几个？


;;-------------------------------------------------------------------
;;ctypes 可以识别你的 C 文件里的类型定义 (typedef)。自动对它们进行语法加亮
;;--------------------------------------------------------------------
(require 'ctypes)
(ctypes-auto-parse-mode 1)


;; =====================================================================
;; 时间相关. mycalendar.el
;;http://learn.tsinghua.edu.cn:8080/2004211031/publish/GNU/schedule.html
;;.	跳回当前天
;;o	跳到某一个月
;;g d	跳到某年某月某日
;;g c	跳到某年某星期的星期几
;;g C	跳到阴历的某一天
;;pC	显示当前的阴历日期
;;h	显示当前节日
;;i d	加入当前这一天的日程安排
;;i w	加入每周这一天的日程安排
;;i m	加入每月这一天的日程安排
;;i y	加入每年这一天的日程安排
;;i a	加入周年纪念（anniversary），比如生日等
;;d	察看当前日期的diary 
;; =====================================================================
;;显示日期
(setq display-time-day-and-date t)
(display-time)

;;显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;; 设置所在地的经纬度和地名，calendar 可以根据这些信息告知你每天的日出和日落
;; 的时间
;; 在 calendar 上用 S 即可看到
(setq calendar-latitude +32.05)
(setq calendar-longitude +118.78)
(setq calendar-location-name "Nanjing")

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil)        ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日 


;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))


(setq appt-issue-message nil)


;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

;; key binding
;;上面介绍的内容已经足以满足日程管理的需要了，现在需要进行最后一步设置，来使访问do文件和calendar变得容易。我自己的设置是把 calendar 命令绑定到F11上，这样只要按一下F11，就可以打开calendar，快速察看日程安排；把 list-bookmarks 命令绑定到F12上，然后在访问do文件的时候，用 M-x bookmark-set 或者 C-x rm 设置上书签，这样按一下F12就可以容易的打开do文件了。如果要删除书签可以在书签列表上用 M-x bookmark-delete 。在.emacs中加入：
(global-set-key (kbd "<f11>") 'calendar)
(global-set-key (kbd "<C-f11>") 'list-bookmarks)


;;------------------------------------------------------------
;;字体及大小 2009-2-9
;;http://www.yuanma.org/data/2006/0503/article_355.htm
;;------------------------------------------------------------
;; -*- mode: lisp-interaction; coding: utf-8; -*-

; (set-default-font "Calibri:pixelsize=18")

;;(set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-150-iso8859-1")
;;(set-default-font "-outline-Calibri-medium-r-normal-normal--18-180-96-96-m-150-iso8859-1")


;;------------------------------------------------------------
;;matlab mode
;;
;;------------------------------------------------------------

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;              w3m mode
;;;
;;
;;启动和初始化w3m.el
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;使用w3m作为默认的浏览器
(setq browse-url-browser-function 'w3m-browse-url)
;(setq browse-url-browser-function 'firefox)
;;使用mule-ucs，只有在你安装mule-ucs elisp扩展包时这个才有用，可以看Unicode解码的网页
;(setq w3m-use-mule-ucs t)
;;使用工具包
(setq w3m-use-toolbar t)
;;使用info的快件键绑定
;(set-default 'w3m-key-binding 'info)
;;启用cookie
(setq w3m-use-cookies t)
;;这个是作什么的?
(setq w3m-use-tab-menubar t)
;;设定w3m图标所在文件夹
;(setq w3m-icon-directory "/home/jerry/software/xemacs/w3m/emacs-w3m-1.4.4/icons")
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))
;;用w3m浏览网页时也显示图片
(setq w3m-display-inline-image t)
;; ;;设定w3m的语言设置，以便方便使用和阅读中文-用了就乱码
;; ;;书签解码设置
;; (setq w3m-bookmark-file-coding-system 'chinese-iso-8bit)
;; ;;w3m的解码设置，后面最好都有，我也不详解了
;; (setq w3m-coding-system 'chinese-iso-8bit)
;; (setq w3m-default-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-name-coding-system 'chinese-iso-8bit)
;; (setq w3m-terminal-coding-system 'chinese-iso-8bit)
;; (setq w3m-input-coding-system 'chinese-iso-8bit)
;; (setq w3m-output-coding-system 'chinese-iso-8bit)
;;w3m是使用tab的，设定Tab的宽度
(setq w3m-tab-width 4)
;;设定w3m的主页，同mozilla的默认主页一样
;(setq w3m-home-page "file://home/jerry/.w3m/bookmark.html")
;(setq w3m-home-page "file://home/jerry/.mozilla/firefox/ydr93vef.default/bookmarks.html")
;;当用 shift+RET 打开新链接时将不自动跳转到新的页面，等提示已经完全打开，才用 C-c C-n ，
;;C-c C-p 打开，这个好用


;;颜色设置
;(setq w3m-
;;;;;;;;;;;;;;;;;;;;;
;;语言设置
;;这个不知道有用没，好像在下一版emacs对unicode支持好了就可以了
;;当然这个是用emacs-cvs
;;;;;;;;;;;;;;;;;;;;;
(when (boundp 'utf-translate-cjk)
  (setq utf-translate-cjk t)
  (custom-set-variables
    '(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
  (utf-translate-cjk-mode 1))
;;;;----------------------------------------------------------------------
;;; aspell.
;;;----------------------------------------------------------------------




;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;; Use Emacs terminfo, not system terminfo
;(setq system-uses-terminfo nil)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)
