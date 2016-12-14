(define myMember
  (lambda (a L)
    (cond ((null? L) #f)
          ((equal? a (car L)) L)
          (else (myMember a (cdr L)))
    )
  )
 )

(define myMemberAll
  (lambda (a L)
    (cond ((null? L) #f)
          ((equal? a (car L)) #t)
          ((list? (car L))
             (or (myMemberAll a (car L)) (myMemberAll a (cdr L))))
          (else (myMemberAll a (cdr L)))
    )
  )
 )

(define R
  (lambda (L)
    (cond ((null? L) L)
          (else (append (R (cdr L)) (list (car L)))))))

(define RA
  (lambda (L)
    (cond ((null? L) L)
          ((not (list? (car L)))(append (RA (cdr L)) (list (car L))))
          (else (append (RA (cdr L)) (list (RA (car L))))))))

(define replace
  (lambda (L)
    (cond ((null? L) L)
          ((equal? (car L) 'bad) (cons 'good (replace (cdr L))))
          (else (cons (car L) (replace (cdr L)))))))
