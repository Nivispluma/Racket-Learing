#lang racket

(require racket/trace)

(define (rekadd zahl1 zahl2)
  (if (< (rekadd zahl1 zahl2) 10)
    (+ (rekadd zahl1 zahl2) 10)
    (print("ALARM"))
  )
)

(trace rekadd)