; (let* (variable list) (expression))
(let*   ; local variable declaration
  (
    (a 1)
    (b 2)
  )
  (+ a b)
)

; set value to a variable
(let* 
  (
    (Num 10)
  )
  (set! Num (+ Num Num))
)


; function
; (define (name param-list) (expression))
(define (Addition x y) (+ x y))

; list	'(a b c)
'() ; empty list 
()  ; also empty list
(let* 
  (
    (x '(a b c))
  )
)

(let* 
  (
    (x 
      '("GIMP" (1 2 3) ("is" ("great" () ) ) ) ; nested list, only one ' needed.
    )
  )
)
;; concatenation
(cons 1 '(2 3 4) )
;; list function
(let* (
        (a 1)
	(b 2)
	(c 3)
      )
      (list 5 4 3 a b c)
)
;; read list
(car '("first" 2 "third"))  ;; read the first element of a list (head)
(cdr '("first" 2 "third"))  ;; read the rest of the list (tail)
(cadar x) = (car (cdr (car x)))
(caadr x) = (car (car (cdr x)))
(cddr  x) = (cdr (cdr x))
