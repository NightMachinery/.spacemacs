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
   '(ruby
     lua
     octave
     csv
     sql
     asciidoc
     yaml
     fsharp
     windows-scripts
     javascript
     json
     ocaml
     idris
     fasd
     xclipboard
     gpu
     epub
     xkcd
     spotify
     twitter
     search-engine
     vimscript
     (elfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/feeds/elfeed1.org"))
     (rust :variables
           rust-format-on-save t)
     ;;crystal
     (haskell :variables haskell-enable-hindent t)
     ;; semantic
     lsp
     (c-c++ :variables c-c++-enable-clang-support t)
     html
     ;; (python :variables python-backend 'anaconda)
     ;; (python :variables python-backend 'lsp python-lsp-server 'pyls ) ; python-pipenv-activate t
     (python :variables
             python-backend 'lsp
             python-lsp-server 'mspyls
             python-lsp-git-root "~/code/Misc/python-language-server/"
             )
     dap
     chrome
     (scala :variables
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows t
            scala-auto-insert-asterisk-in-comments t)
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     autohotkey
     kotlin
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :disabled-for ocaml :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t) ;; doesn't work with the mac port version of emacs.
     ;; better-defaults
     emacs-lisp
     (ibuffer :variables ibuffer-group-buffers-by 'modes)
     ;; games
     ;; colors
     ;; themes-megapack
     coq
     emoji
     (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
     git
     ;; (java :variables java-backend 'ensime)
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t)
     (elm :variables elm-sort-imports-on-save t
          elm-format-on-save t)
     version-control
     osx
     scheme ;; racket
     (clojure :variables clojure-enable-fancify-symbols t)
     ;; (keyboard-layout :variables kl-layout 'dvorak-right-handed)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(evil-easymotion lispyville company-jedi evil-lispy dimmer focus system-packages google-this evil-string-inflection crux command-log-mode zoom atomic-chrome cider-hydra flycheck-pos-tip kibit-helper sayid flycheck-clojure helm-fuzzier smart-mode-line highlight-indent-guides ediprolog clomacs exec-path-from-shell osx-clipboard flymake-shellcheck symon google-translate md4rd adaptive-wrap persp-projectile key-chord solarized-theme color-theme-sanityinc-tomorrow doom-themes moe-theme zenburn-theme)
   ;; persp-projectile switch-window company-childframe

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(flycheck-ocaml)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(helm . "melpa-stable") package-pinned-packages)
  ;; (push '(info+ . "melpa-stable") package-pinned-packages)

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
   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the lastest
   ;; version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil
   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;;dotspacemacs-mode-line-theme is 'spacemacs, 'all-the-icons, 'custom, 'vim-powerline or 'vanilla or a list with `car' one of the previous values and properties one of the following: `:separator' or `:separator-scale'
   dotspacemacs-mode-line-theme 'spacemacs
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
   dotspacemacs-themes '(solarized-light zenburn
                                         ) ;;spacemacs-light
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 25
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
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
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
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 30
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
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
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
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (add-to-list 'exec-path "/usr/local/bin") ;; Lots of stuff here.
  ;; (setq configuration-layer-elpa-archives
  ;;       '(("melpa"    . "melpa.org/packages/")
  ;;         ("org"      . "orgmode.org/elpa/")
  ;;         ("gnu"      . "elpa.gnu.org/packages/")))
  (setq frame-resize-pixelwise t)
  (when (memq window-system '(mac ns))
    (add-to-list 'default-frame-alist '(ns-appearance . '()))
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
  ;;(setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . 'nil)))
  ;; (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (load-theme 'zenburn t t)
  ;; (load-theme 'solarized-light t t)


  (require 'cider)
  (load "~/.private-config.el")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes/")
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/private/myPackages/"))
  (defun ns-yank-image-at-point-as-image ()
    "Yank the image at point to the X11 clipboard as image/png."
    (interactive)
    (let ((image (get-text-property (point) 'display)))
      (if (eq (car image) 'image)
          (let ((data (plist-get (cdr image) ':data))
                (file (plist-get (cdr image) ':file)))
            (cond (data
                   (with-temp-buffer
                     (insert data)
                     (call-shell-region
                      (point-min) (point-max)
                      "impbcopy"))) ;; http://www.alecjacobson.com/weblog/?p=3816 Linux x11: https://emacs.stackexchange.com/questions/41016/how-can-i-yank-images-from-emacs?noredirect=1#comment64407_41016
                  (file
                   (if (file-exists-p file)
                       (start-process
                        "_" nil "impbcopy"  (file-truename file))))
                  (t
                   (message "The image seems to be malformed."))))
        (message "Point is not at an image."))))
  ;; (require 'exec-path-from-shell)
  ;; (exec-path-from-shell-initialize)
  ;; (exec-path-from-shell-copy-env "JAVA_HOME") ;Idk if this is necessary.
  (setenv "SHELL" "/bin/bash")
  (setq shell-file-name "/bin/bash")
  (setq explicit-shell-file-name "/bin/bash") ;;Set emacs shell to bash.
  (setenv "PAGER" "cat")                      ;;Required for shell mode.

  (defun my/python-mode-hook ()
    ;; (with-eval-after-load 'company (add-to-list 'company-backends 'company-jedi))
    )
  (defun my/setup-overtone-hotkeys ()
    (interactive "")
    (define-key evil-normal-state-map (kbd "] '") '(lambda () (interactive "")
                                                     (cider-nrepl-sync-request:eval  "(overtone.live/stop)")))
    (define-key evil-normal-state-map (kbd "] r") '(lambda () (interactive "")
                                                     (cider-nrepl-sync-request:eval  "(overtone.live/recording-stop)")))
    (define-key evil-normal-state-map (kbd "[ r") '(lambda (file-name) (interactive "sSave to:")
                                                     (cider-nrepl-sync-request:eval  (concat "(overtone.live/recording-start \"/Base/- Art/Audio/i-laugh/" file-name ".wav\")")))))
  (defun my-select-current-line ()
    (interactive)
    (move-beginning-of-line nil)
    (set-mark-command nil)
    (move-end-of-line nil)
    (setq deactivate-mark nil))
  (defun my-cider-eval-paragraph ()
    (interactive) 
    (save-excursion
      (mark-paragraph) 
      (command-execute 'cider-eval-region)))
  (defun my-cider-eval-line ()
    (interactive) 
    (save-mark-and-excursion
      (my-select-current-line) 
      (command-execute 'cider-eval-region)))
  (require 'smartparens)
  ;; (defun python-start-and-load-buffer ()
  ;;   "Starts or switches to the REPL and loads the current buffer."
  ;;   (interactive)
  ;;   (progn
  ;;     (spacemacs/python-start-or-switch-repl)
  ;;     (spacemacs/python-shell-send-buffer-switch)))
  ;;#uc
  (evilem-default-keybindings "e")
  ;; (evilem-define (kbd "e s") 'evil-snipe-s) ;; Doesn't work
  ;; (elpy-enable)
  (require 'dap-python)
  (setenv "WORKON_HOME" "~/anaconda/envs")
  (pyvenv-activate  "~/anaconda/bin")   ; possibly bad?
  ;; (pyvenv-mode 1) ;; Possibly useful?
  (defun night/make-buffer-executable ()
    (interactive)
    (shell-command
		 (concat "chmod u+x " (shell-quote-argument (buffer-file-name)))))
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
  (spacemacs/toggle-smartparens-globally-off) ;; This is the shit that keeps messing up the delimiters.
  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (defun night/diff-buffers (buffer-A buffer-B)
    "Run Ediff on a pair of buffers, BUFFER-A and BUFFER-B."
    (interactive
     (list (read-buffer "buffer1: " (current-buffer))
           (read-buffer "buffer2: " (current-buffer))))
    (ediff-buffers-internal buffer-A buffer-B nil nil 'ediff-buffers))

  (setq evil-want-fine-undo t)
  ;;  (advice-add 'undo-auto--last-boundary-amalgamating-number
  ;;               :override #'ignore)
  ;;   (defun undo-auto--undoable-change ()
  ;;     "The symbol `undo-auto--undoable-change' is hard-coded in `insdel.c`
  ;; Called after every undoable buffer change."
  ;;     ;;  (unless undo-auto-current-boundary-timer
  ;;     ;;    (setq undo-auto-current-boundary-timer
  ;;     ;;            (run-at-time 0.5 nil #'undo-auto--boundary-timer)))
  ;;     (add-to-list 'undo-auto--undoably-changed-buffers (current-buffer)))
  ;;   (defun undo-auto-amalgamate ()
  ;;   "The symbol `auto-undo-amalgamate' is hard-coded in `cmds.c`.
  ;;   Amalgamate undo if necessary.
  ;;   This function can be called before an amalgamating command.  It
  ;;   removes the previous `undo-boundary' if a series of such calls
  ;;   have been made.  By default `self-insert-command' and `delete-char' are
  ;;   the only amalgamating commands, although this function could be called
  ;;   by any command wishing to have this behavior."
  ;;     ;;  (let ((last-amalgamating-count
  ;;     ;;         (undo-auto--last-boundary-amalgamating-number)))
  ;;     ;;    (setq undo-auto--this-command-amalgamating t)
  ;;     ;;    (when
  ;;     ;;        last-amalgamating-count
  ;;     ;;      (if
  ;;     ;;          (and
  ;;     ;;           (< last-amalgamating-count 20)
  ;;     ;;           (eq this-command last-command))
  ;;     ;;          ;; Amalgamate all buffers that have changed.
  ;;     ;;          (dolist (b (cdr undo-auto--last-boundary-cause))
  ;;     ;;            (when (buffer-live-p b)
  ;;     ;;              (with-current-buffer
  ;;     ;;                  b
  ;;     ;;                (when
  ;;     ;;                    ;; The head of `buffer-undo-list' is nil.
  ;;     ;;                    ;; `car-safe' doesn't work because
  ;;     ;;                    ;; `buffer-undo-list' need not be a list!
  ;;     ;;                    (and (listp buffer-undo-list)
  ;;     ;;                         (not (car buffer-undo-list)))
  ;;     ;;                  (setq buffer-undo-list
  ;;     ;;                        (cdr buffer-undo-list))))))
  ;;     ;;        (setq undo-auto--last-boundary-cause 0))))
  ;;     nil)
  (setq company-global-modes '(not tuareg-mode))
  (require 'flymake-shellcheck)
  (setq shell-file-name "zsh")
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load)
  (add-hook 'octave-mode-hook
            (lambda () (progn (setq octave-comment-char ?%)
                              (setq comment-start "% ")
                              (setq comment-add 0))))

  (evil-define-key 'normal tuareg-mode-map (kbd ", e b") #'tuareg-eval-buffer)
  (add-hook 'tuareg-mode-hook
            (lambda () (progn
                         (company-mode -1))))
  (setq manquery "^[0-9]+\\s-+")
  (when nil (add-hook 'Man-mode-hook
                      (lambda () (progn
                                   (defun helm-swoop-pre-input-optimize ($query)
                                     $query) ;; disable swoop escaping
                                   ;; (spacemacs/toggle-maximize-buffer) ;; Breaks helm-man-woman
                                   (setq helm-swoop-pre-input-function
                                         (lambda () (progn
                                                      manquery)))))))
  ;; (defun helm-swoop-pre-input-optimize ($query)
  ;;   (when $query
  ;;     (let (($regexp (list '("\+" . "\\+")
  ;;                          '("\*" . "\\\\*")
  ;;                          '("\#" . "\\#"))))
  ;;       (mapc (lambda ($r)
  ;;               (setq $query (replace-regexp-in-string (car $r) (cdr $r) $query)))
  ;;             $regexp)
  ;;       $query)))
  (osx-clipboard-mode +1)
  (eval-after-load 'cider
    '(progn
       (cider-add-to-alist 'cider-jack-in-dependencies
                           "org.tcrawley/dynapath" "0.2.5")
       (cider-add-to-alist 'cider-jack-in-dependencies
                           "com.cemerick/pomegranate" "0.4.0")))
  (setq frame-alpha-lower-limit 0)
  ;; (spacemacs/set-leader-keys "ou"
  ;;   '(lambda (&optional frame)
  ;;      (interactive)
  ;;      (let* ((invisible-alpha 0) (current-alpha (or (car (frame-parameter frame 'alpha))
  ;;                                                    100))
  ;;             (increased-alpha (if (not (= current-alpha invisible-alpha)) (progn
  ;;                                                                            (setq my-last-alpha current-alpha) invisible-alpha) my-last-alpha)))
  ;;        (when (>= increased-alpha 0)
  ;;          (set-frame-parameter frame
  ;;                               'alpha
  ;;                               (cons increased-alpha increased-alpha))))))
  (spacemacs/set-leader-keys "ou" '(lambda (&optional frame)
                                     (interactive)
                                     (let* ((invisible-alpha 0) (current-alpha (or (car (frame-parameter frame 'alpha))
                                                                                   100)))
                                       (set-frame-parameter frame
                                                            'alpha
                                                            (cons invisible-alpha invisible-alpha))
                                       (read-event)
                                       (set-frame-parameter frame
                                                            'alpha
                                                            (cons current-alpha current-alpha)))))

  (setq evil-cross-lines t)
  (require 'undo-tree)
  (setq undo-tree-enable-undo-in-region nil)
  (require 'highlight-indent-guides)
  (setq highlight-indent-guides-responsive 'nil)
  (setq highlight-indent-guides-method 'fill) ;; The default is fill.
  (defun kill-all-comments ()
    "Kills all the comments in the code, without putting them in the killring."
    (interactive)
    (goto-char (point-min))
    (let (kill-ring)
      (comment-kill (count-lines (point-min) (point-max)))))
  (defun escape-doublequotes-at-car-of-kill-ring ()
    "Escape doublequotes in car of kill-ring "
    (interactive)
    (with-temp-buffer
      (insert (car kill-ring))
      (goto-char (point-min))
      (while (search-forward "\"" nil t 1)
        (replace-match "\\\\\""))
      (kill-new (buffer-substring-no-properties (point-min) (point-max)))))
  (global-set-key (kbd "H-C-M-e") 'insert-char)
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"  python-shell-interpreter-args "--simple-prompt -i"))
  (require 'org)
  (with-eval-after-load 'org (push "~/code/Org/treasure-plan.org" org-agenda-files ))
  ;; (push 'cider--debug-mode evil-snipe-disabled-modes)
  (add-hook 'cider--debug-mode-hook (lambda ()
                                      (if (bound-and-true-p cider--debug-mode)
                                          (turn-off-evil-snipe-mode)
                                        (turn-on-evil-snipe-mode))))
  (global-prettify-symbols-mode 1)
  (defun bluerose-prettify-global ()
    (dolist (pretty-symbol
             '(
               ("->" . 8594)            ; → 
               ("=>" . 8658)            ; ⇒
               (">=" . ?≥)
               ("<=" . ?≤)          ;Might be bad with Scala.
               ;; (">=" . (?\s (Br . Bl) ?\s (Bc . Bc) ?≥))
               )) (push pretty-symbol prettify-symbols-alist)))
  (defun bluerose-prettify-lisp ()
    (bluerose-prettify-global)
    (dolist (pretty-symbol
             '(
               ;; ("lambda" . 955) ; λ
               ("reverse" . ?⮌)
               ;; ("->" . (?\s (Br . Bl) ?\s (Bc . Bc) ?🠊))
               ;; ("->>" . (?\s (Br . Bl) ?\s (Br . Bl) ?\s
               ;;               (Bc . Br) ?🠊 (Bc . Bl) ?🠊))
               ("->" . (?- (Br . Bc) ?- (Br . Bc) ?>))
               ("->>" .  (?\s (Br . Bl) ?\s (Br . Bl) ?\s
                              (Bl . Bl) ?- (Bc . Br) ?- (Bc . Bc) ?>
                              (Bc . Bl) ?- (Br . Br) ?>))
               ;; ("apply" . ?👁)           ;Funny
               ("map" . 8614)           ; ↦
               )) (push pretty-symbol prettify-symbols-alist)))
  (add-hook 'cider-connections-buffer-mode-hook (lambda ()
                                                  (evil-insert-state 1)))
  ;; (add-hook 'cider-connected-hook (lambda () (cider-load-file (expand-file-name "lispy-clojure.clj" lispy-site-directory)))) ;; TODO Is this still necessary?
  ;; https://github.com/abo-abo/lispy/issues/418
  (evil-define-key 'normal clojure-mode-map (kbd ", e l") #'my-cider-eval-line)
  (add-hook 'clojure-mode-hook #'bluerose-prettify-clojure)
  (add-hook 'cider-repl-mode-hook #'bluerose-prettify-clojure)
  (defun bluerose-prettify-clojure ()
    (bluerose-prettify-lisp)      ; TODO Disable this toy. It's bad indentation.
    (dolist (pretty-symbol
             '(
               ;; ("#" . ?λ)
               ("def" . ?🍓)
               )) (push pretty-symbol prettify-symbols-alist))
    (setq-local prettify-symbols-compose-predicate
                (lambda (begin end match)
                  (and (prettify-symbols-default-compose-p begin end match)
                       (or (not (equal match "#")) (eq (char-after end) ?\())))))
  (setq evil-snipe-override-local-mode-map
        (let ((map (make-sparse-keymap)))
          (evil-define-key* 'motion map
                            "f" #'evil-snipe-f
                            "F" #'evil-snipe-F
                            "t" #'evil-snipe-t
                            "T" #'evil-snipe-T)
          (when evil-snipe-override-evil-repeat-keys
            (evil-define-key* 'motion map
                              "n" #'evil-snipe-repeat ;; Replacing the default ';'
                              "N" #'evil-snipe-repeat-reverse))
          map))

  (setq evil-snipe-parent-transient-map
        (let ((map (make-sparse-keymap)))
          (define-key map "n" #'evil-snipe-repeat)
          (define-key map "N" #'evil-snipe-repeat-reverse)
          map))
  ;; (linum-relative-global-mode) #Broken API
  (spacemacs/toggle-relative-line-numbers-on)
  ;; (with-eval-after-load 'clojure-mode
  ;; (sayid-setup-package)) ;; Broken after update
  (with-eval-after-load 'flycheck
    ;; (flycheck-clojure-setup)
    (flycheck-pos-tip-mode))
  (setq evil-move-beyond-eol t)
  (setq evil-move-cursor-back nil)
  (spacemacs/enable-flycheck 'emacs-lisp-mode)
  (spacemacs/enable-flycheck 'clojure-mode)
  (require 'helm-fuzzier)
  (helm-fuzzier-mode 1)
  (spacemacs/set-leader-keys "oci" #'ns-yank-image-at-point-as-image)
  (setq twittering-connection-type-order '(wget curl urllib-http native urllib-https))
  (require 'yow)
  (setq yow-file "~/.emacs.d/private/resources/yow.lines") ;; This file is customizable.
  (require 'atomic-chrome)
  (ignore-errors (atomic-chrome-start-server))
  (require 'zoom)
  (with-eval-after-load 'zoom
    (setq zoom-size '(0.618 . 0.618))
    (spacemacs/set-leader-keys "tg" 'zoom-mode)) ;; TODO TOCHECK Does it work?
  ;; (require 'auto-scroll)
  ;; (setq dotspacemacs-zone-out-when-idle 300) ;; Activates Zone in specified seconds.
  (require 'helm)
  (require 'helm-swoop)
  (spacemacs/set-leader-keys "si" 'helm-swoop-from-evil-search  "si" 'helm-swoop-from-isearch
    )
  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)
  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  ;; (setq helm-swoop-use-fuzzy-match t)
  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (shell-command-on-region (region-beginning) (region-end) "pbcopy")
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          )
      (insert (shell-command-to-string "pbpaste"))
      )
    )
  (spacemacs/set-leader-keys "occ" 'copy-to-clipboard)
  (spacemacs/set-leader-keys "ocv" 'paste-from-clipboard) ;; These override the default
  ;; (setq dimmer-mode t)
  (setq dimmer-fraction 0.3)
  (defun my-lisp-init ()
    (progn
      ;; No need. Use the 'o' text object ;) ;; (modify-syntax-entry ?- "w") ;; Makes word-word one word.
      ;; make evil-lispy start in the modes you want
      ;; (evil-lispy-mode)
      (lispy-mode 1)
      ;; lispyville is automatically started as well.
      ))
  (lispyville-set-key-theme
   '(operators
     c-w
     (escape insert)
     ;; (additional-movement normal visual motion)
     ))

  (lispyville--define-key '(insert)
    "\"" #'lispy-doublequote) ;;Otherwise would escape doublequotes in Strings automagically.

  (lispyville--define-key '(normal visual)
    "P" #'lispy-paste)
  (lispyville--define-key '(normal visual motion)
    "H" #'lispyville-backward-sexp
    "L" #'lispyville-forward-sexp
    (kbd "M-h") #'lispyville-beginning-of-defun
    (kbd "M-l") #'lispyville-end-of-defun
    ;; reverse of lispy-flow
    "{" #'lispyville-previous-opening
    "}" #'lispyville-next-closing
    ;; like lispy-flow
    ;; "8" #'lispyville-next-opening
    ;; "7" #'lispyville-previous-closing
    ;; like lispy-left and lispy-right
    "(" #'lispyville-backward-up-list
    ")" #'lispyville-up-list)
  (add-hook 'lispy-mode-hook #'lispyville-mode)
  (add-hook 'emacs-lisp-mode-hook #'my-lisp-init)
  (add-hook 'clojure-mode-hook  #'my-lisp-init)
  (add-hook 'scheme-mode-hook #'my-lisp-init)
  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
  ;; evil-snipe layer available ...
  ;; (require 'evil-snipe)
  ;; (evil-snipe-mode +1)
  ;; (evil-snipe-override-mode +1)
  ;; (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
  ;; (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)

  ;; (define-key evil-snipe-parent-transient-map (kbd "C-;")
  ;;   (evilem-create 'evil-snipe-repeat
  ;;                  :bind ((evil-snipe-scope 'buffer)
  ;;                         (evil-snipe-enable-highlight)
  ;;                         (evil-snipe-enable-incremental-highlight))))
  ;; https://github.com/hlissner/evil-snipe/issues/25#issuecomment-208068419

  (require 'google-translate)
  (require 'google-translate-smooth-ui)
  (setq google-translate-translation-directions-alist
        '(("en" . "fa") ("fa" . "en") ("en" . "en") ))
  ;; (require 'lsp-java)
  ;; (require 'lsp-mode)
  ;; (add-hook 'java-mode-hook #'lsp-mode) ;; ?
  ;; (add-hook 'java-mode-hook #'lsp-java-enable)
  ;; (setq lsp-java-server-install-dir "~/.emacs.d/private/lsp-servers/jdt-language-server-latest")
  ;; Needed to disable omniscience in elisp, which makes emacs freeze.
  ;; (use-package semantic
  ;;   :config
  ;;   (setq-mode-local emacs-lisp-mode
  ;;                    semanticdb-find-default-throttle
  ;;                    (default-value 'semanticdb-find-default-throttle)))
  (add-hook 'Man-mode-hook
            (lambda () (local-set-key (kbd "q") 'Man-kill)))

  (spacemacs/set-leader-keys "qx" '(lambda () (interactive) (progn (kill-buffer) (spacemacs/frame-killer))))
  (spacemacs/set-leader-keys "oo" 'recentf-open-files)
  (spacemacs/set-leader-keys "oms" 'evil-set-marker)
  (spacemacs/set-leader-keys "omg" 'evil-goto-mark)
  (spacemacs/set-leader-keys "oa" 'write-file)
  (spacemacs/set-leader-keys "os" 'save-some-buffers)
  (spacemacs/set-leader-keys "of" 'toggle-frame-fullscreen) ;;'spacemacs/toggle-fullscreen)
  (spacemacs/set-leader-keys "ot" 'google-translate-smooth-translate)
  (spacemacs/set-leader-keys "ao." 'org-cycle-agenda-files)
  (spacemacs/set-leader-keys "op" 'projectile-persp-switch-project)
  (spacemacs/set-leader-keys "oi" '(lambda () (interactive "")
                                     (progn  (save-buffer)
                                             (do-applescript "tell application \"IntelliJ IDEA 2018.1\" to activate"))))
  (define-key key-translation-map (kbd "SPC o x") (kbd "C-x #"))
  (global-set-key (kbd "H-<up>") 'move-text-up)
  (global-set-key (kbd "H-<down>") 'move-text-down)
  (global-set-key (kbd "H-<right>") 'end-of-line)
  (global-set-key (kbd "H-<left>") 'back-to-indentation)
  (global-set-key (kbd "H-M-<left>") 'beginning-of-line)
  (global-set-key (kbd "<wheel-right>") '(lambda ()
                                           (interactive)
                                           (scroll-left 4)))
  (global-set-key (kbd "<wheel-left>") '(lambda ()
                                          (interactive)
                                          (scroll-right 4)))
  ;; (setq edit-server-url-major-mode-alist
  ;; '(("quora\\.com" . text-mode)))
  (add-hook 'edit-server-done-hook (lambda () (shell-command "open -a \"Google Chrome\"")))
  (defun night/ssh-pre ()
    (interactive)
    ;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html
    (setq remote-file-name-inhibit-cache nil)
    (setq vc-ignore-dir-regexp
          (format "\\(%s\\)\\|\\(%s\\)"
                  vc-ignore-dir-regexp
                  tramp-file-name-regexp))
    ;; Bug in Spacemacs https://github.com/syl20bnr/spacemacs/issues/11514
    (remove-hook 'python-mode-hook 'spacemacs//init-eldoc-python-mode))
  (defun night/tramp-refresh ()
    (interactive)
    (recentf-cleanup)
    (tramp-cleanup-all-buffers)
    (tramp-cleanup-all-connections))
  (defun ssh-corra ()
    (interactive)
    (dired "/ssh:mary@198.143.181.104:/"))
  (defun scp-borg-evil-lord ()
    (interactive)
    (find-file-existing "/scp:mary@198.143.181.104:/home/mary/code/uniborg/stdplugins/evil_lord.py"))
  (defun ssh-win ()
    (interactive)
    (dired "/ssh:Evar@10.211.55.3:/"))
  (defun ssh-eva ()
    (interactive)
    (dired "/ssh:eva@82.102.10.121:/home/eva/scripts/"))
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=yes")
  (setq password-cache-expiry nil)
  (setq projectile-mode-line "Projectile")
  (setq ns-right-command-modifier 'super)
  (setq show-paren-style 'expression)
  (show-paren-mode)
  (setq evil-emacs-state-cursor '("chartreuse3" (bar . 2)))
  ;; (purpose-mode -1)
  ;; (require 'company-childframe)
  ;; (company-childframe-mode 1)


  (define-key evil-normal-state-map (kbd "[ o") 'evil-unimpaired/next-frame)
  (define-key evil-normal-state-map (kbd "] o") 'evil-unimpaired/previous-frame)

  ;; (require 'persp-projectile)
  ;; Default value for :pin in each use-package.
  ;;(setq use-package-always-bin "melpa-stable")
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  (setq-default evil-escape-delay 0.3)
  ;; (setq special-display-buffer-names
  ;; ‘(“*sbt*” “*Help*”)) ;;Stops splitting the window for sbt buffers.
  (setq ensime-startup-notification `nil)
  (setq exec-path-from-shell-check-startup-files nil)
  (setq pop-up-frames nil) ;;Default is true.

  (defvar-local previous-binding-for-q nil)
  ;; (add-hook 'read-only-mode-hook '(lambda ()
  ;;                                   (if buffer-read-only
  ;;                                       (progn
  ;;                                         (setq previous-binding-for-q (local-key-binding "q"))
  ;;                                         (local-set-key "q" '(lambda ()
  ;;                                                               (quit-window "KILL")))
  ;;                                         (message "q remapped to kill buffer."))
  ;;                                     (progn
  ;;                                       (message "q restored to original mapping.")
  ;;                                       (local-set-key "q" previous-binding-for-q)))))
  (require 'view)
  (setq view-read-only t)               ; enter view-mode for read-only files
  (defun kill-window ()
    (interactive)
    (quit-window "KILL"))
  (define-key view-mode-map "x" 'kill-window)
  (defun set-x-to-kill ()
    (local-set-key "x" 'kill-window))
  (add-hook 'help-mode-hook 'set-x-to-kill)
  (add-hook 'dired-mode-hook 'set-x-to-kill)

  (setq-default adaptive-wrap-extra-indent 2)
  (add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)

  ;; These 3 lines are supposed to make Scala layer work with Java.
  ;; (setq exec-path (append exec-path '("/usr/local/bin")))
  ;;(add-hook 'java-mode-hook 'scala/configure-ensime)
  ;;(add-hook 'java-mode-hook 'scala/maybe-start-ensime)


  ;; (setq eclim-eclipse-dirs '("~/eclipse/jee-oxygen2/Eclipse.app/Contents/Eclipse")
  ;; eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.2/bin/eclim"
  ;; eclimd-default-workspace "/Base/- Code/Eclipse")
  ;; (require 'eclim)
  ;; (setq eclimd-autostart t)

  ;; (defun my-java-mode-hook ()
  ;;   (eclim-mode t))

  ;; (add-hook 'java-mode-hook 'my-java-mode-hook)

  ;; (pyvenv-mode 1)
  ;; (require 'webkit)
  ;; (require 'bookmark+)
  ;; (load-theme 'solarized-light t)

  ;; GUI Settings for YAMAMOTO Mitsuharu's Mac port of GNU Emacs.
  ;; https://github.com/railwaycat/homebrew-emacsmacport
  (when (and (spacemacs/system-is-mac) (display-graphic-p))
    ;; Disable pixel-by-pixel scrolling, since it's extremely choppy.
    (setq mac-mouse-wheel-smooth-scroll nil))

  ;; Keyboard smooth scrolling: Prevent the awkward "snap to re-center" when
  ;; the text cursor moves off-screen. Instead, only scroll the minimum amount
  ;; necessary to show the new line. (A number of 101+ disables re-centering.)
  (setq scroll-conservatively 101)

  ;; Optimize mouse wheel scrolling for smooth-scrolling trackpad use.
  ;; Trackpads send a lot more scroll events than regular mouse wheels,
  ;; so the scroll amount and acceleration must be tuned to smooth it out.
  (setq
   ;; If the frame contains multiple windows, scroll the one under the cursor
   ;; instead of the one that currently has keyboard focus.
   mouse-wheel-follow-mouse 't
   ;; Completely disable mouse wheel acceleration to avoid speeding away.
   mouse-wheel-progressive-speed nil
   ;; The most important setting of all! Make each scroll-event move 2 lines at
   ;; a time (instead of 5 at default). Simply hold down shift to move twice as
   ;; fast, or hold down control to move 3x as fast. Perfect for trackpads.
   mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . 6)))

  (fset 'evil-visual-update-x-selection 'ignore)
  (delete-selection-mode 1)
  ;; (set-default 'server-socket-dir "~/.emacs.d/server")
  ;; (if (functionp 'window-system)
  ;;     (when (and (window-system)
  ;;                (>= emacs-major-version 24))
  ;;       (if (server-running-p)(server-start))))
  (require 'helm-bookmark)
  (require 'cider)
  (save-place-mode 1)
  ;; (require 'smooth-scrolling)
  ;; (require 'smooth-scroll                        ) ;; Smooth scroll
  ;; (smooth-scroll-mode 1                          ) ;; Enable it
  ;; (setq smooth-scroll/vscroll-step-size 5        ) ;; Set the speed right
  ;;(setq geiser-racket-binary "/Applications/Racket v6.10.1/bin/racket")
  (key-chord-mode 1)
  ;; (setq-default evil-escape-key-sequence "jk") ;; Has stopped working. Probably because lispyville
  ;; (key-chord-define evil-insert-state-map "fd" 'evil-escape)
  ;; (key-chord-define evil-insert-state-map "ll" 'evil-escape)
  ;; (key-chord-define evil-insert-state-map "jj" 'evil-delete-backward-char)
  ;; (key-chord-define evil-insert-state-map "kk" 'delete-forward-char)
  ;; (defun add-key-cider-doc () (key-chord-define evil-insert-state-map "hh" 'cider-doc))
  ;; (add-hook 'clojure-mode-hook 'add-key-cider-doc)
  ;; (add-hook 'cider-repl-mode-hook 'add-key-cider-doc)
  (key-chord-define-global "fd" '(lambda () (interactive "")
                                   (cond
                                    ((or (eq evil-state 'normal) (eq evil-state 'visual)) (execute-kbd-macro (kbd "<escape> , h h")))
                                    ((eq evil-state 'insert) (execute-kbd-macro(kbd "<escape> , h h i"))))))

  (add-hook 'clojure-mode-hook 'typed-clojure-mode)


  ;; (require 'ac-cider)
  ;; (add-hook 'clojure-mode-hook 'ac-flyspell-workaround)
  ;; (add-hook 'clojure-mode-hook 'ac-cider-setup)
  ;; (add-hook 'clojure-mode-hook 'auto-complete-mode)
  ;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  ;; (with-eval-after-load "auto-complete"
  ;;   (progn
  ;;      (add-to-list 'ac-modes 'clojure-mode)
  ;;      (add-to-list 'ac-modes 'cider-mode)
  ;;      (add-to-list 'ac-modes 'cider-repl-mode)))
  ;; (defun set-auto-complete-as-completion-at-point-function ()
  ;;   (setq completion-at-point-functions '(auto-complete)))

  ;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
  ;; (add-hook 'clojure-mode-hook 'se
  ;; t-auto-complete-as-completion-at-point-function)
  ;; (spacemacs/toggle-line-numbers-on)
  (add-hook 'prog-mode-hook 'linum-mode)
  (global-visual-line-mode)
  (global-undo-tree-mode)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)
  ;; (setq flycheck-scalastyle-jar
  ;;       "/Base/- Code/Resources/scalastyle_2.12-1.1.0-20171004.080250-1-batch.jar")
  ;; (setq flycheck-scalastylerc
  ;;       "/Base/- Code/Resources/scalastyle_config.xml")
  ;;(line-number-mode t)
  

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#343d46" t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (company-emacs-eclim eclim yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic doom-themes all-the-icons memoize nyan-mode proof-general company-coq company-math math-symbol-lists ibuffer-projectile zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode selectric-mode typit mmt sudoku pacmacs dash-functional 2048-game emoji-cheat-sheet-plus company-emoji iedit scroll-restore play-crystal inf-crystal flycheck-crystal crystal-mode helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics clojure-snippets auto-yasnippet ac-ispell xterm-color shell-pop org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term htmlize gnuplot eshell-z eshell-prompt-extras esh-help powerline bind-key smartparens highlight f evil goto-chg projectile epl avy ghub let-alist async hydra dash s noflet ensime company sbt-mode scala-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ahk-mode mips-mode ac-cider auto-complete smooth-scroll key-chord clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode helm helm-core racket-mode faceup smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit mmm-mode markdown-toc markdown-mode magit-gitflow launchctl helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl auto-dictionary ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) nil) (((class color) (min-colors 89)) (:background "#1c1c1c" :foreground "#eeeeee")))))
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#343d46" t)
 '(helm-ff-lynx-style-map t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (dap-mode bui company-emacs-eclim eclim yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic doom-themes all-the-icons memoize nyan-mode proof-general company-coq company-math math-symbol-lists ibuffer-projectile zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode selectric-mode typit mmt sudoku pacmacs dash-functional 2048-game emoji-cheat-sheet-plus company-emoji iedit scroll-restore play-crystal inf-crystal flycheck-crystal crystal-mode helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics clojure-snippets auto-yasnippet ac-ispell xterm-color shell-pop org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term htmlize gnuplot eshell-z eshell-prompt-extras esh-help powerline bind-key smartparens highlight f evil goto-chg projectile epl avy ghub let-alist async hydra dash s noflet ensime company sbt-mode scala-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ahk-mode mips-mode ac-cider auto-complete smooth-scroll key-chord clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider seq queue clojure-mode helm helm-core racket-mode faceup smeargle reveal-in-osx-finder pbcopy osx-trash osx-dictionary orgit mmm-mode markdown-toc markdown-mode magit-gitflow launchctl helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl auto-dictionary ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) nil) (((class color) (min-colors 89)) (:background "#1c1c1c" :foreground "#eeeeee")))))
)
