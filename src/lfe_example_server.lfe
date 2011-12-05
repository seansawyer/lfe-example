(defmodule lfe_example_server
  (export (fib 1)
          (start_link 0))
  (export (code_change 3)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (init 1))
  (behaviour 'gen_server))

;; API functions

(defun fib (n)
  (: gen_server call 'lfe_example_server (tuple 'fib n)))

(defun start_link ()
  (: gen_server start_link #(local lfe_example_server) 'lfe_example_server () ()))

;; Callbacks

(defun code_change (_ state _)
  (tuple 'ok state))

(defun init (args)
  #(ok []))

(defun handle_call (((tuple 'fib n) _ state)
  (: error_logger info_msg '"Request: fib(~p)~n" '[n])
  (tuple 'reply (do_fib n) state)))

(defun handle_cast (req state)
  (: error_logger warn_msg '"Unexpected cast: ~p~n" '[req])
  #(ok state))

(defun handle_info (info state)
  (: error_logger warn_msg '"Unexpected cast: ~p~n" '[req])
  #(ok state))

(defun terminate (reason state)
  'ok)

;; Private functions

(defun do_fib (n)
  (cond ((== n 0) 0)
        ((== n 1) 1)
        (else (+ (do_fib (- n 1)) (do_fib (- n 2))))))