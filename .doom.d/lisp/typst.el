;;; lisp/typst.el -*- lexical-binding: t; -*-
(require 'typst-ts-mode)
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))
