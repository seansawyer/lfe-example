(defmodule lfe_example_app
  (export (start 2)
          (stop 1))
  (behaviour 'application))

;; Application callbacks

(defun start (start-type start-args)
  (: lfe_example_sup start_link))

(defun stop (state)
  'ok)