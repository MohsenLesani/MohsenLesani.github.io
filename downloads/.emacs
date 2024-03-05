; =====================================================
; To install:
;    Simply copy this file as ~/.emacs
;    To have tab bar, install:
;       sudo apt-get install emacs-goodies-el
; =====================================================
; Shortcuts:
; -----------------------------------------------------
; Emacs Shortcuts
; -----------------------------------------------------
; New file:                   C-n
; New tab:                    C-t
; Open file:                  C-o
; Save:                       C-s
; Save As:                    C-S-s
; Select the current word:    C-w
; Select all:                 C-a
; Copy                        C-c
; Paste                       C-v
; Cut                         C-x
; Duplicate line:             C-d
; Delete line:                C-y
; Undo                        C-z
; Redo                        Left (or any key), then C-z
; Find
;   Forward                   C-f
;   Backward                  C-S-f
;      Continue forward       Enter or F3:
;      Continue backward      S-Enter or S-F3:
; Replace:                    C-r
;   Replace this instance       y/Enter
;   Raplace all                 C-a
;   Skip this one               n
;   Quit                        Esc

; Close split:                C-0
; Maximize split:             C-1
; Vertical split:             C-3
; Horizontal split:           C-4

; Go to the next split:       C-k
; Go to the previous split:   C-j
; Toggle the other split:     C--
; Swap splits:                C-=
; Go to the next tab:         C-tab or M-right
; Go to the prev tab:         C-S-tab or M-left
; Go to the next tab group:   C-M-right
; Go to the prev tab group:   C-M-left
; Move tab left:              C-M-S-left
; Move tab right:             C-M-S-right

; Kill(Close) buffer:         C-F4
;                               Orig: C-x k
; Quit:                       C-q

; Spell check
;    Enable Flyspell mode, which highlights all misspelled words.
;       M-x flyspell-mode
;    Spell-check the current buffer (or the active region).
;       M-x ispell
;       Then
;          Space:    skip
;          a digit:  replace with the word of this number
;          i:        insert word
;          x:        exit
; back tab S-tab
; Page:
;   http://www.delorie.com/gnu/docs/emacs/emacs_109.html

; -----------------------------------------------------
; PVS Shortcuts
; -----------------------------------------------------
; Prove:                     S-F10
;                              Orig: M-x pr, C-c p
; Prove Prove single step:   C-S-F10
;                              Orig: C-c C-p s
; Prove theory:              S-F11
;                              Orig: C-c C-p t
; Show theory status:        C-S-F11
;                              Orig: M-x status-proof-theory
; Prove importchain:         S-F12
;                              Orig: C-c C-p i
; Show import chain status:  C-S-F12
;                              Orig: M-x status-proofchain

; Show prelude:              F1
;                              Orig: M-x view-prelude-file
; Show declaration:          S-F1
;                              Orig: M-.
; Show usages:               A-F7
;                              Orig: M-;

; Show tccs:                 S-F8
;                              Orig: M-x show-tccs
; Show the proof:            S-F5
; Install proof:             C-F5
; Show the xwindow:          S-F6
;                              Orig: M-x x-show-current-proof
; =====================================================
; Render Latex
; -----------------------------------------------------
; To install
;    sudo apt-get install preview-latex
; -----------------------------------------------------
; Shortcuts
;    Select a region and press F5
;    Regenerate a changed region: F5
;    Apply preview-latex to the whole document: C-S-p
;    Save before using these commands.

; =====================================================
; Todo:

; Emacs
; List all shortcuts here and add the following 
; selection color, tcl-pvs and hiddenformula
; Print
; Goto line, C-g
; Join lines C-j
; Go to matching bracket
; Search in directory
; Marking

; Complete Word (?): C-Space
; Folding (?)
; =====================================================
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
; -----------------------------------------------------
(setq x-select-enable-clipboard t)
(tool-bar-mode -1)
; To remove the menu bar
(menu-bar-mode -1)
; -----------------------------------------------------
; Line by line scroll
(setq scroll-step           1
      scroll-conservatively 10000)
