;;;; Guide von "Tech Tribe" https://www.youtube.com/watch?v=bq25PHiRVfM


;;;; Am anfang des programms 
#lang racket

(require racket/trace) ; damit kann man glaub ich verfolgen, wie etwas abgearbeitet wird


;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------


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


;;;sonstiges

(= 1 1) ; = Zeichen für Zahlen
(equal? 'liste 'liste) ; "equal?" für alles andere (zum beispiel wie hier zum verlgeichen von Listen)

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

(define liste '(1 2 3 4 5 6 7 8 9 10)) ;(define *Listenname* HOCHKOMNMA "'" (Inhalt1 Inhalt2 Inhalt3))
(define liste2 '(s -3.3 #t)) ;man kann die liste mit ganz viel komischen zeug voll laden

(print "Die Liste ist:") 
(list? liste2) ; checken, ob die liste erlaubt ist -> rückgabe #t (true) #f (false)

(define liste3 '(a b c '(#t #f #t))) ;Listen können listen enthalten

;;=======Hauptoperationen für listen======== 
;========car======== 
;übergibt das erste Element einer Liste

(car liste) ;hier wird 1 zurückgegeben

;========cdr========
;übergibt die restlichen elemente einer Liste 

(cdr liste) ;hier wird  2 3 ausgegeben

; =====cons=====
;hängt das objekt an den Anfang der liste 

(cons 1 '(2 3))

; ====Append=====
; verbinden von listen hintereinander

(append '(1 2 3)'(4 5 6))

(car(cdr liste)) ; hier wird das erste element der restliste ausgegeben

(cadr liste)
(caddr liste)




;;;if-Statements
;Syntax: (if (hier den vergleich einfügen)
;            (führe das aus)
;            (führe das andere aus))
(define (weniger-als-zehn ubergabe)
    (if(< ubergabe 10) #t #f)
    (if(< ubergabe 10) "Yes" "No") ; Man kann das ganze auch mit "Yes und No" machen
    (if(< ubergabe 10)
        "Yes"
        "No")
    )

;;;Rekursion

(define (sum lon)
  (cond 
  ((empty?)))
)


;;;; let 
(let ((a 10)
      (b 20)
      (c 30))
      (+ a b c))
;60 ergebnis

(let (( a +)
      (b * ))
      (a (b 10 20)(b 5 10)))
;Ergbenis 250


;;;; let*

(let* ((a 10)
        (b (+ a 20)))
        (* a b))
;Ergebnis 300