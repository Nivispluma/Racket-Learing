;;;; Am anfang des programms 
#lang racket
(print "Hello")

;;;
;;
; nach einer line
#||
multi line kommentar
||#


;;;Arithmetische operationen
(+ 1 2)
(- 7 9)
(* 2 3.5)
(/ 4 2)
(print "Arithmetic operations")

;;;Logic gates
(and #t #f)
(and #t #t)
(or #t #f)
(not #t)
(print "Logic gates")

;;;definieren von variablen
(define *name* 2) ;(define *name der Variablen* wert der Variablen)
(define *hello* "world") ;geht mit string, int etc.
(print *hello*)
(+ *name* 3)

;;;Definieren einer Funktion
(define (*verdopplung* nummer) ;(define (*name der Funktion* Argument Argument ...) 
  (* 2 nummer));;;; dann kommen weitere anweisungen

(define (*Addieren* nummer1 nummer2)
  (+ nummer1 nummer2)
  )

;;;;Listen

liste '(1 2 3)