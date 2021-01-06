;;;; Am anfang des programms 
#lang racket

(require racket/trace)

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

(define liste '(1 2 3 4 5 6 7 8 9 10))
(define liste2 '(s -3.3 #t))
(define liste3 '(a b c '(#t #f #t)))

(print "Die Liste ist:")
(list? liste2)

(car liste)
(cdr liste)
(car(cdr liste))

(cadr liste)
(caddr liste)

;;;if-Statements
(define (weniger-als-zehn ubergabe)
    (if(< ubergabe 10) #t #f)
    (if(< ubergabe 10) "Yes" "No")
    )


;Übung 1
(define (Listenlänge lst)
    (if (equal? lst '()) 0 (+ 1 (Listenlänge(cdr lst))))
    )
;(trace Listenlänge)

;Übung 2 
(define (Summe-Liste lst)
    (if (equal? lst '()) 0 (+ (car lst ) (Summe-Liste(cdr lst))))
    )
(trace Summe-Liste)