;;;; Guide von "Tech Tribe" https://www.youtube.com/watch?v=bq25PHiRVfM


;;;; Am anfang des programms 
#lang racket

(require racket/trace) ; damit kann man glaub ich verfolgen, wie etwas abgearbeitet wird

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

;;Hauptoperationen für listen 
;car <- übergibt das erste Element einer Liste
;cdr <- übergibt die restlichen elemente einer Liste 

(car liste) ;hier wird 1 zurückgegeben
(cdr liste) ;hier wird  2 3 ausgegeben
(car(cdr liste)) ; hier wird das erste element der restliste ausgegeben

(cadr liste)
(caddr liste)


;;;if-Statements
(define (weniger-als-zehn ubergabe)
    (if(< ubergabe 10) #t #f)
    (if(< ubergabe 10) "Yes" "No") ; Man kann das ganze auch mit "Yes und No" machen
    )

;;;Rekursion






;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------

;;;;Übung 1
(define (Listenlänge lst)
    (if (equal? lst '()) 0 (+ 1 (Listenlänge(cdr lst))))
    )
    ;; Wenn die Liste Leer ist dann gib 0 Zurück
    ;; Wenn aber die Liste != 0 ist, dann wissen wir, dass wir mindestens ein Element haben
    ;; und dann wir zu diesem Element, die Menge der Restlichen Listeninhalte addiert

(define (Listenlänge lst)
    (if (empty? lst) 0 (+ 1 (Listenlänge(cdr lst))))
    )
    ;; Vereinfachung mit "empty?" -> ist die liste Leer (Variante 2)

(trace Listenlänge) ;Damit würde man das hier bekommen

;>(Listenlänge '(1 2 3 4 5 6 7 8 9 10))
;> (Listenlänge '(2 3 4 5 6 7 8 9 10))
;> >(Listenlänge '(3 4 5 6 7 8 9 10))
;> > (Listenlänge '(4 5 6 7 8 9 10))
;> > >(Listenlänge '(5 6 7 8 9 10))
;> > > (Listenlänge '(6 7 8 9 10))
;> > > >(Listenlänge '(7 8 9 10))
;> > > > (Listenlänge '(8 9 10))
;> > > > >(Listenlänge '(9 10))
;> > > > > (Listenlänge '(10))
;> > > >[10] (Listenlänge '())
;< < < <[10] 0
;< < < < < 1
;< < < < <2
;< < < < 3
;< < < <4
;< < < 5
;< < <6
;< < 7
;< <8
;< 9
;<10
;10 



;;;; Übung 2
; Summe der Elemente einer Liste 

(define (Summe-Liste lst)
    (if (equal? lst '()) 0 (+ (car lst ) (Summe-Liste(cdr lst))))
    )
;(trace Summe-Liste)

;Wie funktioniert der ganze Spaß:
;man übergibt eine liste zu beginn 
;sollte die Liste leer sein, ist ja auch die summe = 0 und es würde 0 zurück gegeben werden
;wenn sie nicht 0 ist dann ruft sich die funktion wieder selbst auf und übergibt die komplette liste
;BIS AUF DAS ERSTE ELEMENT -> cdr
;Auch diese Liste wird wieder geprüft = 0 ?
;das passiert immer wieder, bist man dann "am Ende" der Liste angekommen ist (also die liste = 0 ist)
;und dann werden die jeweils ersten elemente der jeweilligen liste addiert

;nach meinem verständnis öffnet man viele instanzen der selben funktion immer und immer wieder,
;die dann miteinander interagieren
; (in diesem Fall addiert werden)

;>(Summe-Liste '(1 2 3 4 5 6 7 8 9 10))
;> (Summe-Liste '(2 3 4 5 6 7 8 9 10))
;> >(Summe-Liste '(3 4 5 6 7 8 9 10))
;> > (Summe-Liste '(4 5 6 7 8 9 10))
;> > >(Summe-Liste '(5 6 7 8 9 10))
;> > > (Summe-Liste '(6 7 8 9 10))
;> > > >(Summe-Liste '(7 8 9 10))
;> > > > (Summe-Liste '(8 9 10))
;> > > > >(Summe-Liste '(9 10))
;> > > > > (Summe-Liste '(10))
;> > > >[10] (Summe-Liste '())
;< < < <[10] 0
;< < < < < 10
;< < < < <19
;< < < < 27
;< < < <34
;< < < 40
;< < <45
;< < 49
;< <52
;< 54
;<55
;55