#!/usr/bin/env clisp

;; 234168

;; real0m0.068s
;; user0m0.048s
;; sys0m0.024s

(defvar limit)

(setq limit 1000)
(print (loop for i from 1 to limit
          when (or (= (mod i 3) 0)
                   (= (mod i 5) 0))
          sum i))
