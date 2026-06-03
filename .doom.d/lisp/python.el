;;; lisp/python.el -*- lexical-binding: t; -*-

;; (setq-hook! 'python-mode-hook +python-format-with :ruff)
;; (setq-hook! 'python-ts-mode-hook +python-format-with :ruff)

(with-eval-after-load 'python
  (set-eglot-client! '(python-mode python-ts-mode) '("ty" "server")))
(with-eval-after-load 'python
  (set-formatter! 'ruff :modes '(python-mode python-ts-mode)))
