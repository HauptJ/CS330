 (require racket/trace)

(define fg
  (λ (f g)
    (lambda (x) (f (g x)))))

(define ABS
   (lambda (n)
(if (> n 0) n (* -1 n))
  )
)

(define sum
   (lambda (L) 
      (cond ( (null? L) 0) ;; base case
	    ( else  (+ (car L) (sum (cdr L))))) ;; 
   )                         
)

;; Recursive part - private (sorta) function with additional argument to facilitate TLR
(define sumTR1
   (lambda (L curSum)
      (cond ( (null? L) curSum)
	    ( else (sumTR1 (cdr L) (+ curSum (car L)) )
))))

;; interface version – user does not need to know the implementation detail
(define sumTR
  (lambda (L) (sumTR1 L 0)))

(define total
   (lambda (L) 
      (cond ( (null? L) 0)
	    ( (list? (car L)) (+ (total (car L)) (total (cdr L))))
	    ( else  (+ (car L) (total (cdr L))))))                         
)




(define grade
  (lambda (average)
    (cond ((>= average 90) 'A) ;; 90 or above A
          ((>= average 80) 'B)
          ((>= average 70) 'C)
          ((>= average 60) 'D)
          (else 'F)
    ) ;; cond
   ) ;; lambda
)

;;Class Exercise – complete the following Fibonacci function (2 minute)
;;1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 ..... 

(define fib
  (lambda (n)

     (cond ((or (= n 1) (= n 2)) 1) ;; n=1, or 2, return what?

               (else (+ (fib (- n 1)) (fib (- n 2)) ))) ;; 	else return fib(n) which is fib(n-1)+fib(n-2)
  )
)
