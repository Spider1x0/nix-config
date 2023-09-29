;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)
;; Smooth scrolling
(setq smooth-scrolling-mode 1)
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;; Org Roam configuration
;;==================================================================================
(setq org-roam-directory "~/RoamVault")
(setq org-roam-capture-templates
      '(("d" "Default" plain
         "%?"
         :target(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "${title}\n")
         :unnarrowed t)

      ("b" "Books" plain
         "Hello world"
         :target(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "${title}\nAuthor: %^{Author}")
         :unnarrowed t)

      ("p" "Templates for pen 200 content")

      ("pl" "Lab machines for the 2023 course" plain
         "* %^{hostname} \n** Box Summary %? \n** Enumeration \n** Exploition \n** Privilege Escalation "
         :target(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "%^{hostname}\nIP Address: %^{IP-Address}")
         :unnarrowed t)

      ("pc" "PWK Course Chapters " plain
         :target(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "%^{Chapter-Name}\nIP Address: %^{IP-Address}")
         "*{hostname}\n %?"
         :unnarrowed t)


      ("o" "shirts" plain
         "Hello world"
         :target(file+head "%<%Y%m%d%H%M%S>-${slug}.org" "${title}\nAuthor: %^{Author}")
         :unnarrowed t)
      )

)

;;==================================================================================
;; Org bullet hings config
(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; Replace * with -
(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Beutifying Headings
  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
   '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))
;; Really Beutifying headings this time


;;Found the answer. Too obvious, but still annoying.

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.15))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
)



;;==================================================================================
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
