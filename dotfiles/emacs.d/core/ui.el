;;; ui.el --- UI optimizations and tweaks.


(diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;(menu-bar-mode 0)

;; Disable Scrollbar
(set-scroll-bar-mode 'nil)

;; Don't use OSX Native fullscreen mode
(setq ns-use-native-fullscreen nil)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; Customize line numbers
(setq linum-format 'dynamic)
(add-hook 'linum-before-numbering-hook
  (lambda ()
    (unless (display-graphic-p)
        (setq linum-format
          (lambda (line)
          (propertize
            (format
            (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
            (concat "%" (number-to-string w) "d ")) line)
            'face
            'linum))))))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(global-linum-mode t)
(global-visual-line-mode 1)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; use monokai as the default theme
(load-theme 'monokai t)


;; Set Emacs to start fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

(provide 'ui)
;;; ui.el ends here