; To not break lines
; (setq default-truncate-lines t)
;(toggle-truncate-lines)
; to do character by character scroll
(setq hscroll-step 1)      
; -----------------------------------------------------
; sudo apt-get install emacs-goodies-el
(require 'tabbar)
(tabbar-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/usr/lib/agda-stdlib/"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tabbar-button-highlight ((t (:inherit tabbar-default :foreground "black"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "blue" :box (:line-width 1 :color "white" :style released-button)))))
 '(tabbar-unselected ((t (:inherit tabbar-default :foreground "black" :box (:line-width 1 :color "white" :style pressed-button))))))


;; maybe you will find this usefull
;; it moves the current tab left/right rearranging the
;; tabs (as in konsole for example)
;; beware, this is my first elisp(lisp) hack
;; it probably looks terrible

(defun tabbar-move-tab (&optional right)
   "Move current tab to the left or to the right
   if RIGHT is set."
   (let* (
      (ctabset nil)
      (ctabs nil)
      (ctab nil)
      (hd nil)
      (tl nil))
      (and 
         (setq ctabset (tabbar-current-tabset 't))
         (setq ctabs (tabbar-tabs ctabset))
         (setq ctab (tabbar-selected-tab ctabset))
         (setq tl ctabs)
         (setq hd '())
      )
   (while
      (and
         (cdr tl) (not (eq ctab (car tl)))
         (not (eq ctab (cadr tl)))
      )
   (setq hd (append hd (list (car tl))) tl (cdr tl)))
   (set ctabset
      (cond
         (
            (and (not right) (null hd) (eq ctab (car tl)))
            (append (cdr tl) (list (car tl)))
         )
         (
            (not right)
            (append hd (list (cadr tl)) (list (car tl)) (cddr tl))
         )
         (
            (and right (not (cddr tl)))
            (append (list (cadr tl)) hd (list (car tl)))
         )
         (
            (and right (eq ctab (car tl)))
            (append hd (list (cadr tl)) (list (car tl)) (cddr tl))
         )
         (right
            (append hd (list (car tl)) (list (caddr tl)) (list (cadr tl)) (cdddr tl))
         )
      )
   )
   (put ctabset 'template nil)
   (tabbar-display-update))
)

(defun tabbar-move-tab-left ()
"Move tab left."
(interactive)
(tabbar-move-tab))

(defun tabbar-move-tab-right ()
"Move tab right."
(interactive)
(tabbar-move-tab t))

; Move tab left: C-M-S-left
(global-set-key (kbd "C-M-S-<left>") 'tabbar-move-tab-left)
; Move tab right: C-M-S-right
(global-set-key (kbd "C-M-S-<right>") 'tabbar-move-tab-right)

;(setq tabbar-buffer-groups-function
;        (lambda ()
;           (list "All")))

(defun tabbar-buffer-groups () 
 "Return the list of group names the current buffer belongs to. 
 This function is a custom function for tabbar-mode's tabbar-buffer-groups. 
 This function group all buffers into 3 groups: 
 Those Dired, those user buffer, and those emacs buffer. 
 Emacs buffer are those starting with “*”." 
  (list 
    (cond 
      (
        (or
          (and
            (string-equal "*" (substring (buffer-name) 0 1))
            (not (and
              (= (length (buffer-name)) 5)
              (string-equal "*pvs*" (substring (buffer-name) 0 5))
            ))
          )
          (string-equal "PVS" (substring (buffer-name) 0 3))
          (string-equal "pvs" (substring (buffer-name) 0 3))
;;          (string-equal "tcl-pvs" (substring (buffer-name) 0 7))
          (and
            (string-equal "_region_.tex" (buffer-name))
          )
        )
        "Emacs" 
      )
      (
        (or 
          (and
            (= (length (buffer-name)) 5)
            (string-equal "*pvs*" (substring (buffer-name) 0 5))
          )
;;          (string-equal "Expanded Sequent" (substring (buffer-name) 0 16))
        )
        "PVS"
      )
      (
        (and
          (= (length (buffer-name)) 5) 
          (string-equal "Proof" (substring (buffer-name) 0 5))
        )
        "Proof"
      )     
      (t      
      "User"
      ) 
    )
  )
) ;; from Xah Lee 
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups) 

; -----------------------------------------------------
; Quit: C-q
(global-set-key (kbd "C-q") "\C-x\C-c")

; New file: C-n
(global-set-key (kbd "C-n") 'find-file)
; New tab: C-t
(global-set-key (kbd "C-t") 'find-file)

; Open file: C-o
(global-set-key (kbd "C-o") 'find-file)
; Save: C-s
(global-set-key (kbd "C-s") 'save-buffer)
; Save As: C-S-s
(global-set-key (kbd "C-S-s") 'write-file)

; Find: C-f
(global-set-key (kbd "C-f") 'isearch-forward)
; Find, go back: C-S-f
(global-set-key (kbd "C-S-f") 'isearch-backward)
;      Go forward: Enter or F3:
;      Go backwars: S-Enter or S-F3:
(add-hook 'isearch-mode-hook
  (lambda ()
    (define-key isearch-mode-map (kbd "<RET>") 'isearch-repeat-forward)
    (define-key isearch-mode-map (kbd "<f3>") 'isearch-repeat-forward)
    (define-key isearch-mode-map (kbd "s-<RET>") 'isearch-repeat-backward)
    (define-key isearch-mode-map (kbd "S-<f3>") 'isearch-repeat-backward)
    (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
  )
)
(global-set-key (kbd "<f3>") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "s-<f3>")   'isearch-repeat-backward)

; For replace:
; Replace: C-r
;   y/Enter to replace this instance
;   C-a to raplace all
;   n to skip this one
;   Esc to quit
(global-set-key (kbd "C-r") 'query-replace)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [escape] 'exit)
(define-key query-replace-map [?\C-a] 'automatic)  ; Needs "?" ?

;(global-set-key (kbd "C-<tab>") 'previous-buffer)
;(global-set-key (kbd "M-<right>") 'previous-buffer)
;(global-set-key (kbd "C-S-<iso-lefttab>") 'next-buffer)
;(global-set-key (kbd "M-<left>") 'next-buffer)

; Go to the next tab: C-tab or M-right
(global-set-key (kbd "C-<tab>") 'tabbar-forward-tab)
(global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
; Go to the previous tab: C-S-tab or M-left
(global-set-key (kbd "C-S-<iso-lefttab>") 'tabbar-backward-tab)
(global-set-key (kbd "M-<left>") 'tabbar-backward-tab)

; Go to the next tab group: C-M-right
; Go to the previous tab group: C-M-left
(global-set-key (kbd "C-M-<right>") 'tabbar-forward-group)
(global-set-key (kbd "C-M-<left>") 'tabbar-backward-group)

; (global-set-key (kbd "M-1") "\C-x\C-b")

; Close split: C-0
; Maximize split: C-1
; Vertical split: C-3
; Horizontal split: C-4
(global-set-key (kbd "C-0") "\C-x0")
(global-set-key (kbd "C-1") "\C-x1")
(global-set-key (kbd "C-3") "\C-x3")
(global-set-key (kbd "C-2") "\C-x2")

; Kill buffer: C-F4
(global-set-key (kbd "C-<f4>") "\C-xk")

; Select all: C-a
(global-set-key (kbd "C-a") "\C-xh")

; Delete line: C-y
(global-set-key (kbd "C-y") 'kill-whole-line)

; Duplicate line: C-d
(global-set-key [delete] 'delete-char)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

(defun select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))

; Go to the next split: C-k
; Go to the previous split: C-j
(global-set-key (kbd "C-k") 'select-next-window)
(global-set-key (kbd "C-j")  'select-previous-window)

(defun my-mark-current-word ()
    "Put point at beginning of current word, set mark at end."
    (interactive)
    (let* ((opoint (point))
           (word (current-word))
           (word-length (length word)))
      (if (save-excursion
            ;; Avoid signaling error when moving beyond buffer.
            (if (> (point-min)  (- (point) word-length))
                (beginning-of-buffer)
              (forward-char (- (length word))))
            (search-forward word (+ opoint (length word))
                            'noerror))
          (progn (push-mark (match-end 0) nil t)
                 (goto-char (match-beginning 0)))
        (error "No word at point" word))))
; Select the current word: C-w
(global-set-key (kbd "C-w") 'my-mark-current-word)

; -----------------------------------------------------
; Tree view
; For Tree view:
; sudo apt-get install ecb
; sudo apt-get install ecb
;(setq ecb-tip-of-the-day nil)
;(ecb-activate)
;(defvar start-dir (getenv "PWD"))
;(defvar start-dir-name (car (last (split-string start-dir "/"))))
;(custom-set-variables
; '(agda2-include-dirs (quote ("." "/usr/lib/agda-stdlib/")))
; '(ecb-layout-name "left13")
; '(ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
; '(ecb-options-version "2.32")
; '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
; '(ecb-source-path (list (list start-dir start-dir-name)))
; '(ecb-tip-of-the-day nil)
; '(ecb-tree-buffer-style (quote ascii-guides))
; '(inhibit-startup-screen f))
; -----------------------------------------------------
(desktop-save-mode 1)
;(desktop-load-default)
;(desktop-read)
; The first  you save the state of the Emacs session, you must do it manually, with the command M-x desktop-save. Once you have done that, exiting Emacs will save the state again--not only the present Emacs session, but also subsequent sessions. You can also save the state at any , without exiting Emacs, by typing M-x desktop-save again.
; In order for Emacs to recover the state from a previous session, you must start it with the same current directory as you used when you started the previous session. This is because desktop-read looks in the current directory for the file to read. This means that you can have separate saved sessions in different directories; the directory in which you start Emacs will control which saved session to use.

; -----------------------------------------------------
; PVS keys
; Type check and prove: C-F9
(global-set-key (kbd "C-<f9>") "\M-xtypecheck-prove")

; Prove: S-F10
(global-set-key (kbd "S-<f10>") "\M-xprr")
; Prove single step: C-S-F10
(global-set-key (kbd "C-S-<f10>") "\C-c\C-ps")
; Prove theory: S-F11
(global-set-key (kbd "S-<f11>") "\C-c\C-pt")
; Prove importchain: S-F12
(global-set-key (kbd "S-<f12>") "\C-c\C-pi")
; Show prelude: F1
(global-set-key (kbd "<f1>") "\M-xvpf")
; Show declaration: S-F1
(global-set-key (kbd "S-<f1>") "\M-.")
; Show usages: A-F7
(global-set-key (kbd "M-<f7>") "\M-;")
; Show tccs: S-F8
(global-set-key (kbd "S-<f8>") "\M-xshow-tccs")
; Show theory status: C-S-F11
(global-set-key (kbd "C-S-<f11>") "\M-xstatus-proof-theory")
; Show import chain status: C-S-F12
(global-set-key (kbd "C-S-<f12>") "\M-xstatus-proofchain")

; Show the proof: S-F5
(global-set-key (kbd "S-<f5>") "\M-xshow-proof")
; Show the proof: C-F5
(global-set-key (kbd "C-<f5>") "\M-xinstall-proof")
; Show the xwindow: S-F6
(global-set-key (kbd "S-<f6>") "\M-xx-show-current-proof")


; This needs to be fixed
;(global-set-key (kbd "C-S-r") 'kill-and-restart-pvs)
;(defun kill-and-restart-pvs ()
;  (kill-buffer (get-buffer "*pvs*"))
;  (\M-xpvs))

; -----------------------------------------------------
; For swapping and hide-show splits! :)

(defun swap-window-positions ()         ; Stephen Gildea
   "*Swap the positions of this window and the next one."
   (interactive)
   (let ((other-window (next-window (selected-window) 'no-minibuf)))
     (let ((other-window-buffer (window-buffer other-window))
           (other-window-hscroll (window-hscroll other-window))
           (other-window-point (window-point other-window))
           (other-window-start (window-start other-window)))
       (set-window-buffer other-window (current-buffer))
       (set-window-hscroll other-window (window-hscroll (selected-window)))
       (set-window-point other-window (point))
       (set-window-start other-window (window-start (selected-window)))
       (set-window-buffer (selected-window) other-window-buffer)
       (set-window-hscroll (selected-window) other-window-hscroll)
       (set-window-point (selected-window) other-window-point)
       (set-window-start (selected-window) other-window-start))
     (select-window other-window)))

     
;(setq buffer-hidden nil)
(setq left-window-hidden nil)
(setq other-window nil)
(setq other-window-buffer nil)
(setq other-window-hscroll nil)
(setq other-window-point nil)
(setq other-window-start nil)
(setq this-window nil)
(setq this-window-buffer nil)
(setq this-window-hscroll nil)
(setq this-window-point nil)
(setq this-window-start nil)

(require 'windmove)

(defun hide-other-window ()
   (interactive)
   (setq other-window (next-window (selected-window) 'no-minibuf))
   (setq other-window-buffer (window-buffer other-window))
   (setq other-window-hscroll (window-hscroll other-window))
   (setq other-window-point (window-point other-window))
   (setq other-window-start (window-start other-window))

   (setq this-window (selected-window))
   (setq this-window-buffer (current-buffer))
   (setq this-window-hscroll (window-hscroll (selected-window)))
   (setq this-window-point (point))
   (setq this-window-start (window-start (selected-window)))

;   (setq buffer-hidden t)
    
   (if (or
         (eq
           (windmove-find-other-window 'left)
           other-window
         )
         (eq
           (windmove-find-other-window 'up)
           other-window
         )
       )         
       (setq left-window-hidden t)
       (setq left-window-hidden nil)
   )

   (delete-other-windows)   
)

(defun show-other-window ()
   (interactive)
   (split-window-horizontally)

   (let ((other-window (next-window (selected-window) 'no-minibuf)))
   
   (set-window-buffer other-window other-window-buffer)
   (set-window-hscroll other-window other-window-hscroll)
   (set-window-point other-window other-window-point)
   (set-window-start other-window other-window-start)

   (set-window-buffer (selected-window) this-window-buffer)
;   (set-window-hscroll (selected-window) this-window-hscroll)
;   (set-window-point (selected-window) this-window-point)
;   (set-window-start (selected-window) this-window-start)
   )

;   (setq buffer-hidden nil)
   
   (if (eq left-window-hidden t) (swap-window-positions))
   
;   (select-window other-window)
)

(defun hide-show-other-window ()
   (interactive)
   (if (or
         (eq
           (next-window (selected-window))
           (selected-window)
         )
         (eq
           (next-window (selected-window))
           (selected-window)
         )
       )         
      (show-other-window)
      (hide-other-window)
   )
;   (if (eq buffer-hidden t)
;       (show-other-window)
;       (hide-other-window)
;   )
)

(global-set-key (kbd "C-=") 'swap-window-positions)
(global-set-key (kbd "C--") 'hide-show-other-window)

; -----------------------------------------------------
; To prefer horizontal splits

;(setq split-height-threshold nil)
;(setq split-width-threshold 0)
;(setq display-buffer-reuse-frames t)

(set-scroll-bar-mode 'right)
; =====================================================
; Latex keys:
; So that it does not ask when rendering (confuses the shortcut key ?)
(setq preview-auto-cache-preamble nil)
; To make the images bigger
(setq preview-scale-function 1.2)


; Save before using these commands.
; Apply preview-latex: C-S-p
(global-set-key (kbd "C-S-p") "\C-c\C-p\C-d")
; Refresh item: F5
(global-set-key (kbd "<f5>") "\C-c\C-p\C-p")

; =====================================================
; Set font size
;The value is in 1/10pt, so 100 will give you 10pt, etc.
(set-face-attribute 'default nil :height 110)
; =====================================================


