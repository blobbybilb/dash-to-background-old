#lang racket

(define data-dir "./data")

(unless (directory-exists? data-dir)
  (make-directory data-dir))


(define args (current-command-line-arguments))

; (define (start-command) ())

(println args)

(match (vector-ref args 0)
    ["hihi" 'hello]
    ["hi" 'hi]
    [_ 'else]
)

