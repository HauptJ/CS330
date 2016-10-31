(define (countAtom x)
  (cond
      ((null? x) 0)
          (else (+ 1 (countAllAtom (cdr x))))))

(define (countAllAtom x)
  (cond
      ((null? x) 0)
          ((list? (car x))
          (+ (countAllAtom (car x))
          (countAllAtom (cdr x))))
          (else (+ 1 (countAllAtom (cdr x))))))

(define double7
  (lambda (x)
    (cond ((null? x) x)
          ((equal? (car x) 7) (cons (* 2 (car x)) (double7 (cdr x))))
              (else (cons (car x) (double7 (cdr x)))))))

(define doubleAll7
  (lambda (x)
    (cond ((null? x) x)
          ((list? (car x))
          (doubleAll7 (car x))
          (doubleAll7 (cdr x)))
          ((equal? (car x) 7) (cons (* 2 (car x)) (doubleAll7 (cdr x)))#t)
              (else (cons (car x) (double7 (cdr x)))))))