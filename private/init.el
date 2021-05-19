;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     bibtex
     common-lisp
     (elfeed :variables
             rmh-elfeed-org-files (list "~/Dropbox/project-maria/dotfiles/dotelfeed.org"))
     emacs-lisp
     evil-better-jumper
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors 't)
     finance
     git
     google-calendar
     helm
     helpful
     html
     (latex :variables
            latex-build-command "LatexMk")
     (mu4e :variables
           mu4e-use-maildirs-extension t)
     multiple-cursors
     (org :variables
          org-want-todo-bindings t
          org-enable-reveal-js-support t
          org-enable-org-journal-support nil
          org-enable-org-contacts-support t
          org-enable-appear-support t
          org-enable-sticky-header nil)
     pandoc
     pdf
     plantuml
     (python :variables
             python-backend 'anaconda)
     racket
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            ;; Make sure prerequisites for vterm are installed.
            shell-default-shell 'vterm)
     spell-checking
     syntax-checking
     (transmission :variables
                   transmission-auto-refresh-all t)
     treemacs
     version-control
     )
   ;; ***  Additional Packages
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     org-noter
     org-pdftools
     ;; Web tools to extract full text from RSS feeds
     org-web-tools
     ;; Pulls entire douay rheims bible from sword project
     ;; (sword-to-org :location (recipe :fetcher github
     ;;                                  repo "alphapapa/sword-to-org"))
     ;; Allows easier latex input in Org Mode
     cdlatex
     ;; Automatic toggling of org-toggle-latex-fragment
     org-fragtog
     ;; Tracking key frequency (command frequency)
     ;; keyfreq
     ;; See https://www.gnuvola.org/software/aa2u/
     ;; For org-brain
     ascii-art-to-unicode
     wolfram-mode
     ;; See emacs-jupyter in user config section
     jupyter
     lexic
     org-analyzer
     org-tanglesync
     (ob-racket :location
                (recipe :fetcher github :repo "DEADB17/ob-racket"))
     )
   ;; ***  Frozen & Excluded & Deleted Packages
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; Disables hitting "fd" in rapid succession to function as ESC
     evil-escape
     ;; Disables surrounding of text with "" in pairs
     evil-surround
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))
(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents-by-project . (10 . 10))
                                (bookmarks . 10))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 20.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 50
   ;; Also see large-file-warning-threshold, set in dotspacemacs user config

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
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
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format nil

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile t))


