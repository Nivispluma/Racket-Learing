#lang racket 

(require racket/trace)

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

;;;; Fibonacci Zahlenfolge

(define (fib zahl)
    (if (= zahl 0)
       0 ;Wenn die übergebene Zahl 0 ist, dann gebe 0 zurück
       (if (= zahl 1)
           1 ; Wenn die Übergebene Zahl 1 ist, dann gebe 1 zurück
           (+ (fib (- zahl 1)) (fib (- zahl 2)))  
       )                                         
    )                                            
)                                                

;Wenn die Übergebene Zahl > 1 ist dann addiere                                                
;fib(zahl - 1) + fib(zahl - 2)
;man ruft die Funktion also nochmal in sich selbst auf,
;mit veränderten Startwertensollte nun in dieser Instanz die Zahl 0 oder 1 sein
;werden die oben markierten werte zurückgegeben


(trace fib)


;;;=====Skalare Multiplikation=======
;Jedes Element einer Liste, mit einem bestimmten Faktor multiplizieren

#lang racket ;Standart scheiß am anfang 
(require racket/trace)


(define (skalar eingabe fak)
    (if (null? eingabe)
        eingabe
        (append (list(*(car eingabe) fak)) (skalar (cdr eingabe) fak))
    )
)

(trace skalar)

(skalar '(1 2 3) 5)

;;;=====Revert Liste====
;eine Liste Umdrehen

#lang racket ;Standart scheiß am anfang 
(require racket/trace)

(define (revert eingabe)
    (if (null? eingabe)
        eingabe
        (append (revert (cdr eingabe)) (list(car eingabe)))
    )
)

(trace revert)

(revert '(1 2 3 4 5 6 7))



;;;;============= Mergesort ================

;Aufteilen in unterschiedliche Listen

;Sortiert durch zusammenfügen

#lang racket

(require racket/trace)

(define (split listesplit)
    (if (= (car(listesplit)) 0)
        '()
        (if (= cdr(listesplit) 0)
            listesplit
            (let (
                (a (list(car listesplit)))
                )
            (cdr(listesplit))
            )
        )    
    )
)

(trace split)

(split '(1 2 3 4))

;===========================================================
;===========================================================
;===========================================================

;;;;============= Mergesort 2. Fick versuch ================

;Aufteilen in unterschiedliche Listen

;Sortiert durch zusammenfügen

(define (mix l1 l2)
  (if (null? l1)
      l2
      (if (null? l2)
          l1
          (cons (car l1)
                (cons (car l2)
                      (mix (cdr l1) (cdr l2)))))))


;;; Return the even-numbered elements of lst (starting with 0)

(define (split1 lst)
  (if (null? lst)
      lst
      (if (null? (cdr lst))
          lst
          (cons (car lst) (split1 (cdr (cdr lst)))))))


;;; Return the odd-numbered elements of lst (starting with 1)

(define (split2 lst)
  (if (null? lst)
      lst
      (if (null? (cdr lst))
          '()
          (cons (car (cdr lst)) (split2 (cdr (cdr lst)))))))

;;; Return sub-lists with even and odd elements

(define (split lst)
  (list (split1 lst) (split2 lst)))

  ;;; Merge two sorted lists of numbers into one sorted list

(define (merge lst1 lst2)
  (cond ((null? lst1)
         lst2)
        ((null? lst2)
         lst1)
        (#t
         (if (< (car lst1) (car lst2))
             (cons (car lst1) (merge (cdr lst1) lst2))
             (cons (car lst2) (merge lst1 (cdr lst2)))))))

;;; Sort a list (of numbers) using the merge-sort algorithm

(define (mergesort lst)
  (if (or (null? lst) (null? (cdr lst)))
      lst
      (let* ((splt (split lst))
             (srt1 (mergesort (car splt)))
             (srt2 (mergesort (car (cdr splt)))))
        (merge srt1 srt2))))

;===========================================================
;===========================================================
;===========================================================

;========= Skalarprodukt =========

#lang racket

(require racket/trace)

(define (skalar lst1 lst2)
    (apply + (map(lambda (x y) (* x y)) lst1 lst2))
)

;Macht beides das gleiche, aber die untere version ist kürzer. Und bei der obere ist das
;lambda überflüssig, weil es ja schon eine funktion für die multiplikation gibt -> (* x y)
;deshalb wäre die skalar2 funktion richtiger :D 

(define (skalar2 lst1 lst2)
    (apply + (map * lst1 lst2))
)

(skalar '(1 2 3) '(4 5 6))
(skalar '(5 8 1 3 4) '(10 66 3 5 -2))
(skalar '(2 3) '(5 6))

(skalar2 '(1 2 3) '(4 5 6))
(skalar2 '(5 8 1 3 4) '(10 66 3 5 -2))
(skalar2 '(2 3) '(5 6))