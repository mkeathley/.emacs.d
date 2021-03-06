(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

(with-eval-after-load 'evil-maps
  ;; window commands
  (define-key evil-window-map "j" 'evil-window-left)
  (define-key evil-window-map "k" 'evil-window-down)
  (define-key evil-window-map "l" 'evil-window-up)
  (define-key evil-window-map ";" 'evil-window-right)

  ;; motion commands
  (define-key evil-motion-state-map "j" 'evil-backward-char)
  (define-key evil-motion-state-map "k" 'evil-next-line)
  (define-key evil-motion-state-map "l" 'evil-previous-line)
  (define-key evil-motion-state-map ";" 'evil-forward-char)
  (define-key evil-motion-state-map "h" 'evil-repeat-find-char))
