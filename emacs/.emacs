;; Allow for access of MELPA repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Customize base GUI 
(hl-line-mode 1)
(display-battery-mode 1)
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-startup-screen t)
(add-hook 'prog-mode-hook 'linum-mode)

;; Allow for transparency toggle
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))

;; (global-set-key (kbd "C-c t") 'toggle-transparency)

;; Customize erc aestheic
(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 22) 
(erc-colorize-mode 1)

;; Changes to navigation
(windmove-default-keybindings)


;; PACKAGES FROM MELPA

;; Ace-window
(global-set-key (kbd "M-p") 'ace-window)

;; Auto-complete-mode
(add-hook 'prog-mode-hook 'auto-complete-mode)

;; ESS: emacs speaks statistics, mode for r scripts


;; Evil: extensible Vim layer, better keybindings
(require 'evil)
(evil-mode 1)

;; Evil-leader: changes leader key, shortcuts
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "r" 'ranger
  "k" 'kill-buffer
  "n" 'neotree
  "e" 'erc
  "/" 'split-window-right
  "x" 'delete-window
  "b" 'switch-to-buffer
  "f" 'toggle-frame-fullscreen
  "t" 'toggle-transparency
  "T" 'display-time-mode
  "q" 'save-buffers-kill-terminal)

;; Evil-vimish-fold: allows for persistent code folding across sessions
(require 'evil-vimish-fold)
(evil-vimish-fold-mode 1)

;; Helm: Incremental completion
(require 'helm-config)
(helm-mode 1)

;; Magit: package for managing git

;; Neotree; bring up working directory for easier file navigation
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)

;; pdf-tools: useful mode for viewing pdfs
;; deal with this later

;; Ranger: handy file search, navigation
;; (setq ranger-show-literal nil)
(setq ranger-cleanup-on-disable t)
(global-set-key (kbd "C-c s") 'ranger-toggle-scale-images)
(global-set-key (kbd "C-c l") 'ranger-toggle-literal)

;; which-key: shows further possible key commands after initiating a command 
(require 'which-key)
(which-key-mode 1)

;; autogenerated by emacs, generally don't bother with
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (nord)))
 '(custom-safe-themes
   (quote
    ("7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "858a353233c58b69dbe3a06087fc08905df2d8755a0921ad4c407865f17ab52f" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "e4859645a914c748b966a1fe53244ff9e043e00f21c5989c4a664d649838f6a3" default)))
 '(fringe-mode 0 nil (fringe))
 '(ranger-listing-dir-first nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
