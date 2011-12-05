(defmodule lfe_example_sup
  (export (start_link 0))
  (export (init 1))
  (behaviour 'supervisor))

;; API

(defun start_link ()
  (: supervisor start_link 
    #(local lfe_example_sup)
    'lfe_example_sup
    '()))

;; Callbacks

(defun init (args)
  #(ok
    #( #(one_for_one 5 10)
       [#(lfe_example_server #(lfe_example_server start_link []) permanent 5000 worker [lfe_example_server])] ) ))