(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq org-export-backends '(ascii html icalendar latex odt beamer man md
                                    org texinfo))
  (setq org-todo-keywords
        (quote ((sequence "PROJ(p)" "TODO(t)" "NEXT(n)" "PROG(i)"
                          "WAIT(w@/!)" "HOLD" "|" "DONE(d)"
                          "CXLD(c@/!)")))))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
            This function is called at the very end of Spacemacs initialization after
            layers configuration.
            This is the place where most of your configurations should be done. Unless it is
            explicitly specified that a variable should be set before a package is loaded,
            you should place your code here."
  (use-package ob-racket
    :after org
    :pin manual
    :config
    (append '((racket . t) (scribble . t)) org-babel-load-languages)
    (setq org-babel-default-header-args:racket '((:cmd . "racket --require-script")
                                                 (:lang . sicp))))
  ;;-------------------------------------------------------------------------
  ;; ***  Transmission Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Spacemacs Editing Visual Layer Config
  ;;-------------------------------------------------------------------------
  ;; Enable centering of text
  (setq writeroom-global-effects nil)
  (setq writeroom-mode-line t)
  ;;-------------------------------------------------------------------------
  ;; ***  Spacemacs Navigation Layer Config
  ;;-------------------------------------------------------------------------
  (eval-after-load "paradox"
    (setq paradox-github-token t)) ; Stop asking to setup Github integration
  (setq paradox-column-width-version 10) ; Gives space to view entire date
  ;;-------------------------------------------------------------------------
  ;; ***  Pandoc Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Org Tanglesync Config
  ;;-------------------------------------------------------------------------
  (require 'org-tanglesync)
  (add-hook 'org-mode 'org-tanglesync-mode)
  (add-hook 'prog-mode 'org-tanglesync-watch-mode)
  (add-hook 'text-mode 'org-tanglesync-watch-mode)
  (setq org-tanglesync-default-diff-action ':prompt)
  (setq org-tanglesync-watch-files '("project-isidore.org"))
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "bS" 'org-tanglesync-process-buffer-interactive)
  ;;-------------------------------------------------------------------------
  ;; *** Org Ox Publish Config
  ;;-------------------------------------------------------------------------
  (require 'ox-rss)
  ;; Following 2 lines are needed to exclude parent heading from table of contents but still export the content
  ;; https://emacs.stackexchange.com/questions/30183/orgmode-export-skip-ignore-first-headline-level
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))
  ;; Allows exporting bibtex citations to html
  (require 'ox-bibtex)
  ;; Exclude default CSS from html export and add external stylesheet
  (setq org-html-head-include-default-style nil)
  ;; Omit inline css as we use an imported stylesheet
  (setq org-html-htmlize-output-type 'css)
  ;; https://www.taingram.org/blog/org-mode-blog.html
  (setq org-export-global-macros
        '(("timestamp" . "@@html:<span class=\"timestamp\">[$1]</span>@@")))
  (defun my/org-sitemap-date-entry-format (entry style project)
    "Format ENTRY in org-publish PROJECT Sitemap format ENTRY ENTRY STYLE format that includes date."
    (let ((filename (org-publish-find-title entry project)))
      (if (= (length filename) 0)
          (format "*%s*" entry)
        (format "{{{timestamp(%s)}}} [[file:%s][%s]]"
                (format-time-string "%Y-%m-%d"
                                    (org-publish-find-date entry project))
                entry
                filename))))
  (setq org-publish-project-alist
        '(("blog"
           :components ("blog-content" "blog-rss"))
          ("blog-content"
           :base-directory "~/Dropbox/project-maria/blog"
           :html-extension "html"
           :base-extension "org"
           :recursive t
           :publishing-function org-html-publish-to-html
           :publishing-directory "~/.roswell/local-projects/project-isidore/static/blog"
           :section-numbers t
           :table-of-contents t
           :exclude "rss.org"
           :with-title nil
           :auto-sitemap t
           :sitemap-filename "archive.org"
           :sitemap-title "Blog Archive"
           :sitemap-sort-files anti-chronologically
           :sitemap-style tree
           :sitemap-format-entry my/org-sitemap-date-entry-format
           ;; Use HTML5
           ;; https://orgmode.org/manual/HTML-doctypes.html#HTML-doctypes
           :html-doctype "html5"
           :html-html5-fancy t
           ;; Link to external custom stylesheet
           ;; If you need code highlight from highlight.js, include the latter three lines.
           :html-head "
                      <link rel=\"stylesheet\" type=\"text/css\" href=\"../global.css\"/>
                      <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">
                      <link href=\"https://fonts.googleapis.com/css2?family=Cinzel:wght@400;500;600&family=EB+Garamond:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&family=Lato:ital,wght@0,100;0,300;0,400;0,700;1,100;1,300;1,400;1,700&family=Source+Code+Pro:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500;1,600&display=swap\" rel=\"stylesheet\">
                      <link rel=\"stylesheet\" type=\"text/css\" href=\"../global.css\"/>
                      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.10.0/styles/googlecode.min.css\" />
                      <script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.10.0/highlight.min.js\"></script>
                      <script>var hlf=function(){Array.prototype.forEach.call(document.querySelectorAll(\"pre.src\"),function(t){var e;e=t.getAttribute(\"class\"),e=e.replace(/src-(\w+)/,\"src-$1 $1\"),console.log(e),t.setAttribute(\"class\",e),hljs.highlightBlock(t)})};addEventListener(\"DOMContentLoaded\",hlf);</script>"
           :html-preamble "
                      <div class=\"header header-fixed\">
                        <div class=\"navbar container\">
                          <div class=\"logo\"><a href=\"/\">Hanshen Wang</a></div>
                          <input type=\"checkbox\" id=\"navbar-toggle\" >
                          <label for=\"navbar-toggle\"><i></i></label>
                          <nav class=\"menu\">
                            <ul>
                              <li><a href=\"/about\">About</a></li>
                              <li><a href=\"/work\">Work</a></li>
                              <li><a href=\"/blog/archive.html\">Blog</a></li>
                              <li><a href=\"/contact\">Contact</a></li>
                            </ul>
                          </nav>
                        </div>
                      </div>
                      <h1 class=\"title\">%t</h1>
                      <p class=\"subtitle\">%s</p> <br/>
                      <p class=\"updated\"><a href=\"/contact#article-history\">Updated:</a> %C</p>"

           ;; Article Postamble includes
           ;; Javascript snippet to insert anchor links to Table of Contents
           ;; HTML Footer
           :html-postamble "<script>
                const headers = Array.from( document.querySelectorAll('h2, h3, h4, h5, h6') );

                headers.forEach( header => {
                  header.insertAdjacentHTML('afterbegin',
                   '<a href=\"#table-of-contents\">&#8689;</a>'
                  );
                });
                </script>
                <hr/>
                <footer>
                  <div class=\"copyright-container\">
                    <div class=\"copyright\">
                      Comments? Corrections? <a href=\"https://hanshenwang.com/contact\"> Please do reach out.</a><a href=\"https://hanshenwang.com/blog/rss.xml\"> RSS Feed. </a><br/>
                      Copyright &copy; 2021 Hanshen Wang. Some Rights Reserved.<br/>
                      Content is available under
                      <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/4.0/\">
                        CC-BY-SA 4.0
                      </a> unless otherwise noted.
                    </div>
                    <div class=\"cc-badge\">
                      <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/4.0/\">
                        <img alt=\"Creative Commons License\"
                             src=\"https://i.creativecommons.org/l/by-sa/4.0/88x31.png\" />
                      </a>
                    </div>
                    <div class=\"rss-badge\">
                      <a rel=\"license\" href=\"http://hanshenwang.com/blog/rss.xml\">
                        <img alt=\"Really Simple Syndication - RSS\"
                             src=\"https://upload.wikimedia.org/wikipedia/en/thumb/4/43/Feed-icon.svg/50px-Feed-icon.svg.png\" />
                      </a>
                    </div>
                  </div>

                  <div class=\"generated\">
                    Created with %c on <a href=\"https://www.gnu.org\">GNU</a>/<a href=\"https://www.kernel.org/\">Linux</a>
                  </div>
                </footer>"
           )
          ("blog-rss"
           :base-directory "~/Dropbox/project-maria/blog"
           :base-extension "org"
           :publishing-directory "~/.roswell/local-projects/project-isidore/static/blog"
           :publishing-function publish-posts-rss-feed
           :rss-extension "xml"
           :html-link-home "http://hanshenwang.com/"
           :html-link-use-abs-url t
           :html-link-org-files-as-html t
           :exclude "archive.org"
           :auto-sitemap t
           :sitemap-function posts-rss-feed
           :sitemap-title "Hanshen Wang Blog RSS"
           :sitemap-filename "rss.org"
           :sitemap-style list
           :sitemap-sort-files anti-chronologically
           :sitemap-format-entry format-posts-rss-feed-entry)
          ))
  ;; https://alhassy.github.io/AlBasmala#Clickable-Headlines
  (defun my/ensure-headline-ids (&rest _)
    "Org trees without a custom ID will have
                All non-alphanumeric characters are cleverly replaced with ‘-’.

                If multiple trees end-up with the same id property, issue a
                message and undo any property insertion thus far.

                E.g., ↯ We'll go on a ∀∃⇅ adventure
                   ↦  We'll-go-on-a-adventure
                "
    (interactive)
    (let ((ids))
      (org-map-entries
       (lambda ()
         (org-with-point-at (point)
           (let ((id (org-entry-get nil "CUSTOM_ID")))
             (unless id
               (thread-last (nth 4 (org-heading-components))
                 (s-replace-regexp "[^[:alnum:]']" "-")
                 (s-replace-regexp "-+" "-")
                 (s-chop-prefix "-")
                 (s-chop-suffix "-")
                 (setq id))
               (if (not (member id ids))
                   (push id ids)
                 (message-box "Oh no, a repeated id!\n\n\t%s" id)
                 (undo)
                 (setq quit-flag t))
               (org-entry-put nil "CUSTOM_ID" id))))))))

  ;; Whenever html & md export happens, ensure we have headline ids.
  (advice-add 'org-html-export-to-html   :before 'my/ensure-headline-ids)
  (advice-add 'org-md-export-to-markdown :before 'my/ensure-headline-ids)
  ;; https://nicolasknoebber.com/posts/blogging-with-emacs-and-org.html
  (defun format-posts-rss-feed-entry (entry _style project)
    "Format ENTRY for the posts RSS feed in PROJECT."
    (org-publish-initialize-cache "blog-rss")
    (let* ((title (org-publish-find-title entry project))
           (link (concat "blog/" (file-name-sans-extension entry) ".html"))
           (author (org-publish-find-property entry :author project))
           (pubdate (format-time-string (car org-time-stamp-formats)
                                        (org-publish-find-date entry project))))
      (message pubdate)
      (format "%s
  :properties:
  :rss_permalink: %s
  :author: %s
  :pubdate: %s
  :end:\n"
              title
              link
              author
              pubdate)))
  (defun posts-rss-feed (title list)
    "Generate a sitemap of posts that is exported as a RSS feed.
  TITLE is the title of the RSS feed.  LIST is an internal
  representation for the files to include.  PROJECT is the current
  project."
    (concat
     "#+TITLE: " title "\n#+EMAIL: hanshen@hanshenwang.com" "\n\n"
     (org-list-to-subtree list)))
  (defun publish-posts-rss-feed (plist filename dir)
    "Publish PLIST to RSS when FILENAME is rss.org.
  DIR is the location of the output."
    (if (equal "rss.org" (file-name-nondirectory filename))
        (org-rss-publish-to-rss plist filename dir)))
  ;;-------------------------------------------------------------------------
  ;; ***  Evil Snipe Config
  ;;-------------------------------------------------------------------------
  ;; Disable all keybindings other than f/t
  (evil-snipe-mode -1)
  (setq  evil-snipe-scope 'whole-visible)
  ;; Alias [ and ] to all types of brackets
  ;; Alias ' to ' and "
  (setq evil-snipe-aliases
        '((?\[ "[[{(]")
          (?\] "[]})]")
          (?\' "['\"]")))
  ;; Remove overriding of "," key in visual mode Ex. "vf),"
  (setq evil-snipe-override-evil-repeat-keys t)
  ;;-------------------------------------------------------------------------
  ;; ***  PlantUml Config
  ;;-------------------------------------------------------------------------
  (setq plantuml-default-exec-mode 'jar
        plantuml-jar-path "~/plantuml.jar"
        org-plantuml-jar-path "~/plantuml.jar")
  (setq plantuml-output-type "txt")
  (require 'org)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  ;;-------------------------------------------------------------------------
  ;; ***  PDF tools config
  ;;-------------------------------------------------------------------------
  ;; Initilization settings. Source: http://pragmaticemacs.com/emacs/even-more-pdf-tools-tweaks/
  ;; Allows scaling of images during rendering
  (setq pdf-view-use-scaling t)
  (setq pdf-view-display-size 'fit-page)
  (setq pdf-view-resize-factor 1.1)
  ;; Custom function to allow double page scrolling by calling
  ;; my-pdf-view-double-scroll-horizontal-view
  (defun my-pdf-view-double-scroll-up-or-next-page (&optional arg)
    "Scroll page up ARG lines if possible, else go to the next page.
  When `pdf-view-continuous' is non-nil, scrolling upward at the
  bottom edge of the page moves to the next page.  Otherwise, go to
  next page only on typing SPC (ARG is nil)."
    (interactive "P")
    (if (or pdf-view-continuous (null arg))
        (let ((hscroll (window-hscroll))
              (cur-page (pdf-view-current-page)))
          (when (or (= (window-vscroll) (image-scroll-up arg))
                    ;; Workaround rounding/off-by-one issues.
                    (memq pdf-view-display-size
                          '(fit-height fit-page)))
            (pdf-view-next-page 2)
            (when (/= cur-page (pdf-view-current-page))
              (image-bob)
              (image-bol 1))
            (set-window-hscroll (selected-window) hscroll)))
      (image-scroll-up arg)))
  (defun my-pdf-view-double-scroll-horizontal-view ()
    (interactive)
    (my-pdf-view-double-scroll-up-or-next-page)
    (other-window 1)
    (my-pdf-view-double-scroll-up-or-next-page)
    (other-window 1))
  ;; add spacemacs major mode keybind
  (spacemacs/set-leader-keys-for-major-mode 'pdf-view-mode "d" 'my-pdf-view-double-scroll-horizontal-view)
  ;; Auto enable pdf-view-midnight-minor-mode
  (add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)
  ;; Clears image cache to reduce ram usage
  (setq image-cache-eviction-delay 15)
  ;; Allow rotating of sheet music in pdfs
  (defun pdf-view--rotate (&optional counterclockwise-p page-p)
    "Rotate PDF 90 degrees.  Requires pdftk to work.\n
  Clockwise rotation is the default; set COUNTERCLOCKWISE-P to
  non-nil for the other direction.  Rotate the whole document by
  default; set PAGE-P to non-nil to rotate only the current page.
  \nWARNING: overwrites the original file, so be careful!"
    ;; error out when pdftk is not installed
    (if (null (executable-find "pdftk"))
        (error "Rotation requires pdftk")
      ;; only rotate in pdf-view-mode
      (when (eq major-mode 'pdf-view-mode)
        (let* ((rotate (if counterclockwise-p "left" "right"))
               (file   (format "\"%s\"" (pdf-view-buffer-file-name)))
               (page   (pdf-view-current-page))
               (pages  (cond ((not page-p)                        ; whole doc?
                              (format "1-end%s" rotate))
                             ((= page 1)                          ; first page?
                              (format "%d%s %d-end"
                                      page rotate (1+ page)))
                             ((= page (pdf-info-number-of-pages)) ; last page?
                              (format "1-%d %d%s"
                                      (1- page) page rotate))
                             (t                                   ; interior page?
                              (format "1-%d %d%s %d-end"
                                      (1- page) page rotate (1+ page))))))
          ;; empty string if it worked
          (if (string= "" (shell-command-to-string
                           (format (concat "pdftk %s cat %s "
                                           "output %s.NEW "
                                           "&& mv %s.NEW %s")
                                   file pages file file file)))
              (pdf-view-revert-buffer nil t)
            (error "Rotation error!"))))))

  (defun pdf-view-rotate-clockwise (&optional arg)
    "Rotate PDF page 90 degrees clockwise.  With prefix ARG, rotate
  entire document."
    (interactive "P")
    (pdf-view--rotate nil (not arg)))

  (defun pdf-view-rotate-counterclockwise (&optional arg)
    "Rotate PDF page 90 degrees counterclockwise.  With prefix ARG,
  rotate entire document."
    (interactive "P")
    (pdf-view--rotate :counterclockwise (not arg)))

  (define-key spacemacs-pdf-view-mode-map (kbd "R") 'pdf-view-rotate-clockwise)
   ;;-------------------------------------------------------------------------
   ;; ***  Magit Config
   ;;-------------------------------------------------------------------------
  (setq ghub-use-workaround-for-emacs-bug 'force)
  ;;-------------------------------------------------------------------------
  ;; ***  Spell Checking Layer Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Emacs Jupyter Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Ledger Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Dired Config
  ;;-------------------------------------------------------------------------
  (require 'dired)
  ;; Changes the dired buffer to display less details.
  (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode)))
  ;; Rebinds "s" from "hydra-dired-quick-sort/body" to "avy-goto-word-or-subword-1"
  (eval-after-load "dired-mode"
    (evilified-state-evilify dired-mode dired-mode-map
      (define-key dired-mode-map (kbd ";") #'helm-swoop)
      (define-key dired-mode-map (kbd "s") #'avy-goto-word-or-subword-1)
      (define-key dired-mode-map (kbd "S") #'hydra-dired-quick-sort/body)))
  ;;-------------------------------------------------------------------------
  ;; ***  Common Lisp Config
  ;;-------------------------------------------------------------------------
  ;; (setq common-lisp-hyperspec-root "file:///home/hanshen/project-isidore-reboot/HyperSpec/")
  (setq inferior-lisp-program "ros -Q run")
  ;;-------------------------------------------------------------------------
  ;; ***  Python Layer Config
  ;;-------------------------------------------------------------------------
  (setq python-format-on-save t)
  ;; Make sure the black formatter package is installed
  (setq python-formatter 'black)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Web Tools Config
  ;;-------------------------------------------------------------------------
  ;; Fix for wget option flags, as per https://github.com/alphapapa/org-web-tools/issues/35
  (setq org-web-tools-archive-wget-options '("--ignore-tags=script,iframe" "--reject=eot,ttf,svg,otf,*.woff*" "--execute" "robots=off" "--adjust-extension" "--span-hosts" "--convert-links" "--page-requisites" "--timestamping" "--no-directories"))
  (setq org-web-tools-archive-wget-html-only-options '("--execute" "robots=off" "--adjust-extension" "--timestamping" "--no-directories"))
  ;;-------------------------------------------------------------------------
  ;; ***  Lexic Config
  ;;-------------------------------------------------------------------------
  (require 'lexic)
  (setq lexic-dictionary-specs '
        (
         ;; The Golden Mean
         ("Webster's Revised Unabridged Dictionary (1913)"
          :short "===============================================================================\n Webster's Revised Unabridged Dictionary (1913)\n================================================================================"
          :formatter lexic-format-webster
          :priority 1)
         ;; Synonyms
         ("Soule's Dictionary of English Synonyms (En-En)"
          :short "===============================================================================\n Soule's Dictionary of English Synonyms (1871)\n================================================================================"
          :formatter lexic-format-soule
          :priority 2)
         ("Moby Thesaurus II"
          :short "===============================================================================\n Moby Thesaurus II by Grady Ward, 1.0 (2002)\n================================================================================"
          :priority 3)
         ;; Wham Bam Thank you Ma'am
         ("WordNet 3.0 (En-En)"
          :short "===============================================================================\n WordNet (r) 3.0 (2009)\n================================================================================"
          :formatter lexic-format-webster
          :priority 4)
         ;; The Standard Bearer
         ("Oxford English Dictionary 2nd Ed. P1"
          :short "===============================================================================\n Oxford English Dictionary 2nd Ed. (1989)\n================================================================================"
          :formatter lexic-format-soule
          :priority 5)
         ("Oxford English Dictionary 2nd Ed. P2"
          :short "===============================================================================\n Oxford English Dictionary 2nd Ed. (1989)\n================================================================================"
          :formatter lexic-format-soule
          :priority 6)
         ;; Encyclopedia
         ;; Anything more and one should turn to google
         ("The Britannica Concise"
          :short "===============================================================================\n Britannica Concise Encyclopedia (2006)\n================================================================================"
          :priority 7)
         ;; Specialized Dictionaries
         ;; Insert Bible Catholic Dictionary
         ;; Law
         ("Bouvier's Law Dictionary"
          :short "===============================================================================\n Bouvier's Law Dictionary, Revised 6th Ed. (1856)\n================================================================================"
          :priority 8)
         ("Black's Law Dictionary 8th Edition"
          :short "===============================================================================\n Black's Law Dictionary 8th Edition\n================================================================================"
          :priority 9)
         ;; Medicine
         ("Black's Medical Dictionary"
          :short "===============================================================================\n Black's Medical Dictionary 41st Ed.\n================================================================================"
          :formatter lexic-format-soule
          :priority 10)
         ("Stedman's Medical Dictionary"
          :short "===============================================================================\n Stedman's Medical Dictionary\n================================================================================"
          :formatter lexic-format-soule
          :priority 11)
         ;; Science
         ("McGraw-Hill Dictionary of Science and Technology"
          :short "===============================================================================\n McGraw-Hill Dictionary of Science and Technology\n================================================================================"
          :formatter lexic-format-soule
          :priority 12)
         ("Elements database"
          :short "===============================================================================\n Elements Database compiled J. Kominek (2000)\n================================================================================"
          :formatter lexic-format-element
          :priority 13)
         ))
  ;; Set Global Keybindings
  (spacemacs/set-leader-keys "sx" 'lexic-search-word-at-point)
  (spacemacs/set-leader-keys "sX" 'lexic-search)
  ;; Set Lexic Major Mode Keybindings
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "q" 'lexic-return-from-lexic)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode (kbd "RET") 'lexic-search-word-at-point)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "a" 'outline-show-all)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "h" 'outline-hide-body)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "o" 'lexic-toggle-entry)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "n" 'lexic-next-entry)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "p" 'lexic-previous-entry)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "b" 'lexic-search-history-backwards)
  (spacemacs/set-leader-keys-for-major-mode 'lexic-mode "f" 'lexic-search-history-forwards)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Recoll Config
  ;;-------------------------------------------------------------------------
  (load "~/.emacs.d/private/local/org-recoll.el")
  (setq org-recoll-results-num 50)
  (spacemacs/set-leader-keys "ss" 'org-recoll-search)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Attach Config
  ;;-------------------------------------------------------------------------
  (setq org-attach-id-dir "~/project-jerome/org-attach-data/" )
  (setq org-attach-preferred-new-method 'dir)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Download Config
  ;;-------------------------------------------------------------------------
  (setq org-download-method 'attach)
  ;;-------------------------------------------------------------------------
  ;; ***  Avy Config
  ;;-------------------------------------------------------------------------
  (setq avy-style 'words)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Expiry Config
  ;;-------------------------------------------------------------------------
  ;; Add key bindings for org-expiry package
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "dc" 'org-expiry-insert-created)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "de" 'org-expiry-insert-expiry)
  ;; Add call to org-expiry-insert-created every time org-id-get-create is run
  (advice-add 'org-id-get-create :after 'org-expiry-insert-created)
  ;;-------------------------------------------------------------------------
  ;; ***  Emacs Config
  ;;-------------------------------------------------------------------------
  ;;-------------------------------------------------------------------------
  ;; ***  Save Hist Config
  ;;-------------------------------------------------------------------------
  ;; For more session management solutions:
  ;; https://www.emacswiki.org/emacs/SessionManagement
  (setq savehist-additional-variables '(evil-jumps-history
                                        mark-ring global-mark-ring search-ring regexp-search-ring
                                        extended-command-history org-brain-headline-cache
                                        bibtex-completion-cache helm-ff-history))
  (setq safe-local-variable-values '(
                                     (eval add-hook 'after-save-hook
                                           (lambda nil
                                             (if
                                                 (y-or-n-p "Tangle?")
                                                 (org-babel-tangle)))
                                           nil t)
                                     (eval add-hook 'after-save-hook
                                           (lambda nil
                                             (if
                                                 (y-or-n-p "Reload?")
                                                 (load-file user-init-file)))
                                           nil t)
                                     ))
  ;; The behaviors Emacs offers for scrolling can be customized
  ;; by the variables some of which were already mentioned:
  ;; scroll-conservatively, scroll-margin, scroll-step, and
  ;; scroll-up/down-aggressively. They basically control whether
  ;; Emacs recenters point when it scrolls the window, when (if
  ;; at all) it does recenter, by how many lines it scrolls if
  ;; it doesn't recenter, and how close to window edges point is
  ;; allowed to be before the window is scrolled. This defines a
  ;; set of behaviors you can get universally. In general, the
  ;; default is to recenter if scrolling by a few lines fails to
  ;; bring point into view. That is what you see, and that is
  ;; how Emacs works.
  ;; Source: https://old.reddit.com/r/emacs/comments/8jli87/is_there_a_hook_after_cursor_jump/
  (setq scroll-conservatively 0)
  (setq scroll-preserve-screen-position t)
  ;; Prefer 80 chars due to anatomical restriction of the human eye
  ;; Secondary concern of long known emacs performance issues with long lines
  (setq-default auto-fill-function 'do-auto-fill)
  ;; Includes config for built in packages like M-x calc
  ;;-------------------------------------------------------------------------
  ;; ***  Calc Config
  ;;-------------------------------------------------------------------------
  ;; allows the use of SPC leader key in calc buffer
  (with-eval-after-load 'calc
    (define-key calc-mode-map " " spacemacs-cmds))
  (setq large-file-warning-threshold '100000000)
  (setq image-cache-eviction-delay '15)
  ;;-------------------------------------------------------------------------
  ;; ***  Yasnippet Config
  ;;-------------------------------------------------------------------------
  ;; https://github.com/joaotavora/yasnippet/issues/998#issuecomment-496449546
  (defun my-yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))
  (add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)
  ;;-------------------------------------------------------------------------
  ;; ***  Spaceline Config
  ;;-------------------------------------------------------------------------
  ;; Adds currently clocked task, battery and time onto the modeline
  (spacemacs/toggle-mode-line-org-clock)
  (spacemacs/toggle-mode-line-battery)
  (spacemacs/toggle-display-time)
  ;;-------------------------------------------------------------------------
  ;; ***  Evil Config
  ;;-------------------------------------------------------------------------
  (setq evil-want-Y-yank-to-eol nil)
  ;; C-h f "evilnc-comment-operator" or any of the default evil keybindings
  ;; to discover what maps you need to override.
  ;; Delete package evil-surround to resolve issue
  ;; As "s" or evil-substitute is rarely used, c for change is better
  ;; rebind "SPC j j" or avy-timer to "s"
  ;; At first, will not work as evil-surround is using "s" in visual mode
  ;; Delete package evil-surround to resolve issue
  (define-key evil-motion-state-map (kbd "s") 'avy-goto-word-or-subword-1)
  (define-key evil-normal-state-map (kbd "s") 'avy-goto-word-or-subword-1)
  (define-key evil-visual-state-map (kbd "s") 'avy-goto-word-or-subword-1)
  (define-key evil-operator-state-map (kbd "s") 'avy-goto-word-or-subword-1)
  (define-key package-menu-mode-map (kbd "s") 'avy-goto-word-or-subword-1)
  ;; Helm-swoop rebinding
  (define-key evil-motion-state-map (kbd ";") 'helm-swoop)
  (define-key evil-normal-state-map (kbd ";") 'helm-swoop)
  (define-key evil-visual-state-map (kbd ";") 'helm-swoop)
  (define-key evil-operator-state-map (kbd ";") 'helm-swoop)
  (define-key mu4e-headers-mode-map (kbd ";") 'helm-swoop)
  (define-key mu4e-main-mode-map (kbd ";") 'helm-swoop)
  (define-key package-menu-mode-map (kbd ";") 'helm-swoop)
  (define-key undo-tree-visualizer-mode-map (kbd ";") 'helm-swoop)
  ;; bind hanshen/project-maria-rg to replace evil-ex--search
  ;; (define-key evil-normal-state-map (kbd "/") 'hanshen/project-maria-rg)
  ;; (define-key evil-visual-state-map (kbd "/") 'hanshen/project-maria-rg)
  ;; (define-key evil-operator-state-map (kbd "/") 'hanshen/project-maria-rg)
  ;; (define-key evil-normal-state-map (kbd "/") 'hanshen/project-maria-rg)
  ;; bind helm-swoop with selected text to replace evil-ex--back-search
  ;; (define-key evil-visual-state-map (kbd "?") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
  ;; (define-key evil-operator-state-map (kbd "?") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
  ;; (define-key evil-operator-state-map (kbd "?") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
  ;; (define-key evil-operator-state-map (kbd "?") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
  ;;-------------------------------------------------------------------------
  ;; ***  Helm Config
  ;;-------------------------------------------------------------------------
  ;; Turns on auto-complete in helm buffers
  (setq helm-ff-auto-update-initial-value t)
  ;; removes [omitted long lines with n matches] in search results
  ;; by adjusting max-column setting of ripgrep, or "rg"
  ;; See: https://github.com/syl20bnr/spacemacs/pull/10310
  (setq spacemacs-helm-rg-max-column-number nil)
  ;; Makes sure all mlocate commands use the proper database
  (setq helm-locate-command "locate %s -d ~/.locate.db -e -A --regex %s")
  ;; Source: https://emacs.stackexchange.com/questions/12331/can-helm-find-file-in-the-parents-directory-automatically
  ;; Bind =SPC f SPC= to helm-for-files
  (setq helm-for-files-preferred-list '(helm-source-buffers-list helm-source-recentf helm-source-bookmarks helm-source-file-cache helm-source-files-in-current-dir helm-source-locate))
  (spacemacs/set-leader-keys "f SPC" 'helm-for-files)
  ;; limit max number of matches displayed for speed
  (setq helm-candidate-number-limit 100)
  ;; ignore boring files like .o and .a
  (setq helm-ff-skip-boring-files t)
  ;; helm swoop use fuzzy search
  (setq helm-swoop-use-fuzzy-match nil)
  (defun hanshen/project-maria-rg () ; Keybinding is in evil config
    "Search in project-maria with `rg'."
    (interactive)
    (spacemacs/helm-files-do-rg "~/Dropbox/project-maria/"))
  (defun hanshen/project-maria-rg-region-or-symbol () ; Keybinding is in evil config
    "Search in project-maria with `rg' using a default input."
    (interactive)
    (spacemacs//helm-do-ag-region-or-symbol 'spacemacs/helm-files-do-rg "~/Dropbox/project-maria/"))
  (spacemacs/set-leader-keys (kbd ";") 'hanshen/project-maria-rg)
  (spacemacs/set-leader-keys (kbd ":") 'hanshen/project-maria-rg-region-or-symbol)
  ;; Helm-for-files and helm-locate cover universal filenames and their contents respectively.
  ;; We now need to cover directories.
  (defun hanshen/helm-recent-directories()
    (interactive)
    (let ((current-prefix-arg 4)) ; emulate C-u
      (call-interactively 'helm-find-files))) ; invoke align-regexp interactively
  (spacemacs/set-leader-keys "fd" 'hanshen/helm-recent-directories)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Mode Config
  ;;-------------------------------------------------------------------------
  (require 'org-depend)
  ;; As org-depend is part of org-contrib, we must ensure load-path and require
  (setq org-directory "~/Dropbox/project-maria/")
  (setq org-agenda-files '("~/Dropbox/project-maria/task-management/0inbox.org"
                           "~/Dropbox/project-maria/task-management/0projects.org"
                           "~/Dropbox/project-maria/task-management/0solo.org"
                           "~/Dropbox/project-maria/task-management/0someday.org"
                           "~/Dropbox/project-maria/task-management/0contacts.org"
                           "~/Dropbox/project-maria/task-management/0calendar.org"
                           "~/Dropbox/project-maria/task-management/project-jerome-index.org"))
  ;; See org-superstar package for more context
  (setq inhibit-compacting-font-caches t)
  ;; See Org Manual 16.4 A Cleaner Outline View
  ;; I prefer a book-like view, which also allows for auto-fill
  (setq org-adapt-indentation nil)
  ;; Recognize a. A. a) A) as ordered lists
  (setq org-list-allow-alphabetical t)
  ;; Do not show parent headings when calling org-occur
  ;; relevant snippet below is occur-tree . minimal
  (setq org-show-context-detail '((agenda . local)
                                  (bookmark-jump . lineage)
                                  (isearch . lineage)
                                  (occur-tree . minimal)
                                  (default . ancestors)))
  ;; Enable footnote auto adjustment and sorting
  (setq org-footnote-auto-adjust "Renumber and Sort")
  ;; Add key binding for org-id-get-create
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "iI" 'org-id-get-create)
  ;; Add key binding for org-table-create-or-convert-from-region
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "tC" 'org-table-create-or-convert-from-region)
  ;; Add completion function to org-link-parameters
  ;; Source https://emacs.stackexchange.com/questions/12391/insert-org-id-link-at-point-via-outline-path-completion
  (defun org-id-complete-link (&optional arg)
    "Create an id: link using completion"
    (concat "id:"
            (org-id-get-with-outline-path-completion)))
  (org-link-set-parameters "id"
                           :complete 'org-id-complete-link)
  ;; Source
  ;; https://hungyi.net/posts/copy-org-mode-url/
  (defun org-retrieve-url-from-point ()
    "Copies the URL from an org link at the point"
    (interactive)
    (let ((plain-url (url-get-url-at-point)))
      (if plain-url
          (progn
            (kill-new plain-url)
            (message (concat "Copied: " plain-url)))
        (let* ((link-info (assoc :link (org-context)))
               (text (when link-info
                       (buffer-substring-no-properties
                        (or (cadr link-info) (point-min))
                        (or (caddr link-info) (point-max))))))
          (if (not text)
              (error "Oops! Point isn't in an org link")
            (string-match org-link-bracket-re text)
            (let ((url (substring text (match-beginning 1) (match-end 1))))
              (kill-new url)
              (message (concat "Copied: " url))))))))
  ;; Create major mode keybinding
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "xy" 'org-retrieve-url-from-point)
  (setq org-image-actual-width '600)
  (setq org-hide-emphasis-markers nil)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Web Tools Config
  ;;-------------------------------------------------------------------------
  (setq org-sticky-header-full-path 'full)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Contacts Config
  ;;-------------------------------------------------------------------------
  ;; Require org-contacts to work with mu4e
  (require 'org-contacts)
  (setq org-contacts-files '("~/Dropbox/project-maria/task-management/0contacts.org"))
  (require 'org-re-reveal)
  (setq org-re-reveal-revealjs-version "4")
  ;;-------------------------------------------------------------------------
  ;; ***  Org Mime Config
  ;;-------------------------------------------------------------------------
  (setq org-mime-export-options '(:section-numbers nil
                                                   ;; otherwise tables will not work
                                                   :with-broken-links t
                                                   :with-author nil
                                                   :with-toc nil
                                                   :with-latex dvipng))
  ;;-------------------------------------------------------------------------
  ;; ***  Org Babel Config
  ;;-------------------------------------------------------------------------
  (require 'org)
  ;; For when you are lost in a long code block
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "bh" 'org-babel-goto-src-block-head)
  ;; Used below to rename org edit blocks
  ;; https://emacs.stackexchange.com/questions/2483/referring-to-the-org-babel-src-block-name-from-within-the-script
  ;; EDIT please change function so that src blocks with no name get a temporary
  ;;name. otherwise code highlighting is broken.
  (defun org-src--construct-edit-buffer-name (org-buffer-name lang)
    "Construct the buffer name for a source editing buffer."
    (concat (nth 4 (org-babel-get-src-block-info)) " [" lang "]"))
  ;; =SPC h d v "org-babel-load-languages" shows that emacs-lisp and
  ;; shell code is already enabled in org-babel.
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((ledger . t)
                                         (calc . t)
                                         (js . t)
                                         (emacs-lisp . t)
                                         (shell . t)
                                         (lisp . t)
                                         (mathematica . t)
                                         (latex . t)
                                         (jupyter . t) ;; must be last
                                         )))
  ;; Sanitize output and deal with paths
  (setq org-babel-mathematica-command "~/Dropbox/project-maria/mash.pl")
  ;; Font-locking
  (add-to-list 'org-src-lang-modes '("mathematica" . wolfram))
  (autoload 'wolfram-mode "wolfram-mode" nil t)
  (autoload 'run-wolfram "wolfram-mode" nil t)
  (setq wolfram-program "/home/hanshen/Wolfram/WolframEngine/12.2/Executables/WolframKernel")
  (add-to-list 'auto-mode-alist '("\.m$" . wolfram-mode))
  (setq wolfram-path "~/.WolframEngine/Applications") ;; e.g. on Linux ~/.Mathematica/Applications
  ;; For wolfram-mode
  (setq mathematica-command-line "~/Dropbox/project-maria/mash.pl")
  (setq org-confirm-babel-evaluate nil)
  (setq org-babel-python-command "/usr/bin/python3")
  ;; enable proper mode for sagemath code blocks
  (add-to-list 'org-src-lang-modes '("jupyter-sage" . python))
  ;; See library of babel > org babel org heading for more detail
  (defun org-in-tangle-dir (sub-path)
    "Expand the SUB-PATH into the directory given by the tangle-dir
           property if that property exists, else use the
           `default-directory'."
    (expand-file-name sub-path
                      (or
                       (org-entry-get (point) "tangle-dir" 'inherit)
                       (default-directory))))
  ;;-------------------------------------------------------------------------
  ;; ***  Org Rifle Config
  ;;-------------------------------------------------------------------------
  (setq helm-org-rifle-show-path t)
  ;;-------------------------------------------------------------------------
  ;; *** Org Cdlatex Config
  ;; -------------------------------------------------------------------------
  ;; https://old.reddit.com/r/emacs/comments/g8ecpj/advice_for_auclatex_what_keybinds_do_you_find/foo64ge/
  ;; What really increased my speed is having snippets (yasnippet) for
  ;; frequently used patterns, auto paired parentheses
  ;; (electric-pair-local-mode or smartparens), and cd-latex
  ;; (org-cdlatex-mode) which auto inserts brackets for
  ;; subscript/superscripts. There's still a lot more to be done for speed,
  ;; learning these packages and creating keybindings though. All in due
  ;; time! Turns on unicode characters for org-mode
  (setq org-pretty-entities t)
  (setq org-pretty-entities-include-sub-superscripts nil)
  ;; Bigger latex fragment
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3))
  ;; It generates a a png and overlays it onto the text as soon as your cursor moves away from the math mode dollar signs.
  ;; Automatically toggle org-mode latex fragment previews as the
  ;; cursor enters and exits them
  (add-hook 'org-mode-hook 'org-fragtog-mode)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Noter Config
  ;;-------------------------------------------------------------------------
  (setq
   ;; The WM can handle splits
   ;; org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   ;; org-noter-hide-other nil
   ;; Everything is relative to the main notes file
   ;; org-noter-notes-search-path (list org_notes)
   ;; Save last location
   org-noter-auto-save-last-location t
   )
  ;; add spacemacs keybind
  (spacemacs/set-leader-keys "aon" 'org-noter)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Gcal Config
  ;;-------------------------------------------------------------------------
  (require 'org)
  (setq org-gcal-client-id "694392086923-tp9vlkjdl9k037ueocv0ihv284gukbo2.apps.googleusercontent.com"
        org-gcal-client-secret "1pxJTZ48qJWg3DmV8qltAU3b"
        org-gcal-file-alist '(("contacthanshenwang@gmail.com" .  "~/Dropbox/project-maria/task-management/0calendar.org")))
  ;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync)))
  ;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync)))
  ;; Nests repeating weekly events
  (setq org-gcal-recurring-events-mode 'nested)
  ;; Turn off auto-archive
  (setq org-gcal-auto-archive nil)
  ;; Fetch events 90 days after, and 0 before
  (setq org-gcal-down-days '90)
  (setq org-gcal-up-days '0)
  (defun my-org-gcal-set-effort (_calendar-id event _update-mode)
    "Set Effort property based on EVENT if not already set."
    (when-let* ((stime (plist-get (plist-get event :start)
                                  :dateTime))
                (etime (plist-get (plist-get event :end)
                                  :dateTime))
                (diff (float-time
                       (time-subtract (org-gcal--parse-calendar-time-string etime)
                                      (org-gcal--parse-calendar-time-string stime))))
                (minutes (floor (/ diff 60))))
      (let ((effort (org-entry-get (point) org-effort-property)))
        (unless effort
          (message "need to set effort - minutes %S" minutes)
          (org-entry-put (point)
                         org-effort-property
                         (apply #'format "%d:%02d" (cl-floor minutes 60)))))))
  (add-hook 'org-gcal-after-update-entry-functions #'my-org-gcal-set-effort)
  ;; see, https://github.com/kidd/org-gcal.el/pull/139
  ;; (defun hanshen/org-post-appt-to-gcal ()
  ;;   "Post capture hook for appointments that post event to Google Calendar"
  ;;   (if (equal (plist-get org-capture-plist :key) "a") ; Get buffer key & compare
  ;;       (progn (org-capture-goto-last-stored) (org-gcal-post-at-point))))
  ;; (add-hook 'org-capture-after-finalize-hook 'hanshen/org-post-appt-to-gcal)
  ;;-------------------------------------------------------------------------
  ;; ***  Org Ref & Helm Bibtex Config
  ;;-------------------------------------------------------------------------
  (setq org-bibtex-file "~/Dropbox/project-maria/project-jerome.bib")
  (setq reftex-default-bibliography '("~/Dropbox/project-maria/project-jerome.bib"))
  (spacemacs/set-leader-keys "s SPC" 'helm-bibtex)
  ;; Adjusts the buffer height to use the default helm buffer height
  (setq helm-bibtex-full-frame nil)
  ;; Clicking on a citation in an org file will draw up a list of actions
  ;; One of these is view notes. this is where the index of notes is stored
  ;; Alternatively, calling ", n" while in project-jerome.bib will call
  ;; org-ref-open-bibtex-notes, which will populate project-jerome-index.org
  ;; Tell org-ref to let helm-bibtex find notes for it
  (setq org-ref-notes-function
        (lambda (thekey)
          (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
            (bibtex-completion-edit-notes
             (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
  ;; self-explanatory. Same bib file as helm-bibtex.
  (setq org-ref-default-bibliography '("~/Dropbox/project-maria/project-jerome.bib"))
  ;; where org-ref will look for pdf's here. Again shared with helm-bibtex
  (setq org-ref-pdf-directory "~/project-jerome/")
  ;; Taken from  https://github.com/jkitchin/org-ref/blob/master/org-ref.org#customizing-how-pdfs-are-opened
  (setq org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex)
  (defun my/org-ref-open-pdf-at-point ()
    "Open the pdf for bibtex key under point if it exists."
    (interactive)
    (let* ((results (org-ref-get-bibtex-key-and-file))
           (key (car results))
           (pdf-file (funcall org-ref-get-pdf-filename-function key)))
      (if (file-exists-p pdf-file)
          (find-file pdf-file)
        (message "No PDF found for %s" key))))

  (setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point)
  ;; is not needed as org-ref will use helm-bibtex library path
  ;; helm-bibtex setup. Only noteworthy difference is that opening notes from
  ;; M-x helm-bibtex will open the correct notes
  (setq bibtex-completion-bibliography "~/Dropbox/project-maria/project-jerome.bib")
  (setq bibtex-completion-notes-path "~/Dropbox/project-maria/notes/bibtex-notes")
  (setq bibtex-completion-notes-template-multiple-files
        (concat
         "#+TITLE: ${title}\n"
         "* ${title}\n"
         ":PROPERTIES:\n"
         ":AUTHOR: ${author-abbrev}\n"
         ":DATE: ${date}\n"
         ":YEAR: ${year}\n"
         ":END:\n\n"
         ))
  ;; If zotero links a pdf, then the file field will be populated
  ;; default helm-bibtex behaviour searches for the "key+.pdf"
  ;; in the library paths variable below.
  (setq bibtex-completion-pdf-field "file")
  (setq bibtex-completion-library-path '(
                                         "~/project-jerome"
                                         "~/project-jerome/000-generalities-information-computers/000-computer-science"
                                         "~/project-jerome/000-generalities-information-computers/010-bibliography"
                                         "~/project-jerome/000-generalities-information-computers/020-library-information-sciences"
                                         "~/project-jerome/000-generalities-information-computers/030-general-encyclopedic-works"
                                         "~/project-jerome/000-generalities-information-computers/040-special-topics"
                                         "~/project-jerome/000-generalities-information-computers/050-general-serials-indexes"
                                         "~/project-jerome/000-generalities-information-computers/060-general-organizations-museums"
                                         "~/project-jerome/000-generalities-information-computers/070-news-media-jounalism-publishing"
                                         "~/project-jerome/000-generalities-information-computers/080-general-collections"
                                         "~/project-jerome/000-generalities-information-computers/090-manuscripts-rare-books"
                                         "~/project-jerome/100-philosphy-psychology/110-metaphysics"
                                         "~/project-jerome/100-philosphy-psychology/120-epistemology-causation-humankind"
                                         "~/project-jerome/100-philosphy-psychology/130-paranormal-phenomena"
                                         "~/project-jerome/100-philosphy-psychology/140-specific-philosophical-schools"
                                         "~/project-jerome/100-philosphy-psychology/150-psychology"
                                         "~/project-jerome/100-philosphy-psychology/160-logic"
                                         "~/project-jerome/100-philosphy-psychology/170-ethics-moral-philosophy"
                                         "~/project-jerome/100-philosphy-psychology/180-ancient-medieval-oriental-philosophy"
                                         "~/project-jerome/100-philosphy-psychology/190-modern-western-philosophy"
                                         "~/project-jerome/200-religion/210-natural-theology"
                                         "~/project-jerome/200-religion/220-bible"
                                         "~/project-jerome/200-religion/230-christian theology"
                                         "~/project-jerome/200-religion/230-christian theology/239-apologetics"
                                         "~/project-jerome/200-religion/240-christian-moral-devotional-theology"
                                         "~/project-jerome/200-religion/240-christian-moral-devotional-theology/242-devotional-literature"
                                         "~/project-jerome/200-religion/250-christian-orders-local-churches"
                                         "~/project-jerome/200-religion/250-christian-orders-local-churches/252-texts-of-sermons"
                                         "~/project-jerome/200-religion/250-christian-orders-local-churches/253-pastoral-office-and-work"
                                         "~/project-jerome/200-religion/260-christian-social-theology"
                                         "~/project-jerome/200-religion/270-christian-church-history"
                                         "~/project-jerome/200-religion/280-christian-denominations-sects"
                                         "~/project-jerome/200-religion/290-other-comparative-religions"
                                         "~/project-jerome/300-social-sciences/310-general-statisticnbox.cs"
                                         "~/project-jerome/300-social-sciences/320-political-science"
                                         "~/project-jerome/300-social-sciences/330-economics"
                                         "~/project-jerome/300-social-sciences/340-law"
                                         "~/project-jerome/300-social-sciences/350-public-administration"
                                         "~/project-jerome/300-social-sciences/360-social-problems-services"
                                         "~/project-jerome/300-social-sciences/370-education"
                                         "~/project-jerome/300-social-sciences/380-commerce-communications-transport"
                                         "~/project-jerome/300-social-sciences/390-customs-etiquette-folklore"
                                         "~/project-jerome/400-philology/410-linguistics"
                                         "~/project-jerome/400-philology/420-english-anglosaxon-languages"
                                         "~/project-jerome/400-philology/430-germanic-languages"
                                         "~/project-jerome/400-philology/440-romance-languages"
                                         "~/project-jerome/400-philology/450-italian-romanian-rhaeto-romanic"
                                         "~/project-jerome/400-philology/460-spanish-portuguese-languages"
                                         "~/project-jerome/400-philology/470-italic-languages-latin"
                                         "~/project-jerome/400-philology/480-hellenic-languages-classical-greek"
                                         "~/project-jerome/400-philology/490-other-languages"
                                         "~/project-jerome/500-natural-science/510-mathematics"
                                         "~/project-jerome/500-natural-science/520-astronomy-allied-sciences"
                                         "~/project-jerome/500-natural-science/530-physics"
                                         "~/project-jerome/500-natural-science/540-chemistry-allied-sciences"
                                         "~/project-jerome/500-natural-science/550-earth-sciences"
                                         "~/project-jerome/500-natural-science/560-paleontology-paleozoology"
                                         "~/project-jerome/500-natural-science/570-life-sciences"
                                         "~/project-jerome/500-natural-science/580-botanical-sciences"
                                         "~/project-jerome/500-natural-science/590-zoological-sciences"
                                         "~/project-jerome/600-applied-science/610-medical-sciences-psychiatry"
                                         "~/project-jerome/600-applied-science/620-engineering"
                                         "~/project-jerome/600-applied-science/630-agriculture"
                                         "~/project-jerome/600-applied-science/640-home-economics-family-living"
                                         "~/project-jerome/600-applied-science/650-management"
                                         "~/project-jerome/600-applied-science/660-chemical-engineering"
                                         "~/project-jerome/600-applied-science/670-manufacturing"
                                         "~/project-jerome/600-applied-science/680-manufacture-for-specific-use"
                                         "~/project-jerome/600-applied-science/690-buildings"
                                         "~/project-jerome/700-arts-recreation/710-civic-landscape-art"
                                         "~/project-jerome/700-arts-recreation/720-architecture"
                                         "~/project-jerome/700-arts-recreation/730-sculpture"
                                         "~/project-jerome/700-arts-recreation/740-drawings-decorative-arts"
                                         "~/project-jerome/700-arts-recreation/750-paintings-painters"
                                         "~/project-jerome/700-arts-recreation/760-graphics-arts-printmaking"
                                         "~/project-jerome/700-arts-recreation/770-photography"
                                         "~/project-jerome/700-arts-recreation/780-music"
                                         "~/project-jerome/700-arts-recreation/790-recreational-performing-arts"
                                         "~/project-jerome/800-literature/810-american-literature-in-english"
                                         "~/project-jerome/800-literature/820-english-literature"
                                         "~/project-jerome/800-literature/830-literature-of-germanic-language"
                                         "~/project-jerome/800-literature/840-literatures-of-romance-language"
                                         "~/project-jerome/800-literature/850-italian-romanian-rhaeto-romaic-literatures"
                                         "~/project-jerome/800-literature/860-spanish-portuguese-literatures"
                                         "~/project-jerome/800-literature/870-italic-literatures-latin"
                                         "~/project-jerome/800-literature/880-hellenic-literatures-classical-greek"
                                         "~/project-jerome/800-literature/890-literatures-of-other-languages"
                                         "~/project-jerome/900-history-geography-biography/910-geography-travel"
                                         "~/project-jerome/900-history-geography-biography/920-biography-genealogy-insignia"
                                         "~/project-jerome/900-history-geography-biography/930-history-of-the-ancient-world"
                                         "~/project-jerome/900-history-geography-biography/940-general-history-of-europe"
                                         "~/project-jerome/900-history-geography-biography/950-general-history-of-asia"
                                         "~/project-jerome/900-history-geography-biography/960-general-history-of-africa"
                                         "~/project-jerome/900-history-geography-biography/970-general-history-of-north-america"
                                         "~/project-jerome/900-history-geography-biography/980-general-history-of-south-america"
                                         "~/project-jerome/900-history-geography-biography/990-general-history-of-other-areas"
                                         ))

  ;;-------------------------------------------------------------------------
  ;; ***  Org Brain Config
  ;;-------------------------------------------------------------------------
  ;; Org-brain initialization
  (setq org-brain-path "~/Dropbox/project-maria")
  (setq org-brain-data-file "~/.emacs.d/.org-brain-data.el")
  ;; Default spacemacs keybind for org-brain-visualize is =SPC a o B v
  ;; This binds it to a shorter key sequence to protect my poor pinky
  (spacemacs/set-leader-keys "o SPC" 'org-brain-visualize-dwim)
  ;; For evil users,
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  ;; org-brain use org-id in order to speed things up. Because of this, the variable org-id-track-globally should be t (which it already is by default). You may want to modify org-id-locations-file too. If you add entries to org-brain directly from org-mode you must assign headliens an ID. A comfortable way to do this is with the command org-brain-ensure-ids-in-buffer. Even more comfortable is to add that to before-save-hook, so that it runs when saving.
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  ;; Automatically add ID properties to all org headlines when saving
  ;; Disabled because of slowdown, use org-id-get-create instead
  ;; (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 90)
  (setq org-brain-include-file-entries nil)
  (setq org-brain-file-entries-use-title nil)
  (setq org-brain-headline-entry-name-format-string "%2$s")
  ;; closes org-brain buffer when pressing "o" or "O" to goto an entry
  (setq org-brain-quit-after-goto t)
  ;; When set to non-nil, it allows inserting a link for backlinking.
  ;; in docA --> docB and also have docA listed as a resource for
  ;; docB
  (setq org-brain-backlink "<--")
  ;; Org brain chronological entries
  ;; Setup org-expiry and define a org-agenda function to compare timestamps
  (require 'org-expiry)
  (setq org-expiry-inactive-timestamps t)
  (defun org-expiry-created-comp (a b)
    "Compare `org-expiry-created-property-name' properties of A and B."
    (let ((ta (ignore-errors
                (org-time-string-to-seconds
                 (org-entry-get (get-text-property 0 'org-marker a)
                                org-expiry-created-property-name))))
          (tb (ignore-errors
                (org-time-string-to-seconds
                 (org-entry-get (get-text-property 0 'org-marker b)
                                org-expiry-created-property-name)))))
      (cond ((if ta (and tb (< ta tb)) tb) -1)
            ((if tb (and ta (< tb ta)) ta) +1))))

  ;; Add CREATED property when adding a new org-brain headline entry
  (add-hook 'org-brain-new-entry-hook #'org-expiry-insert-created)

  ;; Finally add a function which lets us watch the entries chronologically
  (require 'org-brain)
  (defun org-brain-timeline ()
    "List all org-brain headlines in chronological order."
    (interactive)
    (let ((org-agenda-files (org-brain-files))
          (org-agenda-cmp-user-defined #'org-expiry-created-comp)
          (org-agenda-sorting-strategy '(user-defined-down)))
      (org-tags-view nil (format "+%s>\"\"" org-expiry-created-property-name))))
  (defun org-brain-cliplink-resource ()
    "Add a URL from the clipboard as an org-brain resource.
  Suggest the URL title as a description for resource."
    (interactive)
    (let ((url (org-cliplink-clipboard-content)))
      (org-brain-add-resource
       url
       (org-cliplink-retrieve-title-synchronously url)
       t)))

  (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)
  ;; Prettify the lines via aa2u package, or ascii art to unicode
  (defface aa2u-face '((t . nil))
    "Face for aa2u box drawing characters")
  (advice-add #'aa2u-1c :filter-return
              (lambda (str) (propertize str 'face 'aa2u-face)))
  (defun aa2u-org-brain-buffer ()
    (let ((inhibit-read-only t))
      (make-local-variable 'face-remapping-alist)
      (add-to-list 'face-remapping-alist
                   '(aa2u-face . org-brain-wires))
      (ignore-errors (aa2u (point-min) (point-max)))))
  (with-eval-after-load 'org-brain
    (add-hook 'org-brain-after-visualize-hook #'aa2u-org-brain-buffer))
  ;; Add icons to org brain!
  (require 'all-the-icons)
  (defun org-brain-insert-resource-icon (link)
    "Insert an icon, based on content of org-mode LINK."
    (insert (format "%s "
                    (cond ((string-prefix-p "brain:" link)
                           (all-the-icons-fileicon "brain"))
                          ((string-prefix-p "info:" link)
                           (all-the-icons-octicon "info"))
                          ((string-prefix-p "help:" link)
                           (all-the-icons-material "help"))
                          ((string-prefix-p "http" link)
                           (all-the-icons-icon-for-url link))
                          (t
                           (all-the-icons-icon-for-file link))))))

  (add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)
  ;; org-brain keybindings
  (define-key org-brain-visualize-mode-map (kbd "j") #'evil-scroll-page-down)
  (define-key org-brain-visualize-mode-map (kbd "k") #'evil-scroll-page-up)
  ;; Add link-hint to org-brain mode
  (define-key org-brain-visualize-mode-map (kbd "i") #'org-brain-select-map)
  (define-key org-brain-visualize-mode-map (kbd "I") #'org-brain-select-dwim)
  (define-key org-brain-visualize-mode-map (kbd "s") #'link-hint-open-link)
  ;;-------------------------------------------------------------------------
  ;; *** GTD with Org Agenda
  ;; -------------------------------------------------------------------------
  ;; **** 5) Tasks and States Fast todo selection allows changing from any
  ;; task todo state to any other state directly by selecting the
  ;; appropriate key from the fast todo selection key menu.
  (setq org-use-fast-todo-selection t)
  ;; Allows changing todo states with S-left and S-right skipping all of
  ;; the normal processing when entering or leaving a todo state.
  (setq org-treat-S-cursor-todo-selection-as-state-change t)
  ;; Require exit notes for modifying a scheduled for deadline date
  (setq org-log-reschedule 'note)
  (setq org-log-redeadline 'note)
  (setq org-todo-keyword-faces
        (quote (;; Project Defined
                ("PROJ" :foreground "gold" :weight bold)
                ;; Todo's Brainstormed
                ("TODO" :foreground "tomato" :weight bold)
                ;; Next Action(s) chosen
                ("NEXT" :foreground "RoyalBlue" :weight bold)
                ;; Delegated or out of your control
                ("WAIT" :foreground "magenta" :weight bold)
                ;; Reducing from potential to actual
                ("PROG" :foreground "cyan2" :weight bold)
                ;; Completed task
                ("DONE" :foreground "SpringGreen3" :weight bold)
                ;; Formal appointment, in-person/scheduled in advance
                ;; Of type WAIT, but with a definte deadline
                ("APPT" :foreground "DarkViolet" :weight bold)
                ;; Informal (interruption) meeting/verbal/email
                ;; Informal (interruption) calls/texts
                ("MEET" :foreground "MediumOrchid" :weight bold)
                ;; Decided not to decide, need more information
                ("HOLD" :foreground "orchid" :weight bold)
                ;; Cancelled task, unable to complete
                ("CXLD" :foreground "SaddleBrown" :weight bold))))
  ;; Enforce todo dependencies: Parent tasks cannot be marked as done when
  ;; children are not
  (setq org-enforce-todo-dependencies t)
  ;; Entries that cannot be marked as done are dimmed in the agenda view
  (setq org-agenda-dim-blocked-tasks t)
  ;; Show habits in agenda view
  (setq org-habit-graph-column 80)
  ;; Org hide scheduled items if the deadline date causes it to be shown
  ;; Avoids same entry being shown twice in the day view
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  ;; **** 6) Adding New Tasks Quickly with Org Capture
  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
  ;; \n is newline in the template. Functions as RET would in insert mode
  ;; placing a backslash before " in TRIGGER below to have the string not end
  (setq org-capture-templates
        (quote (("n" "Next Action" entry (file "~/Dropbox/project-maria/task-management/0inbox.org") "* NEXT [#C] %?%^G\n:PROPERTIES:\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n:END:\n")
                ("t" "Todo Task" entry (file "~/Dropbox/project-maria/task-management/0inbox.org") "* TODO [#C] %?%^G\n :PROPERTIES:\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n:END:\n")
                ("p" "New Project" entry (file "~/Dropbox/project-maria/task-management/0projects.org") "* PROJ %? [#C] [/] [%] %^G\n:PROPERTIES:\n:ASSIGNED: %U\n:CATEGORY: %^{CATEGORY|Misc.}\n:END:\n** NEXT [#C]\n:PROPERTIES:\n:TRIGGER: chain-find-next(NEXT,from-current,priority-up,effort-up)\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n:END:\n")
                ("a" "Set Appointment" entry (file  "~/Dropbox/project-maria/task-management/0calendar.org" ) "* %?\n :PROPERTIES:\n:LOCATION: %^{LOCATION|TBD}\n:calendar-id: contacthanshenwang@gmail.com\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n:END:\n:org-gcal:\n%^T\n:END:")
                ;; Meeting (ongoing/interruption) should be filed under a specific project
                ;; If it is really an orphan, refile 0solo.org
                ("m" "Meeting (Ongoing)" entry (file "~/Dropbox/project-maria/task-management/0inbox.org") "* MEETING with %?%^G\n:PROPERTIES:\n:ASSIGNED: %U\n:END:\n" :clock-in t :clock-resume t)
                ("h" "Hold Entry" entry (file "~/Dropbox/project-maria/task-management/0someday.org") "* HOLD %?%^G\n SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n:PROPERTIES:\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n:END:\n")
                ("C" "Add Contacts" entry (file "~/Dropbox/project-maria/task-management/0inbox.org") "* %(org-contacts-template-name)\n:PROPERTIES:\n:PHONE: %?\n:EMAIL:\n:ADDRESS:\n:BIRTHDAY:\n:NOTE: Added on: %U\n:END:")
                ("H" "Habit" entry (file "~/Dropbox/project-maria/task-management/0inbox.org")"* NEXT %?\nSCHEDULED: %(format-time-string \"%\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:ASSIGNED: %U\n:END:")
                ("j" "Journal Entry" entry (file "~/Dropbox/project-maria/task-management/0inbox.org")"* NEXT JOURNAL ENTRY %U\n:PROPERTIES:\n:EFFORT: %^{0:00|0:10|0:30|1:00|1:30|2:00|2:30|3:00|4:00|5:00|6:00|7:00|8:00}\n:ASSIGNED: %U\n :END:\n%?"))))
  ;; https://orgmode.org/worg/org-contrib/org-depend.html
  (defun mm/org-insert-trigger ()
    "Automatically insert chain-find-next trigger when entry becomes NEXT"
    (cond ((equal org-state "NEXT")
           (unless org-depend-doing-chain-find-next
             (org-set-property "TRIGGER" "chain-find-next(NEXT,from-current,priority-up,effort-up)")))
          ((not (member org-state org-done-keywords))
           (org-delete-property "TRIGGER"))))
  (add-hook 'org-after-todo-state-change-hook 'mm/org-insert-trigger)
  ;; **** 9) Clocking
  ;; Change tasks to whatever when clocking in
  (setq org-clock-in-switch-to-state "PROG")
  ;; Remove empty LOGBOOK drawers on clock out
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; We want to try to clock back in to the previous task if we have to restart
  ;; Emacs.
  (org-clock-persistence-insinuate)
  ;; Save the running clock and all clock history when exiting Emacs, load it on
  ;; startup
  (setq org-clock-persist t)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Do not prompt to resume an active clock, just resume it
  (setq org-clock-persist-query-resume nil)
  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include the current task in the clock report
  (setq org-clock-report-include-clocking-task t)
  ;; Don't ever round our timestamps.
  (setq org-time-stamp-rounding-minutes '(1 1))
  ;; This block configures the Agenda clock report. See its infodoc for more
  ;; information.
  (setq org-agenda-clockreport-parameter-plist
        ;; commented version includes a column counting number of pomodoros
        ;; '(:link t :maxlevel 10 :fileskip0 t :stepskip0 t :compact t :narrow 80
        ;; :formula "$5=($3+$4)*(60/25);t"))
        '(:link t :maxlevel 10 :fileskip0 t :stepskip0 t :compact t :narrow 80 ))
  ;; Store all task state changes and clocking into the LOGBOOK
  (setq org-log-into-drawer t)
  ;; Make sure that you don't clock for too long. There's no reason
  ;; to clock for four straight hours, and if I do that, I'm probably lying.
  ;; Sort of an audit for your clocking reports. Unused for now.
  ;; (setq org-agenda-clock-consistency-checks
  ;;       '(:max-duration "4:00"
  ;;                       :min-duration 0
  ;;                       :max-gap 0
  ;;                       :gap-ok-around ("4:00")))
  (add-hook 'org-clock-in-prepare-hook
            'my-org-mode-ask-effort)
  (defun my-org-mode-ask-effort ()
    "Ask for an effort estimate when clocking in if none exists."
    (unless (org-entry-get (point) "Effort")
      (let ((effort
             (completing-read
              "Effort: "
              (org-entry-get-multivalued-property (point) "Effort"))))
        (unless (equal effort "")
          (org-set-property "Effort" effort)))))
  ;; Show lot of clocking history so it's easy to pick items
  (setq org-clock-history-length 35)
  (defun eos/org-clock-in ()
    (interactive)
    (org-clock-in '(4)))
  ;; Set better keybindings for clocking
  (spacemacs/set-leader-keys "oa" 'hanshen/default-custom-agenda)
  (spacemacs/set-leader-keys "oj" 'spacemacs/org-clock-jump-to-current-clock)
  (spacemacs/set-leader-keys "oi" 'eos/org-clock-in)
  (spacemacs/set-leader-keys "oI" 'org-clock-in)
  (spacemacs/set-leader-keys "oo" 'org-clock-out)
  (spacemacs/set-leader-keys "or" 'org-resolve-clocks)
  (spacemacs/set-leader-keys "oc" 'org-capture)
  ;; **** 7) Refiling Tasks Targets include this file and any file contributing to
  ;; the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))
  (setq org-outline-path-complete-in-steps nil) ; Refile in a single go
  ;; Show full paths for refiling and allow refiling to toplevel headline
  (setq org-refile-use-outline-path 'file)
  ;; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))
  (setq org-refile-target-verify-function 'bh/verify-refile-target)
  ;; Context Tags
  ;; Sets geo-spatial and context tags
  ;; **** 11) Tags with fast selection keys
  (setq org-tag-alist (quote (
                              ("exp" . ?x)
                              ;; Startgroup and endgroup make tags mutually
                              ;; exclusive (:startgroup)
                              ("0errand" . ?e)
                              ("0office" . ?o)
                              ("0calls" . ?c)
                              ("0home" . ?h)
                              ;; People are contexts too The tricky part here is
                              ;; who qualifies as deserving of a tag? Not to be
                              ;; elitist, but having too many contact tags is
                              ;; useless If a person is worth adding to my CRM,
                              ;; then it is worth adding to a tag. After all, God
                              ;; created each person with a pretty much unique
                              ;; name.
                              ("0docket" . ?d)
                              ;; (:endgroup)
                              ("REF" . ?r)
                              ("FLAGGED" . ??))))
  ;; Allow setting single tags without the menu
  (setq org-fast-tag-selection-single-key (quote expert))
  ;; For tag searches ignore tasks with scheduled and deadline dates
  (setq org-agenda-tags-todo-honor-ignore-options t)
  ;; **** 14) Stuck Projects
  (setq org-stuck-projects   '("+TODO=\"PROJ\"" ("NEXT") nil nil))
  ;; **** 15) Archiving
  (setq org-archive-default-command 'org-archive-subtree)
  (setq org-archive-location "~/Dropbox/project-maria/task-management/
  archived-tasks/0taskings-2021.org::datetree/")
  (setq org-archive-save-context-info '(time file category olpath todo priority
                                             ltags itags))
  ;; **** 8) Org Agenda Custom Views
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (define-key org-agenda-mode-map "s" 'avy-goto-word-or-subword-1)))
  ;; Colorize clocked tasks with a block
  ;; Show Org Agenda tasks with height spacing based on clock time with
  ;; org-agenda-log-mode.
  (require 'cl-lib)
  (defun my/org-agenda-calculate-efforts (limit)
    "Sum the efforts of scheduled entries up to LIMIT in the
  agenda buffer."
    (let (total)
      (save-excursion
        (while (< (point) limit)
          (when (member (org-get-at-bol 'type) '("scheduled" "past-scheduled" "timestamp"))
            (push (org-entry-get (org-get-at-bol 'org-hd-marker) "EFFORT") total))
          (forward-line)))
      (org-duration-from-minutes
       (cl-reduce #'+
                  (mapcar #'org-duration-to-minutes
                          (cl-remove-if-not 'identity total))))))
  (defun my/org-agenda-insert-efforts ()
    "Insert the efforts for each day inside the agenda buffer."
    (save-excursion
      (let (pos)
        (while (setq pos (text-property-any
                          (point) (point-max) 'org-agenda-date-header t))
          (goto-char pos)
          (end-of-line)
          (insert-and-inherit (concat " ("
                                      (my/org-agenda-calculate-efforts
                                       (next-single-property-change (point) 'day))
                                      ")"))
          (forward-line)))))

  (add-hook 'org-agenda-finalize-hook 'my/org-agenda-insert-efforts)
  ;; (defun org-agenda-log-mode-colorize-block ()
  ;;   "Set different line spacing and coloring based on clock time duration."
  ;;   (save-excursion
  ;;     (let* ((colors (cl-case (alist-get 'background-mode (frame-parameters))
  ;;                      ('light
  ;;                       (list "#FFE6E6" "#FFFFCC" "#CCFFCC" "#CCFFFF"))
  ;;                      ('dark
  ;;                       (list "#aa557f" "DarkGreen" "DarkSlateGray" "DarkSlateBlue"))))
  ;;            pos
  ;;            duration)
  ;;       (nconc colors colors)
  ;;       (goto-char (point-min))
  ;;       (while (setq pos (next-single-property-change (point) 'duration))
  ;;         (goto-char pos)
  ;;         (when (and (not (equal pos (point-at-eol)))
  ;;                    (setq duration (org-get-at-bol 'duration)))
  ;;           ;; larger duration bar height
  ;;           (let ((line-height (if (< duration 15) 1.0 (+ 0.5 (/ duration 60))))
  ;;                 (ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
  ;;             (overlay-put ov 'face `(:background ,(car colors)))
  ;;             (setq colors (cdr colors))
  ;;             (overlay-put ov 'line-height line-height)
  ;;             (overlay-put ov 'line-spacing (1- line-height))))))))
  ;; (add-hook 'org-agenda-finalize-hook #'org-agenda-log-mode-colorize-block)
  ;; Source:  https://emacs.stackexchange.com/questions/51708/is-there-a-way-to-start-org-mode-agenda-with-a-custom-search
  (defun hanshen/default-custom-agenda()
    "Functionally call custom agenda command bound to KEY"
    (interactive)
    (org-agenda nil "d"))
  ;; Shortens the agenda seperator line
  (setq org-agenda-block-separator 61)
  (setq org-agenda-breadcrumbs-separator " | ")
  ;; Add %b if you want breadcrumbs in agenda items. I.e. goal1 | subgoal 2 |...
  ;; (agenda . "%?-3b%-t %? e%s")
  ;; Deadlines in agenda view source: https://stackoverflow.com/questions/58820073/s-in-org-agenda-prefix-format-doesnt-display-dates-in-the-todo-view
  (setq org-agenda-prefix-format
        (quote
         ((agenda . "%-t %? e%c%s")
          (todo . "%? e%c%s%(let ((scheduled (org-get-deadline-time (point)))) (if scheduled (format-time-string \" [%Y-%m-%d] \" scheduled) \"\"))")
          (tags . "%? e%c%s%(let ((scheduled (org-get-deadline-time (point)))) (if scheduled (format-time-string \" [%Y-%m-%d] \" scheduled) \"\"))")
          (search . "%? e%c%s"))
         ))
  (setq org-agenda-deadline-leaders (quote ("!D!: " "D%3d: " "")))
  (setq org-agenda-scheduled-leaders (quote ("!S!: " "S%3d: " "")))
  ;; Customize time-grid of Agenda
  (setq org-agenda-time-grid (quote ((daily today remove-match)
                                     (0600 0900 1200 1500 1800 2100)
                                     "......" "----------------")))
  ;; Modify columns in org-agenda-clock-report-mode
  ;; Add effort property to all agenda entries
  ;; When columnizing org tasks, we can format how they look like this.
  (setq org-columns-default-format-for-agenda "%75ITEM(Task) %10Effort(Estim){:} %10CLOCKSUM(ActTime) %5TODO(State)")
  (setq org-columns-default-format "%75ITEM(Task) %10Effort(Estim){:} %10CLOCKSUM(ActTime) %5TODO(State)")
  ;; Set global properties that apply to all org entries' autocompletes
  (setq org-global-properties '(quote (("Effort_ALL" . "0:00 0:10 0:30 1:00 1:30 2:00 2:30 3:00 4:00 5:00 6:00 7:00 8:00")
                                       ("STYLE_ALL" . "habit"))))
  ;; In the estimated work effort for a day, add appointments that have a
  ;; specified time interval.
  (setq org-agenda-columns-add-appointments-to-effort-sum t)
  ;; Setting the default duration of timestamps which have no ending timestamp
  (setq org-agenda-default-appointment-duration 0)
  ;; In Org Agenda Log Mode, show all the information about them that we can.
  (setq org-agenda-log-mode-items '(closed state clock))
  (setq org-agenda-start-with-log-mode t)
  ;; Entry text mode displays the body text of an org heading
  (setq org-agenda-start-with-entry-text-mode t)
  ;; Export body text in agenda view
  (setq org-agenda-add-entry-text-maxlines 5)
  ;; Maximum lines shown are set with this variable
  (setq org-agenda-entry-text-maxlines 5)
  ;; In Org Agenda Clock Report Mode, start new agenda buffer with this on
  ;; This is no longer needed, obsoleted by function above =org-agenda-log-mode-colorize-block=
  (setq org-agenda-start-with-clockreport-mode nil)
  ;; Function found here https://emacs.stackexchange.com/questions/21380/show-sum-of-efforts-for-a-day-in-org-agenda-day-title

  ;; Set default column properties for org agenda
  ;; Context Padding Function
  ;; If my elisp improves, I'll modify the function to
  ;; include not just the first element (car) of the list
  ;; but the entire list.
  ;; (defun sl-get-padded-todo-parent (size)
  ;;   "Return string of length SIZE containing either padded or truncated parent name."
  ;;   (let* ((parent (car (org-get-outline-path)))
  ;;          (padding (- size (length parent))))
  ;;     (if (< padding 0) (substring parent 0 size)
  ;;       (concat parent (make-string padding ?\ )))))
  ;; ;; Insert this to override the default.
  ;; (org-agenda-prefix-format "%(sl-get-padded-todo-parent 12): ")
  (setq org-agenda-custom-commands
        '(
          ;; ***** Default Agenda
          ("d" "Default (Master) Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            (agenda "" ((org-agenda-span 1)                      ; daily agenda
                        ;; 7 day warning for deadlines, adjust period based on clutter
                        (org-deadline-warning-days 7)
                        ;; (org-agenda-todo-keyword-format "[ ]")
                        (org-agenda-overriding-header "Today's Agenda\n")
                        ;; (org-agenda-scheduled-leaders '("" ""))
                        ))
            ;; Presents in progress tasks for easy access to clock in
            (tags "TODO=\"PROG\""
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nAll Tasks in Progress\n")
                   ))
            ;; Presents NEXT 0home tasks
            (tags "TODO=\"NEXT\""
                  (
                   ;; Sorting for [A] Priority items, then by upcoming deadlines
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nAll Action Items\n")
                   ;; Skip listing a next/todo item that has already been scheduled
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                   ))
            ;; Presents 0home WAIT's sorted by oldest first
            ;; This is as it really should have a scheduled or
            ;; deadline date, but sometimes you really don't know
            ;; If given a scheduled or deadline date it will show up in
            ;; the day's agenda. Make sure to include an active timestamp
            ;; when switching states
            ;; Make sure to write down what you are waiting for
            (tags "+TODO=\"WAIT\""
                  (
                   (org-agenda-sorting-strategy '(timestamp-down))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nAll Delegated/Waiting For\n")
                   ))
            ;; Presents 0home PROJ's grouped by categories
            (tags "TODO=\"TODO\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nAll Tasks\n")
                   ))
            ;; Presents 0home PROJ's grouped by categories
            (tags "TODO=\"PROJ\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nAll Projects\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects\n")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))
            )
           ((org-agenda-tag-filter-preset '("-SDAY"))))
          ;; ***** Home Agenda
          ("h" "Home Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            (agenda "" ((org-agenda-span 1)                      ; daily agenda
                        ;; 7 day warning for deadlines, adjust period based on clutter
                        (org-deadline-warning-days 7)
                        ;; (org-agenda-todo-keyword-format "[ ]")
                        (org-agenda-overriding-header "Today's Agenda\n")
                        ;; (org-agenda-scheduled-leaders '("" ""))
                        ))
            ;; Presents in progress tasks for easy access to clock in
            (tags "0home+TODO=\"PROG\""
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0home Tasks in Progress\n")
                   ))
            ;; Presents NEXT 0home tasks
            (tags "0home+TODO=\"NEXT\""
                  (
                   ;; Sorting for [A] Priority items, then by upcoming deadlines
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0home Action Items\n")
                   ;; Skip listing a next/todo item that has already been scheduled
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                   ))
            ;; Presents 0home WAIT's sorted by oldest first
            ;; This is as it really should have a scheduled or
            ;; deadline date, but sometimes you really don't know
            ;; If given a scheduled or deadline date it will show up in
            ;; the day's agenda. Make sure to include an active timestamp
            ;; when switching states
            ;; Make sure to write down what you are waiting for
            (tags "0home+TODO=\"WAIT\""
                  (
                   (org-agenda-sorting-strategy '(timestamp-down))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0home Delegated/Waiting For\n")
                   ))
            ;; Presents 0home PROJ's grouped by categories
            (tags "0home+TODO=\"TODO\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0home Tasks\n")
                   ))
            ;; Presents 0home PROJ's grouped by categories
            (tags "0home+TODO=\"PROJ\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0home Projects\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "0home+TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects\n")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))

            )
           ((org-agenda-tag-filter-preset '("-SDAY")))
           )
          ;; ***** Office Agenda
          ("o" "Office Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            (agenda "" ((org-agenda-span 1)                      ; daily agenda
                        ;; 7 day warning for deadlines, adjust period based on clutter
                        (org-deadline-warning-days 7)
                        ;; (org-agenda-todo-keyword-format "[ ]")
                        (org-agenda-overriding-header "Today's Agenda\n")
                        ;; (org-agenda-scheduled-leaders '("" ""))
                        ))
            ;; Presents in progress tasks for easy access to clock in
            (tags "0office+TODO=\"PROG\""
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0office Tasks in Progress\n")
                   ))
            ;; Presents NEXT 0office tasks
            (tags "0office+TODO=\"NEXT\""
                  (
                   ;; Sorting for [A] Priority items, then by upcoming deadlines
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0office Action Items\n")
                   ;; Skip listing a next/todo item that has already been scheduled
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                   ))
            ;; Presents 0office WAIT's sorted by oldest first
            ;; This is as it really should have a scheduled or
            ;; deadline date, but sometimes you really don't know
            ;; If given a scheduled or deadline date it will show up in
            ;; the day's agenda. Make sure to include an active timestamp
            ;; when switching states
            ;; Make sure to write down what you are waiting for
            (tags "0office+TODO=\"WAIT\""
                  (
                   (org-agenda-sorting-strategy '(timestamp-down))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0office Delegated/Waiting For\n")
                   ))
            ;; Presents 0office PROJ's grouped by categories
            (tags "0office+TODO=\"TODO\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0office Tasks\n")
                   ))
            ;; Presents 0office PROJ's grouped by categories
            (tags "0office+TODO=\"PROJ\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0office Projects\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "0office+TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects\n")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))
            )
           ((org-agenda-tag-filter-preset '("-SDAY")))
           )
          ;; ***** Errand Agenda
          ("e" "Errand Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            (agenda "" ((org-agenda-span 1)                      ; daily agenda
                        ;; 7 day warning for deadlines, adjust period based on clutter
                        (org-deadline-warning-days 7)
                        ;; (org-agenda-todo-keyword-format "[ ]")
                        (org-agenda-overriding-header "Today's Agenda\n")
                        ;; (org-agenda-scheduled-leaders '("" ""))
                        ))
            ;; Presents in progress tasks for easy access to clock in
            (tags "0errand+TODO=\"PROG\""
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0errand Tasks in Progress\n")
                   ))
            ;; Presents NEXT 0errand tasks
            (tags "0errand+TODO=\"NEXT\""
                  (
                   ;; Sorting for [A] Priority items, then by upcoming deadlines
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0errand Action Items\n")
                   ;; Skip listing a next/todo item that has already been scheduled
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                   ))
            ;; Presents 0errand WAIT's sorted by oldest first
            ;; This is as it really should have a scheduled or
            ;; deadline date, but sometimes you really don't know
            ;; If given a scheduled or deadline date it will show up in
            ;; the day's agenda. Make sure to include an active timestamp
            ;; when switching states
            ;; Make sure to write down what you are waiting for
            (tags "0errand+TODO=\"WAIT\""
                  (
                   (org-agenda-sorting-strategy '(timestamp-down))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0errand Delegated/Waiting For\n")
                   ))
            ;; Presents 0errand PROJ's grouped by categories
            (tags "0errand+TODO=\"TODO\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0errand Tasks\n")
                   ))
            ;; Presents 0errand PROJ's grouped by categories
            (tags "0errand+TODO=\"PROJ\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0errand Projects\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "0errand+TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))
            )
           ((org-agenda-tag-filter-preset '("-SDAY")))
           )
          ;; ***** Home Agenda
          ("c" "Mobile Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            (agenda "" ((org-agenda-span 1)                      ; daily agenda
                        ;; 7 day warning for deadlines, adjust period based on clutter
                        (org-deadline-warning-days 7)
                        ;; (org-agenda-todo-keyword-format "[ ]")
                        (org-agenda-overriding-header "Today's Agenda\n")
                        ;; (org-agenda-scheduled-leaders '("" ""))
                        ))
            ;; Presents in progress tasks for easy access to clock in
            (tags "0calls+TODO=\"PROG\""
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0calls Tasks in Progress\n")
                   ))
            ;; Presents NEXT 0calls tasks
            (tags "0calls+TODO=\"NEXT\""
                  (
                   ;; Sorting for [A] Priority items, then by upcoming deadlines
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0calls Action Items\n")
                   ;; Skip listing a next/todo item that has already been scheduled
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                   ))
            ;; Presents 0calls WAIT's sorted by oldest first
            ;; This is as it really should have a scheduled or
            ;; deadline date, but sometimes you really don't know
            ;; If given a scheduled or deadline date it will show up in
            ;; the day's agenda. Make sure to include an active timestamp
            ;; when switching states
            ;; Make sure to write down what you are waiting for
            (tags "0calls+TODO=\"WAIT\""
                  (
                   (org-agenda-sorting-strategy '(timestamp-down))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0calls Delegated/Waiting For\n")
                   ))
            ;; Presents 0calls PROJ's grouped by categories
            (tags "0calls+TODO=\"TODO\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0calls Tasks\n")
                   ))
            ;; Presents 0calls PROJ's grouped by categories
            (tags "0calls+TODO=\"PROJ\""
                  (
                   (org-agenda-sorting-strategy '(category-keep))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\n0calls Projects\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "0calls+TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects\n")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))
            )
           ((org-agenda-tag-filter-preset '("-SDAY")))
           )
          ;; ***** Review Agenda
          ("r" "Review Agenda"
           ;; Presents the same view as Google Calendar i.e. only APPT and Routine Events
           ;; Inclusive of all tags. I can't bi-locate after all.
           (;; Presents Scheduled and Deadline Items, includes Overdue Items
            ;; Exclusive to 0home tasks
            ;; Presents in progress tasks for easy access to clock in
            (tags "TODO=\"DONE\"-LIB"
                  (
                   (org-agenda-sorting-strategy '(priority-down deadline-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nCompleted Tasks\n")
                   ))
            ;; Presents Cancelled and Stuck Projects
            (tags "TODO=\"CXLD\""
                  (
                   (org-agenda-sorting-strategy '(tsia-up))
                   (org-agenda-todo-keyword-format "%-3s")
                   (org-agenda-overriding-header "\nTerminated Tasks\n")
                   ))
            (stuck ""
                   (
                    (org-agenda-overriding-header "\nStuck Projects\n")
                    ))
            (agenda "" (
                        ;; Increase or decrease if cluttered or empty
                        (org-agenda-span '33)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")         ;; calendar begins tomorrow
                        (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                        (org-agenda-overriding-header "Routine & Appointments\n")
                        ))
            )
           ((org-agenda-tag-filter-preset '("-SDAY -LIB")))
           )
          ))
  ;;-------------------------------------------------------------------------
  ;; ***  Mu4e Config
  ;;-------------------------------------------------------------------------
  (require 'org-mime)
  ;; Avoid issues with how mbsync manages maildir flags
  (setq mu4e-change-filenames-when-moving t)
  ;; Set mu4e mail directory
  (setq mu4e-maildir (expand-file-name "~/Maildir"))
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  (setq mu4e-sent-folder "/[Gmail]/Sent Mail")
  (setq mu4e-trash-folder "/[Gmail]/Trash")
  (setq mu4e-refile-folder "/[Gmail]/All Mail")
  (setq mu4e-attachment-dir "/mnt/c/Users/Hanshen/Downloads/")
  ;; Sync with mbsync every 5 minutes
  (setq mu4e-index-update-in-background t)
  (setq mu4e-update-interval 300)
  (setq mu4e-autorun-background-at-startup t)
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-hide-index-messages t)
  (setq mu4e-enable-mode-line t)
  (setq mu4e-enable-async-operations t)
  (setq mu4e-headers-show-threads nil)
  (setq mu4e-headers-skip-duplicates t)
  ;; By default in a multipart html/plaintext email, if the html portion is larger
  ;; by a factor of 5, it is assumed the user wants to view html. This sets the factor
  ;; to the largest possible fixnum
  (setq mu4e-view-html-plaintext-ratio-heuristic most-positive-fixnum)
  (setq gnus-blocked-images ".")
  ;;store link to message if in header view, not to header query
  (setq org-mu4e-link-query-in-headers-mode nil)
  ;; see an ASCII table for the character decimal codes
  (setq mu4e-bookmarks '(("maildir:/INBOX" "Inbox" 98 )
                         ("from:Lynda and date:2w.." "RCIA" 114)))
  ;; Html rendering
  ;; (setq mu4e-html2text-command)
  ;; attempt to show images when viewing messages
  (setq mu4e-view-show-images t)
  ;; attempt to show complete senders when viewing messages
  (setq mu4e-view-show-addresses t)
  ;; something about ourselves
  (setq
   user-mail-address "contact.hanshen.wang@gmail.com" ; see format-posts-rss-feed-entry
   user-full-name "Hanshen Wang")
  ;; (setq mu4e-compose-signature (concat "Thank you,\n"
  ;;                                "Hanshen Wang\n"))
  ;; integration with org-contacts
  (setq mu4e-org-contacts-file  "~/Dropbox/project-maria/task-management/0contacts.org")
  (add-to-list 'mu4e-headers-actions
               '("org-contact-add" . mu4e-action-add-org-contact) t)
  (add-to-list 'mu4e-view-actions
               '("org-contact-add" . mu4e-action-add-org-contact) t)
  ;; pressing a-V while in mu4e view will open up the html mail in eww.
  ;; firefox or chrome is also possible.
  ;; sending mail -- replace USERNAME with your gmail username also, make sure the
  ;; gnutls command line utils are installed package 'gnutls-bin' in Debian/Ubuntu
  (require 'smtpmail)
  (setq message-send-mail-function 'smtpmail-send-it
        starttls-use-gnutls t
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-smtp-user "contact.hanshen.wang@gmail.com")
  ;; don't keep message buffers around
  (setq message-kill-buffer-on-exit t)
  (require 'all-the-icons)
  ;; source
  ;; https://github.com/stardiviner/mu4e-marker-icons
  (setq
   mu4e-headers-seen-mark `("S" . ,(propertize
                                    (all-the-icons-octicon "mail-read")
                                    'face `(:family ,(all-the-icons-octicon-family)
                                                    :foreground "Grey",(face-background 'default))))
   mu4e-headers-new-mark `("N" . ,(propertize
                                   (all-the-icons-material "notifications")
                                   'face `(:family ,(all-the-icons-material-family)
                                                   :foreground "Orange",(face-background 'default))))
   mu4e-headers-unread-mark `("u" . ,(propertize
                                      (all-the-icons-octicon "mail")
                                      'face `(:family ,(all-the-icons-octicon-family)
                                                      :foreground "CornflowerBlue",(face-background 'default))))
   mu4e-headers-signed-mark `("s" . ,(propertize
                                      (all-the-icons-material "check")
                                      'face `(:family ,(all-the-icons-material-family)
                                                      :foreground "DarkCyan")))
   mu4e-headers-encrypted-mark `("x" . ,(propertize
                                         (all-the-icons-material "enhanced_encryption")
                                         'face `(:family ,(all-the-icons-material-family)
                                                         :foreground "CornflowerBlue")))
   mu4e-headers-draft-mark `("D" . ,(propertize
                                     (all-the-icons-material "drafts")
                                     'face 'mu4e-draft-face))
   mu4e-headers-attach-mark `("a" . ,(propertize
                                      (all-the-icons-material "attachment")
                                      'face 'mu4e-attach-number-face))
   mu4e-headers-passed-mark `("P" . ,(propertize ; ❯ (I'm participated in thread)
                                      (all-the-icons-material "speaker_notes")
                                      'face `(:family ,(all-the-icons-material-family)
                                                      :foreground "Purple")))
   mu4e-headers-flagged-mark `("F" . ,(propertize
                                       (all-the-icons-material "flag")
                                       'face 'mu4e-flagged-face))
   mu4e-headers-replied-mark `("R" . ,(propertize
                                       (all-the-icons-material "reply_all")
                                       'face 'mu4e-replied-face))
   mu4e-headers-trashed-mark `("T" . ,(propertize
                                       (all-the-icons-octicon "trashcan")
                                       'face `(:family ,(all-the-icons-octicon-family)
                                                       :foreground "Grey",(face-background 'default)))))
  ;; From the Mu4e manual: https://www.djcbsoftware.nl/code/mu/mu4e/Compose-hooks.html
  ;; 1) messages to me@foo.example.com should be replied with From:me@foo.example.com
  ;; 2) messages to me@bar.example.com should be replied with From:me@bar.example.com
  ;; 3) all other mail should use From:me@cuux.example.com
  (add-hook 'mu4e-compose-pre-hook
            (defun my-set-from-address ()
              "Set the From address based on the To address of the original."
              (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
                (when msg
                  (setq user-mail-address
                        (cond
                         ((mu4e-message-contact-field-matches msg :to "hanshenwang@outlook.com")
                          "hanshenwang@outlook.com")
                         ((mu4e-message-contact-field-matches msg :to "hanshenwang@uwo.ca")
                          "hanshenwang@uwo.ca")
                         (t "contact.hanshen.wang@gmail.com")))))))
  ;; Unbind s, originally bound to mu4e-headers-search.
  ;; Unset =mu4e-headers=search= from both =mu4e-headers-mode-map= and
  ;; =mu4e-view-mode-map=. Retain =s= for search in =mu4e-main-mode-map=.
  (define-key mu4e-headers-mode-map (kbd "s") #'avy-goto-word-or-subword-1)
  (define-key mu4e-headers-mode-map (kbd "K") #'mu4e-view-save-url)
  (define-key mu4e-view-mode-map (kbd "s") #'avy-goto-word-or-subword-1)
  (define-key mu4e-view-mode-map (kbd "K") #'mu4e-view-save-url)
  (add-hook 'mu4e-view-mode-hook (lambda () (evil-evilified-state)))
  (add-hook 'message-send-hook 'org-mime-htmlize)
  (spacemacs/set-leader-keys-for-major-mode 'mu4e-compose-mode "o" 'org-mime-edit-mail-in-org-mode)
  (spacemacs/set-leader-keys-for-major-mode 'mu4e-compose-mode "f" 'mail-add-attachment)
  ;;-------------------------------------------------------------------------
  ;; ***  Elfeed Config
  ;;-------------------------------------------------------------------------
  ;; Set shortcut for org-web-tools to fetch full article
  (require 'elfeed)
  (define-key elfeed-search-mode-map (kbd "s") #'avy-goto-word-or-subword-1)
  (define-key elfeed-search-mode-map (kbd "S") #'elfeed-search-live-filter)
  (define-key elfeed-show-mode-map (kbd "s") #'avy-goto-word-or-subword-1)
  (define-key elfeed-show-mode-map (kbd "S") #'elfeed-search-live-filter)
  (define-key elfeed-search-mode-map (kbd "f") #'hanshen/hydra-elfeed/body)
  (define-key elfeed-search-mode-map (kbd "r") #'elfeed-mark-all-as-read)
  (define-key elfeed-search-mode-map (kbd "RET") #'ap/elfeed-search-browse-org)
  (define-key elfeed-search-mode-map (kbd "t") #'elfeed-search-show-entry)
  (require 'hydra)
  (defhydra hanshen/hydra-elfeed (:exit t)
    ("g" (elfeed-search-set-filter "@6-months-ago +unread +gbl") "Global News")
    ("l" (elfeed-search-set-filter "@6-months-ago +unread +lcl") "Local News")
    ("p" (elfeed-search-set-filter "@6-months-ago +unread +pol") "Political")
    ("s" (elfeed-search-set-filter "@6-months-ago +unread +sci") "Science & Tech")
    ("b" (elfeed-search-set-filter "@6-months-ago +unread +blog") "Misc. Blogs")
    ("c" (elfeed-search-set-filter "@6-months-ago +unread +rel") "Catholic")
    ("f" (elfeed-search-set-filter "@6-months-ago +unread +frm") "Forums")
    ("o" (elfeed-search-set-filter "@6-months-ago +unread +pod") "Podcasts")
    ("y" (elfeed-search-set-filter "@6-months-ago +unread +vid") "Youtube")
    ("a" (elfeed-search-set-filter "@6-months-ago +unread") "All")
    ("q" nil "quit" :color blue))
  (defun elfeed-mark-all-as-read ()
    "Marks entire buffer before tagging marked region as read"
    (interactive)
    (mark-whole-buffer)
    (elfeed-search-untag-all-unread))
  ;; Source https://www.reddit.com/r/emacs/comments/g6oowz/elfeed_rules/fodeb8x/
  (defun ap/elfeed-search-browse-org ()
    "Open selected items as Org."
    (interactive)
    (let ((browse-url-browser-function (lambda (url _)
                                         (org-web-tools-read-url-as-org url))))
      (ap/elfeed-search-selected-map #'ap/elfeed-search-browse-entry)))

  (defun ap/elfeed-search-browse-entry (entry)
    "Browse ENTRY with `browse-url' and mark as read.
  If ENTRY is unread, it will also be unstarred.  To override the
  browser function, bind `browse-url-browser-function' around the
  call to this."
    (let ((url (elfeed-entry-link entry))
          (tags (elfeed-entry-tags entry)))
      ;; Mark as read first, because apparently the elfeed functions don't work after `browse-url'
      ;; potentially changes the buffer.
      (elfeed-untag entry 'unread)
      (elfeed-search-update-entry entry)
      (browse-url url)))

  (cl-defun ap/elfeed-search-selected-map (fn)
    "Map FN across selected entries in elfeed-search buffer using `mapcar'."
    (mapcar fn (elfeed-search-selected)))
  ;;-------------------------------------------------------------------------
  ;; ***  Shell Config
  ;;-------------------------------------------------------------------------
  ;; Forces bash shell into interactive mode, leadings to sourcing of
  ;; ~/.bashrc and interactive aliases and functions
  ;; (setq shell-command-switch "-ic")
  ;; Default value was "-c"
  (setq shell-command-switch "-c")
  ;;-------------------------------------------------------------------------
  ;; ***  Miscellaneous Config
  ;;-------------------------------------------------------------------------
  ;; Should double buffering cause lag spikes on 3840 x 2160 displays
  ;; we can disable it via...
  (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
  ;; Sets default browser
  (setq browse-url-browser-function 'browse-url-firefox)
  ;; Useful trick to share snippets between modes. Whenever a major mode
  ;; is loaded, fundamental-mode is also loaded
  (add-hook 'yas-minor-mode-hook (lambda ()
                                   (yas-activate-extra-mode 'fundamental-mode)))
  ;; User Defined Toggles -> See SPC t hydra menu
  ;; VISUALLY wraps words that go past screen length
  ;; setq-default command means the command is run in every major mode buffer
  (setq-default truncate-lines nil)
  ;; Enables line by line navigation. Lines are not line broken > use RET for that
  (spacemacs/toggle-visual-line-navigation-globally-on)
  ;; Determines the length of time between the end of typing for SPC j j (avy-timer)
  ;; and the appearance of green prompt letters
  (setq avy-timeout-seconds 0.50)
  ;; Change the scale of the powerline
  (setq powerline-scale 0.50)
  ;; Self explanatory (menu-bar-mode 1) (tool-bar-mode 1)
  ;;-------------------------------------------------------------------------
  ;; END OF USER CONFIG
  ;;-------------------------------------------------------------------------
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode wolfram-mode winum which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package unkillable-scratch unfill undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil transmission toc-org terminal-here tagedit symon symbol-overlay string-inflection string-edit sphinx-doc spaceline-all-the-icons smeargle slime-company slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters racket-mode quickrun pytest pyenv-mode py-isort pug-mode prettier-js poetry plantuml-mode pippel pipenv pip-requirements persistent-scratch pdf-view-restore pcre2el password-generator paradox pandoc-mode ox-pandoc overseer orgit-forge org-web-tools org-vcard org-tanglesync org-superstar org-rich-yank org-ref org-re-reveal org-projectile org-present org-pomodoro org-pdftools org-mime org-gcal org-fragtog org-download org-contrib org-cliplink org-brain org-appear org-analyzer open-junk-file ob-racket nose nameless mwim multi-term multi-line mu4e-maildirs-extension mu4e-alert lorem-ipsum live-py-mode link-hint lexic jupyter indent-guide importmagic impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helpful helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mu helm-mode-manager helm-make helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-ledger flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-snipe evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-ledger evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav elfeed-org elfeed-goodies editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish define-word cython-mode company-web company-reftex company-math company-auctex company-anaconda common-lisp-snippets column-enforce-mode clean-aindent-mode centered-cursor-mode cdlatex calfw-org calfw browse-at-remote blacken better-jumper auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk ascii-art-to-unicode aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
